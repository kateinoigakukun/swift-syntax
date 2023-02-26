//===----------------------------------------------------------------------===//
//
// This source file is part of the Swift.org open source project
//
// Copyright (c) 2014 - 2023 Apple Inc. and the Swift project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See https://swift.org/LICENSE.txt for license information
// See https://swift.org/CONTRIBUTORS.txt for the list of Swift project authors
//
//===----------------------------------------------------------------------===//

@_spi(RawSyntax) import SwiftSyntax

extension Parser {
  private enum IfConfigContinuationClauseStartKeyword: TokenSpecSet {
    case poundElseifKeyword
    case poundElseKeyword

    var spec: TokenSpec {
      switch self {
      case .poundElseifKeyword: return .poundElseifKeyword
      case .poundElseKeyword: return .poundElseKeyword
      }
    }

    init?(lexeme: Lexer.Lexeme) {
      switch PrepareForKeywordMatch(lexeme) {
      case TokenSpec(.poundElseifKeyword): self = .poundElseifKeyword
      case TokenSpec(.poundElseKeyword): self = .poundElseKeyword
      default: return nil
      }
    }
  }

  /// Parse a conditional compilation block.
  ///
  /// This function should be used to parse conditional compilation statements,
  /// declarations, and expressions. It is generic over the particular kind of
  /// parse that must occur for these elements, and allows a context-specific
  /// syntax kind to be emitted to collect the results. For example, declaration
  /// parsing parses items and collects the items into a `MemberDeclListSyntax`
  /// node.
  ///
  /// Grammar
  /// =======
  ///
  ///     conditional-compilation-block → if-directive-clause elseif-directive-clauses? else-directive-clause? endif-directive
  ///
  ///     if-directive-clause → if-directive compilation-condition statements?
  ///     elseif-directive-clauses → elseif-directive-clause elseif-directive-clauses?
  ///     elseif-directive-clause → elseif-directive compilation-condition statements?
  ///     else-directive-clause → else-directive statements?
  ///     if-directive → '#if'
  ///     elseif-directive → '#elseif'
  ///     else-directive → '#else'
  ///     endif-directive → '#endif'
  ///
  ///     compilation-condition → platform-condition
  ///     compilation-condition → identifier
  ///     compilation-condition → boolean-literal
  ///     compilation-condition → '(' compilation-condition ')'
  ///     compilation-condition → '!' compilation-condition
  ///     compilation-condition → compilation-condition '&&' compilation-condition
  ///     compilation-condition → compilation-condition '||' compilation-condition
  ///
  ///     platform-condition → 'os' '(' operating-system ')'
  ///     platform-condition → 'arch' '(' architecture ')'
  ///     platform-condition → 'swift' '(' '>=' swift-version ')' | 'swift' ( < swift-version )
  ///     platform-condition → 'compiler' '(' '>=' swift-version ')' | 'compiler' ( < swift-version )
  ///     platform-condition → 'canImport' '(' import-path ')'
  ///     platform-condition → 'targetEnvironment' '(' environment ')'
  ///
  ///     operating-system → 'macOS' | 'iOS' | 'watchOS' | 'tvOS' | 'Linux' | 'Windows'
  ///     architecture → 'i386' | 'x86_64' | 'arm' | 'arm64'
  ///     swift-version → decimal-digits swift-version-continuation?
  ///     swift-version-continuation → '.' decimal-digits swift-version-continuation?
  ///     environment → 'simulator' | 'macCatalyst'
  ///
  /// - Parameters:
  ///   - parseElement: Parse an element of the conditional compilation block.
  ///   - addSemicolonIfNeeded: If elements need to be separated by a newline, this
  ///                   allows the insertion of missing semicolons to the
  ///                   previous element.
  ///   - syntax: A function that aggregates the parsed conditional elements
  ///             into a syntax collection.
  @_spi(RawSyntax)
  public mutating func parsePoundIfDirective<Element: RawSyntaxNodeProtocol>(
    _ parseElement: (_ parser: inout Parser, _ isFirstElement: Bool) -> Element?,
    addSemicolonIfNeeded: (_ lastElement: Element, _ newItemAtStartOfLine: Bool, _ parser: inout Parser) -> Element? = { _, _, _ in nil },
    syntax: (inout Parser, [Element]) -> RawIfConfigClauseSyntax.Elements?
  ) -> RawIfConfigDeclSyntax {
    if let remainingTokens = remainingTokensIfMaximumNestingLevelReached() {
      return RawIfConfigDeclSyntax(
        remainingTokens,
        clauses: RawIfConfigClauseListSyntax(elements: [], arena: self.arena),
        poundEndif: missingToken(.poundEndifKeyword),
        arena: self.arena
      )
    }

    var clauses = [RawIfConfigClauseSyntax]()
    do {
      var firstIteration = true
      var loopProgress = LoopProgressCondition()
      while let poundIfHandle = firstIteration ? self.canRecoverTo(.poundIfKeyword) : self.canRecoverTo(anyIn: IfConfigContinuationClauseStartKeyword.self)?.handle,
        loopProgress.evaluate(self.currentToken)
      {
        var (unexpectedBeforePoundIf, poundIf) = self.eat(poundIfHandle)
        firstIteration = false
        // Parse the condition.
        let condition: RawExprSyntax?
        switch poundIf.tokenKind {
        case .poundIfKeyword, .poundElseifKeyword:
          condition = RawExprSyntax(self.parseSequenceExpression(.basic, forDirective: true))
        case .poundElseKeyword:
          if let ifToken = self.consume(if: .init(.if, allowAtStartOfLine: false)) {
            unexpectedBeforePoundIf = RawUnexpectedNodesSyntax(combining: unexpectedBeforePoundIf, poundIf, ifToken, arena: self.arena)
            poundIf = self.missingToken(.poundElseifKeyword)
            condition = RawExprSyntax(self.parseSequenceExpression(.basic, forDirective: true))
          } else {
            condition = nil
          }
        default:
          preconditionFailure("The loop condition should guarantee that we are at one of these tokens")
        }

        var elements = [Element]()
        do {
          var elementsProgress = LoopProgressCondition()
          while !self.at(.eof) && !self.at(.poundElseKeyword, .poundElseifKeyword, .poundEndifKeyword) && elementsProgress.evaluate(currentToken) {
            let newItemAtStartOfLine = self.currentToken.isAtStartOfLine
            guard let element = parseElement(&self, elements.isEmpty), !element.isEmpty else {
              break
            }
            if let lastElement = elements.last, let fixedUpLastItem = addSemicolonIfNeeded(lastElement, newItemAtStartOfLine, &self) {
              elements[elements.count - 1] = fixedUpLastItem
            }
            elements.append(element)
          }
        }

        clauses.append(
          RawIfConfigClauseSyntax(
            unexpectedBeforePoundIf,
            poundKeyword: poundIf,
            condition: condition,
            elements: syntax(&self, elements),
            arena: self.arena
          )
        )
      }
    }

    let (unexpectedBeforePoundEndIf, poundEndIf) = self.expect(.poundEndifKeyword)
    return RawIfConfigDeclSyntax(
      clauses: RawIfConfigClauseListSyntax(elements: clauses, arena: self.arena),
      unexpectedBeforePoundEndIf,
      poundEndif: poundEndIf,
      arena: self.arena
    )
  }
}

