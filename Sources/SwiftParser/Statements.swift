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

extension TokenConsumer {
  /// Returns `true` if the current token represents the start of a statement
  /// item.
  ///
  /// - Note: This function must be kept in sync with `parseStatement()`.
  /// - Seealso: ``Parser/parseStatement()``
  func atStartOfStatement(allowRecovery: Bool = false) -> Bool {
    var lookahead = self.lookahead()
    if allowRecovery {
      // Attributes are not allowed on statements. But for recovery, skip over
      // misplaced attributes.
      _ = lookahead.consumeAttributeList()
    }
    return lookahead.isStartOfStatement(allowRecovery: allowRecovery)
  }
}

extension Parser.Lookahead {
  mutating func atStartOfSwitchCaseItem() -> Bool {
    while self.consume(if: .atSign) != nil {
      self.consume(if: .identifier)
    }

    return self.at(anyIn: SwitchCaseStart.self) != nil
  }
}

extension Parser {
  /// Parse a statement.
  ///
  /// This function is meant to be invoked as part of parsing an item. As such
  /// it does not deal with parsing expressions, declarations, or consuming
  /// any trailing semicolons.
  ///
  /// Grammar
  /// =======
  ///
  ///     statement → loop-statement ';'?
  ///     statement → branch-statement ';'?
  ///     statement → labeled-statement ';'?
  ///     statement → control-transfer-statement ';'?
  ///     statement → defer-statement ';'?
  ///     statement → do-statement ';'?
  ///     statement → forget-statement ';'?
  ///
  ///     loop-statement → for-in-statement
  ///     loop-statement → while-statement
  ///     loop-statement → repeat-while-statement
  ///
  ///     branch-statement → if-statement
  ///     branch-statement → guard-statement
  ///     branch-statement → switch-statement
  ///
  ///     labeled-statement → statement-label loop-statement
  ///     labeled-statement → statement-label if-statement
  ///     labeled-statement → statement-label switch-statement
  ///     labeled-statement → statement-label do-statement
  ///
  ///     control-transfer-statement → break-statement
  ///     control-transfer-statement → continue-statement
  ///     control-transfer-statement → fallthrough-statement
  ///     control-transfer-statement → return-statement
  ///     control-transfer-statement → throw-statement
  @_spi(RawSyntax)
  public mutating func parseStatement() -> RawStmtSyntax {
    // If this is a label on a loop/switch statement, consume it and pass it into
    // parsing logic below.
    func label<S: RawStmtSyntaxNodeProtocol>(_ stmt: S, with label: Parser.StatementLabel?) -> RawStmtSyntax {
      guard let label = label else {
        return RawStmtSyntax(stmt)
      }
      return RawStmtSyntax(
        RawLabeledStmtSyntax(
          labelName: label.label,
          labelColon: label.colon,
          statement: RawStmtSyntax(stmt),
          arena: self.arena
        )
      )
    }

    let optLabel = self.parseOptionalStatementLabel()
    switch self.canRecoverTo(anyIn: CanBeStatementStart.self) {
    case (.forKeyword, let handle)?:
      return label(self.parseForEachStatement(forHandle: handle), with: optLabel)
    case (.whileKeyword, let handle)?:
      return label(self.parseWhileStatement(whileHandle: handle), with: optLabel)
    case (.repeatKeyword, let handle)?:
      return label(self.parseRepeatWhileStatement(repeatHandle: handle), with: optLabel)

    case (.ifKeyword, let handle)?:
      let ifExpr = self.parseIfExpression(ifHandle: handle)
      let ifStmt = RawExpressionStmtSyntax(
        expression: RawExprSyntax(ifExpr),
        arena: self.arena
      )
      return label(ifStmt, with: optLabel)
    case (.guardKeyword, let handle)?:
      return label(self.parseGuardStatement(guardHandle: handle), with: optLabel)
    case (.switchKeyword, let handle)?:
      let switchExpr = self.parseSwitchExpression(switchHandle: handle)
      let switchStmt = RawExpressionStmtSyntax(
        expression: RawExprSyntax(switchExpr),
        arena: self.arena
      )
      return label(switchStmt, with: optLabel)
    case (.breakKeyword, let handle)?:
      return label(self.parseBreakStatement(breakHandle: handle), with: optLabel)
    case (.continueKeyword, let handle)?:
      return label(self.parseContinueStatement(continueHandle: handle), with: optLabel)
    case (.fallthroughKeyword, let handle)?:
      return label(self.parseFallthroughStatement(fallthroughHandle: handle), with: optLabel)
    case (.forgetKeyword, let handle)?:
      return label(self.parseForgetStatement(forgetHandle: handle), with: optLabel)
    case (.returnKeyword, let handle)?:
      return label(self.parseReturnStatement(returnHandle: handle), with: optLabel)
    case (.throwKeyword, let handle)?:
      return label(self.parseThrowStatement(throwHandle: handle), with: optLabel)
    case (.deferKeyword, let handle)?:
      return label(self.parseDeferStatement(deferHandle: handle), with: optLabel)
    case (.doKeyword, let handle)?:
      return label(self.parseDoStatement(doHandle: handle), with: optLabel)
    case (.yield, let handle)?:
      return label(self.parseYieldStatement(yieldHandle: handle), with: optLabel)
    case nil:
      let missingStmt = RawStmtSyntax(RawMissingStmtSyntax(arena: self.arena))
      return label(missingStmt, with: optLabel)
    }
  }
}