extension Parser {
  /// Parse a line control directive.
  ///
  /// Grammar
  /// =======
  ///
  ///     line-control-statement → '#sourceLocation' '(' 'file' ':' file-path ',' 'line' ':' line-number ')'
  ///     line-control-statement → '#sourceLocation' '(' ')'
  ///     line-number → `A decimal integer greater than zero`
  ///     file-path → static-string-literal
  @_spi(RawSyntax)
  public mutating func parsePoundSourceLocationDirective() -> RawPoundSourceLocationSyntax {
    let line = self.consumeAnyToken()
    let (unexpectedBeforeLParen, lparen) = self.expect(.leftParen)
    let args: RawPoundSourceLocationArgsSyntax?
    if !self.at(.rightParen) {
      let (unexpectedBeforeFile, file) = self.expect(.keyword(.file))
      let (unexpectedBeforeFileColon, fileColon) = self.expect(.colon)
      let fileName = self.parseStringLiteral()
      let (unexpectedBeforeComma, comma) = self.expect(.comma)

      let (unexpectedBeforeLine, line) = self.expect(.keyword(.line))
      let (unexpectedBeforeLineColon, lineColon) = self.expect(.colon)
      let lineNumber = self.expectWithoutRecovery(.integerLiteral)

      args = RawPoundSourceLocationArgsSyntax(
        unexpectedBeforeFile,
        fileArgLabel: file,
        unexpectedBeforeFileColon,
        fileArgColon: fileColon,
        fileName: fileName,
        unexpectedBeforeComma,
        comma: comma,
        unexpectedBeforeLine,
        lineArgLabel: line,
        unexpectedBeforeLineColon,
        lineArgColon: lineColon,
        lineNumber: lineNumber,
        arena: self.arena
      )
    } else {
      args = nil
    }
    let (unexpectedBeforeRParen, rparen) = self.expect(.rightParen)
    return RawPoundSourceLocationSyntax(
      poundSourceLocation: line,
      unexpectedBeforeLParen,
      leftParen: lparen,
      args: args,
      unexpectedBeforeRParen,
      rightParen: rparen,
      arena: self.arena
    )
  }
}