// MARK: Conditional Statements

extension Parser {
  /// Parse a guard statement.
  ///
  /// Grammar
  /// =======
  ///
  ///     guard-statement → 'guard' condition-list 'else' code-block
  @_spi(RawSyntax)
  public mutating func parseGuardStatement(guardHandle: RecoveryConsumptionHandle) -> RawGuardStmtSyntax {
    let (unexpectedBeforeGuardKeyword, guardKeyword) = self.eat(guardHandle)
    let conditions = self.parseConditionList()
    let (unexpectedBeforeElseKeyword, elseKeyword) = self.expect(.keyword(.else))
    let body = self.parseCodeBlock(introducer: guardKeyword)
    return RawGuardStmtSyntax(
      unexpectedBeforeGuardKeyword,
      guardKeyword: guardKeyword,
      conditions: conditions,
      unexpectedBeforeElseKeyword,
      elseKeyword: elseKeyword,
      body: body,
      arena: self.arena
    )
  }
}

extension Parser {
  /// Parse a list of condition elements.
  ///
  /// Grammar
  /// =======
  ///
  ///     condition-list → condition | condition , condition-list
  @_spi(RawSyntax)
  public mutating func parseConditionList() -> RawConditionElementListSyntax {
    // We have a simple comma separated list of clauses, but also need to handle
    // a variety of common errors situations (including migrating from Swift 2
    // syntax).
    var elements = [RawConditionElementSyntax]()
    var keepGoing: RawTokenSyntax? = nil
    var loopProgress = LoopProgressCondition()
    repeat {
      let condition = self.parseConditionElement()
      let unexpectedBeforeKeepGoing: RawUnexpectedNodesSyntax?
      keepGoing = self.consume(if: .comma)
      if keepGoing == nil, let andOperator = self.consumeIfContextualPunctuator("&&") {
        unexpectedBeforeKeepGoing = RawUnexpectedNodesSyntax([andOperator], arena: self.arena)
        keepGoing = missingToken(.comma)
      } else {
        unexpectedBeforeKeepGoing = nil
      }
      elements.append(
        RawConditionElementSyntax(
          condition: condition,
          unexpectedBeforeKeepGoing,
          trailingComma: keepGoing,
          arena: self.arena
        )
      )
    } while keepGoing != nil && loopProgress.evaluate(currentToken)

    return RawConditionElementListSyntax(elements: elements, arena: self.arena)
  }

  /// Parse a condition element.
  ///
  /// Grammar
  /// =======
  ///
  ///     condition → expression | availability-condition | case-condition | optional-binding-condition
  ///
  ///     case-condition → 'case' pattern initializer
  ///     optional-binding-condition → 'let' pattern initializer? | 'var' pattern initializer? |
  ///                                  'inout' pattern initializer?
  @_spi(RawSyntax)
  public mutating func parseConditionElement() -> RawConditionElementSyntax.Condition {
    // Parse a leading #available/#unavailable condition if present.
    if self.at(.poundAvailableKeyword, .poundUnavailableKeyword) {
      return self.parsePoundAvailableConditionElement()
    }

    // Parse the basic expression case.  If we have a leading let, var, inout,
    // borrow, case keyword or an assignment, then we know this is a binding.
    guard self.at(.keyword(.let), .keyword(.var), .keyword(.case)) || self.at(.keyword(.inout)) else {
      // If we lack it, then this is theoretically a boolean condition.
      // However, we also need to handle migrating from Swift 2 syntax, in
      // which a comma followed by an expression could actually be a pattern
      // clause followed by a binding.  Determine what we have by checking for a
      // syntactically valid pattern followed by an '=', which can never be a
      // boolean condition.
      //
      // However, if this is the first clause, and we see "x = y", then this is
      // almost certainly a typo for '==' and definitely not a continuation of
      // another clause, so parse it as an expression.  This also avoids
      // lookahead + backtracking on simple if conditions that are obviously
      // boolean conditions.
      return .expression(self.parseExpression(.basic))
    }

    // We're parsing a conditional binding.
    precondition(self.at(.keyword(.let), .keyword(.var)) || self.at(.keyword(.inout), .keyword(.case)))
    enum BindingKind {
      case pattern(RawTokenSyntax, RawPatternSyntax)
      case optional(RawTokenSyntax, RawPatternSyntax)
    }

    let kind: BindingKind
    if let caseKeyword = self.consume(if: .keyword(.case)) {
      let pattern = self.parseMatchingPattern(context: .matching)
      kind = .pattern(caseKeyword, pattern)
    } else {
      let letOrVar = self.consumeAnyToken()
      let pattern = self.parseMatchingPattern(context: .bindingIntroducer)
      kind = .optional(letOrVar, pattern)
    }

    // Now parse an optional type annotation.
    let annotation: RawTypeAnnotationSyntax?
    if let colon = self.consume(if: .colon) {
      let type = self.parseType()
      annotation = RawTypeAnnotationSyntax(
        colon: colon,
        type: type,
        arena: self.arena
      )
    } else {
      annotation = nil
    }

    // Conditional bindings can have the format:
    //  `let newBinding = <expr>`, or
    //  `let newBinding`, which is shorthand for `let newBinding = newBinding`
    let initializer: RawInitializerClauseSyntax?
    if let eq = self.consume(if: .equal) {
      let value = self.parseExpression(.basic)
      initializer = RawInitializerClauseSyntax(
        equal: eq,
        value: value,
        arena: self.arena
      )
    } else {
      initializer = nil
    }

    switch kind {
    case let .optional(bindingKeyword, pattern):
      return .optionalBinding(
        RawOptionalBindingConditionSyntax(
          bindingKeyword: bindingKeyword,
          pattern: pattern,
          typeAnnotation: annotation,
          initializer: initializer,
          arena: self.arena
        )
      )
    case let .pattern(caseKeyword, pattern):
      return .matchingPattern(
        RawMatchingPatternConditionSyntax(
          caseKeyword: caseKeyword,
          pattern: pattern,
          typeAnnotation: annotation,
          initializer: initializer
            ?? RawInitializerClauseSyntax(
              equal: RawTokenSyntax(missing: .equal, arena: self.arena),
              value: RawExprSyntax(RawMissingExprSyntax(arena: self.arena)),
              arena: self.arena
            ),
          arena: self.arena
        )
      )
    }
  }

  /// Parse an availability condition.
  ///
  /// Grammar
  /// =======
  ///
  ///     availability-condition → '#available' '(' availability-arguments ')'
  ///     availability-condition → '#unavailable' '(' availability-arguments ')'
  @_spi(RawSyntax)
  public mutating func parsePoundAvailableConditionElement() -> RawConditionElementSyntax.Condition {
    precondition(self.at(.poundAvailableKeyword, .poundUnavailableKeyword))
    let keyword = self.consumeAnyToken()
    let (unexpectedBeforeLParen, lparen) = self.expect(.leftParen)
    let spec = self.parseAvailabilitySpecList()
    let (unexpectedBeforeRParen, rparen) = self.expect(.rightParen)
    return .availability(
      RawAvailabilityConditionSyntax(
        availabilityKeyword: keyword,
        unexpectedBeforeLParen,
        leftParen: lparen,
        availabilitySpec: spec,
        unexpectedBeforeRParen,
        rightParen: rparen,
        arena: self.arena
      )
    )
  }
}

// MARK: Throw Statements

extension Parser {
  /// Parse a throw statement.
  ///
  /// Grammar
  /// =======
  ///
  ///     throw-statement → 'throw' expression
  @_spi(RawSyntax)
  public mutating func parseThrowStatement(throwHandle: RecoveryConsumptionHandle) -> RawThrowStmtSyntax {
    let (unexpectedBeforeThrowKeyword, throwKeyword) = self.eat(throwHandle)
    let hasMisplacedTry = unexpectedBeforeThrowKeyword?.containsToken(where: { TokenSpec(.try) ~= $0 }) ?? false
    var expr = self.parseExpression()
    if hasMisplacedTry && !expr.is(RawTryExprSyntax.self) {
      expr = RawExprSyntax(
        RawTryExprSyntax(
          tryKeyword: missingToken(.try),
          questionOrExclamationMark: nil,
          expression: expr,
          arena: self.arena
        )
      )
    }
    return RawThrowStmtSyntax(
      unexpectedBeforeThrowKeyword,
      throwKeyword: throwKeyword,
      expression: expr,
      arena: self.arena
    )
  }
}

// MARK: Forget Statements

extension Parser {
  /// Parse a forget statement.
  ///
  /// Grammar
  /// =======
  ///
  ///     forget-statement → 'forget' expression
  @_spi(RawSyntax)
  public mutating func parseForgetStatement(forgetHandle: RecoveryConsumptionHandle) -> RawForgetStmtSyntax {
    let (unexpectedBeforeForgetKeyword, forgetKeyword) = self.eat(forgetHandle)
    let expr = self.parseExpression()
    return RawForgetStmtSyntax(
      unexpectedBeforeForgetKeyword,
      forgetKeyword: forgetKeyword,
      expression: expr,
      arena: self.arena
    )
  }
}

// MARK: Defer Statements

extension Parser {
  /// Parse a defer statement.
  ///
  /// Grammar
  /// =======
  ///
  ///     defer-statement → 'defer' code-block
  @_spi(RawSyntax)
  public mutating func parseDeferStatement(deferHandle: RecoveryConsumptionHandle) -> RawDeferStmtSyntax {
    let (unexpectedBeforeDeferKeyword, deferKeyword) = self.eat(deferHandle)
    let items = self.parseCodeBlock(introducer: deferKeyword)
    return RawDeferStmtSyntax(
      unexpectedBeforeDeferKeyword,
      deferKeyword: deferKeyword,
      body: items,
      arena: self.arena
    )
  }
}

// MARK: Do-Catch Statements

extension Parser {
  /// Parse a do statement.
  ///
  /// Grammar
  /// =======
  ///
  ///     do-statement → 'do' code-block catch-clauses?
  @_spi(RawSyntax)
  public mutating func parseDoStatement(doHandle: RecoveryConsumptionHandle) -> RawDoStmtSyntax {
    let (unexpectedBeforeDoKeyword, doKeyword) = self.eat(doHandle)
    let body = self.parseCodeBlock(introducer: doKeyword)

    // If the next token is 'catch', this is a 'do'/'catch' statement.
    var elements = [RawCatchClauseSyntax]()
    var loopProgress = LoopProgressCondition()
    while self.at(.keyword(.catch)) && loopProgress.evaluate(self.currentToken) {
      // Parse 'catch' clauses
      elements.append(self.parseCatchClause())
    }

    return RawDoStmtSyntax(
      unexpectedBeforeDoKeyword,
      doKeyword: doKeyword,
      body: body,
      catchClauses: elements.isEmpty ? nil : RawCatchClauseListSyntax(elements: elements, arena: self.arena),
      arena: self.arena
    )
  }

  /// Parse a catch statement.
  ///
  /// - Note: This is not a "first class" statement it can only appear
  /// following a 'do' statement.
  ///
  /// Grammar
  /// =======
  ///
  ///     catch-clauses → catch-clause catch-clauses?
  ///     catch-clause → catch catch-pattern-list? code-block
  ///     catch-pattern-list → catch-pattern | catch-pattern ',' catch-pattern-list
  @_spi(RawSyntax)
  public mutating func parseCatchClause() -> RawCatchClauseSyntax {
    let (unexpectedBeforeCatchKeyword, catchKeyword) = self.expect(.keyword(.catch))
    var catchItems = [RawCatchItemSyntax]()
    if !self.at(.leftBrace) {
      var keepGoing: RawTokenSyntax? = nil
      var loopProgress = LoopProgressCondition()
      repeat {
        let (pattern, whereClause) = self.parseGuardedCatchPattern()
        keepGoing = self.consume(if: .comma)
        catchItems.append(
          RawCatchItemSyntax(
            pattern: pattern,
            whereClause: whereClause,
            trailingComma: keepGoing,
            arena: self.arena
          )
        )
      } while keepGoing != nil && loopProgress.evaluate(currentToken)
    }
    let body = self.parseCodeBlock(introducer: catchKeyword)
    return RawCatchClauseSyntax(
      unexpectedBeforeCatchKeyword,
      catchKeyword: catchKeyword,
      catchItems: catchItems.isEmpty ? nil : RawCatchItemListSyntax(elements: catchItems, arena: self.arena),
      body: body,
      arena: self.arena
    )
  }

  /// Parse a pattern-matching clause for a catch statement,
  /// including the guard expression.
  ///
  /// Grammar
  /// =======
  ///
  ///     catch-pattern → pattern where-clause?
  private mutating func parseGuardedCatchPattern() -> (RawPatternSyntax?, RawWhereClauseSyntax?) {
    // If this is a 'catch' clause and we have "catch {" or "catch where...",
    // then we get an implicit "let error" pattern.
    let pattern: RawPatternSyntax?
    if self.at(.leftBrace, .keyword(.where)) {
      pattern = nil
    } else {
      pattern = self.parseMatchingPattern(context: .matching)
    }

    // Parse the optional 'where' guard.
    let whereClause: RawWhereClauseSyntax?
    if let whereKeyword = self.consume(if: .keyword(.where)) {
      let guardExpr = self.parseExpression(.basic)
      whereClause = RawWhereClauseSyntax(
        whereKeyword: whereKeyword,
        guardResult: guardExpr,
        arena: self.arena
      )
    } else {
      whereClause = nil
    }
    return (pattern, whereClause)
  }
}

// MARK: Iteration Statements

extension Parser {
  /// Parse a while statement.
  ///
  /// Grammar
  /// =======
  ///
  ///     while-statement → 'while' condition-list code-block
  @_spi(RawSyntax)
  public mutating func parseWhileStatement(whileHandle: RecoveryConsumptionHandle) -> RawWhileStmtSyntax {
    let (unexpectedBeforeWhileKeyword, whileKeyword) = self.eat(whileHandle)
    let conditions: RawConditionElementListSyntax

    if self.at(.leftBrace) {
      conditions = RawConditionElementListSyntax(
        elements: [
          RawConditionElementSyntax(
            condition: .expression(RawExprSyntax(RawMissingExprSyntax(arena: self.arena))),
            trailingComma: nil,
            arena: self.arena
          )
        ],
        arena: self.arena
      )
    } else {
      conditions = self.parseConditionList()
    }
    let body = self.parseCodeBlock(introducer: whileKeyword)
    return RawWhileStmtSyntax(
      unexpectedBeforeWhileKeyword,
      whileKeyword: whileKeyword,
      conditions: conditions,
      body: body,
      arena: self.arena
    )
  }
}

extension Parser {
  /// Parse a repeat-while statement.
  ///
  /// Grammar
  /// =======
  ///
  ///     repeat-while-statement → 'repeat' code-block 'while' expression
  @_spi(RawSyntax)
  public mutating func parseRepeatWhileStatement(repeatHandle: RecoveryConsumptionHandle) -> RawRepeatWhileStmtSyntax {
    let (unexpectedBeforeRepeatKeyword, repeatKeyword) = self.eat(repeatHandle)
    let body = self.parseCodeBlock(introducer: repeatKeyword)
    let (unexpectedBeforeWhileKeyword, whileKeyword) = self.expect(.keyword(.while))
    let condition = self.parseExpression()
    return RawRepeatWhileStmtSyntax(
      unexpectedBeforeRepeatKeyword,
      repeatKeyword: repeatKeyword,
      body: body,
      unexpectedBeforeWhileKeyword,
      whileKeyword: whileKeyword,
      condition: condition,
      arena: self.arena
    )
  }
}

// MARK: For-Each Statements

extension Parser {
  /// Parse a for-in statement.
  ///
  /// Grammar
  /// =======
  ///
  ///     for-in-statement → 'for' 'case'? pattern 'in' expression where-clause? code-block
  @_spi(RawSyntax)
  public mutating func parseForEachStatement(forHandle: RecoveryConsumptionHandle) -> RawForInStmtSyntax {
    let (unexpectedBeforeForKeyword, forKeyword) = self.eat(forHandle)
    let tryKeyword = self.consume(if: .keyword(.try))

    let awaitKeyword = self.consume(if: .keyword(.await))

    // Parse the pattern.  This is either 'case <refutable pattern>' or just a
    // normal pattern.
    let caseKeyword = self.consume(if: .keyword(.case))
    let pattern: RawPatternSyntax
    let type: RawTypeAnnotationSyntax?
    if caseKeyword != nil {
      pattern = self.parseMatchingPattern(context: .matching)
      // Now parse an optional type annotation.
      if let colon = self.consume(if: .colon) {
        let resultType = self.parseType()
        type = RawTypeAnnotationSyntax(
          colon: colon,
          type: resultType,
          arena: self.arena
        )
      } else {
        type = nil
      }
    } else {
      (pattern, type) = self.parseTypedPattern(allowRecoveryFromMissingColon: false)
    }

    let (unexpectedBeforeInKeyword, inKeyword) = self.expect(.keyword(.in))

    // If there is no expression, like `switch { default: return false }` then left brace would parsed as
    // a `RawClosureExprSyntax` in the condition, which is most likely not what the user meant.
    // Create a missing condition instead and use the `{` for the start of the body.
    let expr: RawExprSyntax
    if self.at(.leftBrace) {
      expr = RawExprSyntax(RawMissingExprSyntax(arena: self.arena))
    } else {
      expr = self.parseExpression(.basic)
    }

    // Parse the 'where' expression if present.
    let whereClause: RawWhereClauseSyntax?
    if let whereKeyword = self.consume(if: .keyword(.where)) {
      let guardExpr = self.parseExpression(.basic)
      whereClause = RawWhereClauseSyntax(
        whereKeyword: whereKeyword,
        guardResult: guardExpr,
        arena: self.arena
      )
    } else {
      whereClause = nil
    }

    // stmt-brace
    let body = self.parseCodeBlock(introducer: forKeyword)
    return RawForInStmtSyntax(
      unexpectedBeforeForKeyword,
      forKeyword: forKeyword,
      tryKeyword: tryKeyword,
      awaitKeyword: awaitKeyword,
      caseKeyword: caseKeyword,
      pattern: pattern,
      typeAnnotation: type,
      unexpectedBeforeInKeyword,
      inKeyword: inKeyword,
      sequenceExpr: expr,
      whereClause: whereClause,
      body: body,
      arena: self.arena
    )
  }
}

// MARK: Control Transfer Statements

extension Parser {
  private mutating func isStartOfReturnExpr() -> Bool {
    enum NotReturnExprStart: TokenSpecSet {
      case rightBrace
      case `case`
      case `default`
      case semicolon
      case poundIfKeyword
      case poundEndifKeyword
      case poundElseKeyword
      case poundElseifKeyword
      case eof

      init?(lexeme: Lexer.Lexeme) {
        switch PrepareForKeywordMatch(lexeme) {
        case TokenSpec(.rightBrace): self = .rightBrace
        case TokenSpec(.case): self = .case
        case TokenSpec(.default): self = .default
        case TokenSpec(.semicolon): self = .semicolon
        case TokenSpec(.poundIfKeyword): self = .poundIfKeyword
        case TokenSpec(.poundEndifKeyword): self = .poundEndifKeyword
        case TokenSpec(.poundElseKeyword): self = .poundElseKeyword
        case TokenSpec(.poundElseifKeyword): self = .poundElseifKeyword
        case TokenSpec(.eof): self = .eof
        default: return nil
        }
      }

      var spec: TokenSpec {
        switch self {
        case .rightBrace: return .rightBrace
        case .case: return .keyword(.case)
        case .default: return .keyword(.default)
        case .semicolon: return .semicolon
        case .poundIfKeyword: return .poundIfKeyword
        case .poundEndifKeyword: return .poundEndifKeyword
        case .poundElseKeyword: return .poundElseKeyword
        case .poundElseifKeyword: return .poundElseifKeyword
        case .eof: return .eof
        }
      }
    }

    if self.at(anyIn: NotReturnExprStart.self) != nil {
      return false
    }
    // Allowed for if/switch expressions.
    if self.at(anyIn: IfOrSwitch.self) != nil {
      return true
    }
    if self.atStartOfStatement() || self.atStartOfDeclaration() {
      return false
    }
    return true
  }

  /// Parse a return statement
  ///
  /// Grammar
  /// =======
  ///
  ///     return-statement → 'return' expression?
  @_spi(RawSyntax)
  public mutating func parseReturnStatement(returnHandle: RecoveryConsumptionHandle) -> RawReturnStmtSyntax {
    let (unexpectedBeforeRet, ret) = self.eat(returnHandle)
    let hasMisplacedTry = unexpectedBeforeRet?.containsToken(where: { TokenSpec(.try) ~= $0 }) ?? false

    // Handle the ambiguity between consuming the expression and allowing the
    // enclosing stmt-brace to get it by eagerly eating it unless the return is
    // followed by a '}', '', statement or decl start keyword sequence.
    let expr: RawExprSyntax?
    if isStartOfReturnExpr() {
      let parsedExpr = self.parseExpression()
      if hasMisplacedTry && !parsedExpr.is(RawTryExprSyntax.self) {
        expr = RawExprSyntax(
          RawTryExprSyntax(
            tryKeyword: missingToken(.try),
            questionOrExclamationMark: nil,
            expression: parsedExpr,
            arena: self.arena
          )
        )
      } else {
        expr = parsedExpr
      }
    } else {
      expr = nil
    }
    return RawReturnStmtSyntax(
      unexpectedBeforeRet,
      returnKeyword: ret,
      expression: expr,
      arena: self.arena
    )
  }
}

extension Parser {
  /// Parse a yield statement.
  ///
  /// Yield statements are not formally a part of the Swift language yet.
  ///
  /// Grammar
  /// =======
  ///
  ///     yield-statement → 'yield' '('? expr-list? ')'?
  @_spi(RawSyntax)
  public mutating func parseYieldStatement(yieldHandle: RecoveryConsumptionHandle) -> RawYieldStmtSyntax {
    let (unexpectedBeforeYield, yield) = self.eat(yieldHandle)

    let yields: RawYieldStmtSyntax.Yields
    if let lparen = self.consume(if: .leftParen) {
      let exprList: RawYieldExprListSyntax
      do {
        var keepGoing = true
        var elementList = [RawYieldExprListElementSyntax]()
        var loopProgress = LoopProgressCondition()
        while !self.at(.eof, .rightParen) && keepGoing && loopProgress.evaluate(currentToken) {
          let expr = self.parseExpression()
          let comma = self.consume(if: .comma)
          elementList.append(
            RawYieldExprListElementSyntax(
              expression: expr,
              comma: comma,
              arena: self.arena
            )
          )

          keepGoing = (comma != nil)
        }
        exprList = RawYieldExprListSyntax(elements: elementList, arena: self.arena)
      }
      let (unexpectedBeforeRParen, rparen) = self.expect(.rightParen)
      yields = .yieldList(
        RawYieldListSyntax(
          leftParen: lparen,
          elementList: exprList,
          unexpectedBeforeRParen,
          rightParen: rparen,
          arena: self.arena
        )
      )
    } else {
      yields = .simpleYield(self.parseExpression())
    }

    return RawYieldStmtSyntax(
      unexpectedBeforeYield,
      yieldKeyword: yield,
      yields: yields,
      arena: self.arena
    )
  }
}

extension Parser {
  @_spi(RawSyntax)
  public struct StatementLabel {
    public var label: RawTokenSyntax
    public var colon: RawTokenSyntax

    public init(
      label: RawTokenSyntax,
      colon: RawTokenSyntax
    ) {
      self.label = label
      self.colon = colon
    }
  }

  /// Parse an optional label that defines a named control flow point.
  ///
  /// Grammar
  /// =======
  ///
  ///     statement-label → label-name ':'
  ///     label-name → identifier
  @_spi(RawSyntax)
  public mutating func parseOptionalStatementLabel() -> StatementLabel? {
    if let (label, colon) = self.consume(if: .identifier, followedBy: .colon) {
      return StatementLabel(
        label: label,
        colon: colon
      )
    } else {
      return nil
    }
  }
}

extension Parser {
  /// Parse a break statement.
  ///
  /// Grammar
  /// =======
  ///
  ///     break-statement → 'break' label-name?
  @_spi(RawSyntax)
  public mutating func parseBreakStatement(breakHandle: RecoveryConsumptionHandle) -> RawBreakStmtSyntax {
    let (unexpectedBeforeBreakKeyword, breakKeyword) = self.eat(breakHandle)
    let label = self.parseOptionalControlTransferTarget()
    return RawBreakStmtSyntax(
      unexpectedBeforeBreakKeyword,
      breakKeyword: breakKeyword,
      label: label,
      arena: self.arena
    )
  }

  /// Parse a continue statement.
  ///
  /// Grammar
  /// =======
  ///
  ///     continue-statement → 'continue' label-name?
  @_spi(RawSyntax)
  public mutating func parseContinueStatement(continueHandle: RecoveryConsumptionHandle) -> RawContinueStmtSyntax {
    let (unexpectedBeforeContinueKeyword, continueKeyword) = self.eat(continueHandle)
    let label = self.parseOptionalControlTransferTarget()
    return RawContinueStmtSyntax(
      unexpectedBeforeContinueKeyword,
      continueKeyword: continueKeyword,
      label: label,
      arena: self.arena
    )
  }

  /// Parse a fallthrough statement.
  ///
  /// Grammar
  /// =======
  ///
  ///     fallthrough-statement → 'fallthrough'
  @_spi(RawSyntax)
  public mutating func parseFallthroughStatement(fallthroughHandle: RecoveryConsumptionHandle) -> RawFallthroughStmtSyntax {
    let (unexpectedBeforeFallthroughKeyword, fallthroughKeyword) = self.eat(fallthroughHandle)
    return RawFallthroughStmtSyntax(
      unexpectedBeforeFallthroughKeyword,
      fallthroughKeyword: fallthroughKeyword,
      arena: self.arena
    )
  }

  // label-name → identifier
  @_spi(RawSyntax)
  public mutating func parseOptionalControlTransferTarget() -> RawTokenSyntax? {
    guard !self.currentToken.isAtStartOfLine else {
      return nil
    }

    guard
      self.at(.identifier) && !self.atStartOfStatement() && !self.atStartOfDeclaration()
    else {
      return nil
    }

    return self.expectIdentifierWithoutRecovery()
  }
}

// MARK: Lookahead

extension Parser.Lookahead {
  /// Returns `true` if the current token represents the start of a statement
  /// item.
  ///
  /// - Note: This function must be kept in sync with `parseStatement()`.
  /// - Seealso: ``Parser/parseStatement()``
  public mutating func isStartOfStatement(allowRecovery: Bool = false) -> Bool {
    if (self.at(anyIn: SwitchCaseStart.self) != nil || self.at(.atSign)) && withLookahead({ $0.atStartOfSwitchCaseItem() }) {
      // We consider SwitchCaseItems statements so we don't parse the start of a new case item as trailing parts of an expresion.
      return true
    }

    _ = self.consume(if: .identifier, followedBy: .colon)
    let switchSubject: CanBeStatementStart?
    if allowRecovery {
      switchSubject = self.canRecoverTo(anyIn: CanBeStatementStart.self)?.0
    } else {
      switchSubject = self.at(anyIn: CanBeStatementStart.self)?.0
    }
    switch switchSubject {
    case .returnKeyword?,
      .throwKeyword?,
      .deferKeyword?,
      .ifKeyword?,
      .guardKeyword?,
      .whileKeyword?,
      .doKeyword?,
      .forKeyword?,
      .breakKeyword?,
      .continueKeyword?,
      .fallthroughKeyword?,
      .switchKeyword?:
      return true
    case .repeatKeyword?:
      // 'repeat' followed by anything other than a brace stmt
      // is a pack expansion expression.
      // FIXME: 'repeat' followed by '{' could be a pack expansion
      // with a closure pattern.
      return self.peek().rawTokenKind == .leftBrace
    case .yield?:
      switch self.peek().rawTokenKind {
      case .prefixAmpersand:
        // "yield &" always denotes a yield statement.
        return true
      case .leftParen:
        // "yield (", by contrast, must be disambiguated with additional
        // context. We always consider it an apply expression of a function
        // called `yield` for the purposes of the parse.
        return false
      case .binaryOperator:
        // 'yield &= x' treats yield as an identifier.
        return false
      default:
        // "yield" followed immediately by any other token is likely a
        // yield statement of some singular expression.
        return !self.peek().isAtStartOfLine
      }
    case .forgetKeyword?:
      let next = peek()
      // The thing to be forgotten must be on the same line as `forget`.
      if next.isAtStartOfLine {
        return false
      }
      switch next.rawTokenKind {
      case .identifier, .keyword:
        // Since some identifiers like "self" are classified as keywords,
        // we want to recognize those too, to handle "forget self". We also
        // accept any identifier since we want to emit a nice error message
        // later on during type checking.
        return true
      default:
        // any other token following "forget" means it's not the statement.
        // For example, could be the function call "forget()".
        return false
      }
    case nil:
      return false
    }
  }

  /// Returns whether the parser's current position is the start of a switch case,
  /// given that we're in the middle of a switch already.
  mutating func isAtStartOfSwitchCase(allowRecovery: Bool = false) -> Bool {
    // Check for and consume attributes. The only valid attribute is `@unknown`
    // but that's a semantic restriction.
    var lookahead = self.lookahead()
    var loopProgress = LoopProgressCondition()
    var hasAttribute = false
    while lookahead.at(.atSign) && loopProgress.evaluate(lookahead.currentToken) {
      guard lookahead.peek().rawTokenKind == .identifier else {
        return false
      }

      lookahead.eat(.atSign)
      lookahead.eat(.identifier)
      hasAttribute = true
    }

    if hasAttribute && lookahead.at(.rightBrace) {
      // If we are at an attribute that's the last token in the SwitchCase, parse
      // that as an attribut to a missing 'case'. That way, if the developer writes
      // @unknown at the end of a switch but forgot to write 'default', we'll emit
      // a diagnostic about a missing label instead of a missing declaration after
      // the attribute.
      return true
    }

    if allowRecovery {
      return lookahead.canRecoverTo(anyIn: SwitchCaseStart.self) != nil
    } else {
      return lookahead.at(anyIn: SwitchCaseStart.self) != nil
    }
  }

  mutating func isStartOfConditionalSwitchCases() -> Bool {
    guard self.at(.poundIfKeyword) else {
      return self.isAtStartOfSwitchCase()
    }

    var lookahead = self.lookahead()
    var loopProgress = LoopProgressCondition()
    repeat {
      lookahead.consumeAnyToken()
      // just find the end of the line
      lookahead.skipUntilEndOfLine()
    } while lookahead.at(.poundIfKeyword, .poundElseifKeyword, .poundElseKeyword) && loopProgress.evaluate(lookahead.currentToken)
    return lookahead.isAtStartOfSwitchCase()
  }
}
