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

import SwiftDiagnostics
import SwiftSyntax
import SwiftSyntaxBuilder

/// Interface to extract information about the context in which a given
/// macro is expanded.
public protocol MacroExpansionContext: AnyObject {
  /// Generate a unique name for use in the macro.
  ///
  /// - Parameters:
  ///   - name: The name to use as a basis for the uniquely-generated name,
  ///     which will appear in the unique name that's produced here.
  ///
  /// - Returns: an identifier token containing a unique name that will not
  ///   conflict with any other name in a well-formed program.
  @available(*, renamed: "makeUniqueName(_:)")
  func createUniqueName(_ name: String) -> TokenSyntax

  /// Generate a unique name for use in the macro.
  ///
  /// - Parameters:
  ///   - name: The name to use as a basis for the uniquely-generated name,
  ///     which will appear in the unique name that's produced here.
  ///
  /// - Returns: an identifier token containing a unique name that will not
  ///   conflict with any other name in a well-formed program.
  func makeUniqueName(_ name: String) -> TokenSyntax

  /// Produce a diagnostic while expanding the macro.
  func diagnose(_ diagnostic: Diagnostic)

  /// Retrieve a source location for the given syntax node.
  ///
  /// - Parameters:
  ///   - node: The syntax node whose source location to produce.
  ///   - position: The position within the syntax node for the resulting
  ///     location.
  ///   - filePathMode: How the file name contained in the source location is
  ///     formed.
  ///
  /// - Returns: the source location within the given node, or `nil` if the
  ///   given syntax node is not rooted in a source file that the macro
  ///   expansion context knows about.
  @available(*, deprecated, message: "Please use AbstractSourceLocation version")
  func location<Node: SyntaxProtocol>(
    of node: Node,
    at position: PositionInSyntaxNode,
    filePathMode: SourceLocationFilePathMode
  ) -> SourceLocation?

  /// Retrieve a source location for the given syntax node.
  ///
  /// - Parameters:
  ///   - node: The syntax node whose source location to produce.
  ///   - position: The position within the syntax node for the resulting
  ///     location.
  ///   - filePathMode: How the file name contained in the source location is
  ///     formed.
  ///
  /// - Returns: the source location within the given node, or `nil` if the
  ///   given syntax node is not rooted in a source file that the macro
  ///   expansion context knows about.
  @_disfavoredOverload
  func location<Node: SyntaxProtocol>(
    of node: Node,
    at position: PositionInSyntaxNode,
    filePathMode: SourceLocationFilePathMode
  ) -> AbstractSourceLocation?
}

extension MacroExpansionContext {
  /// Retrieve a source location for the given syntax node's starting token
  /// (after leading trivia) using file naming according to `#fileID`.
  ///
  /// - Parameters:
  ///   - node: The syntax node whose source location to produce.
  ///
  /// - Returns: the source location within the given node, or `nil` if the
  ///   given syntax node is not rooted in a source file that the macro
  ///   expansion context knows about.
  @available(*, deprecated, message: "Please use AbstractSourceLocation version")
  public func location<Node: SyntaxProtocol>(
    of node: Node
  ) -> SourceLocation? {
    return location(of: node, at: .afterLeadingTrivia, filePathMode: .fileID)
  }

  /// Retrieve a source location for the given syntax node's starting token
  /// (after leading trivia) using file naming according to `#fileID`.
  ///
  /// - Parameters:
  ///   - node: The syntax node whose source location to produce.
  ///
  /// - Returns: the source location within the given node, or `nil` if the
  ///   given syntax node is not rooted in a source file that the macro
  ///   expansion context knows about.
  @_disfavoredOverload
  public func location<Node: SyntaxProtocol>(
    of node: Node
  ) -> AbstractSourceLocation? {
    return location(of: node, at: .afterLeadingTrivia, filePathMode: .fileID)
  }
}

extension MacroExpansionContext {
  /// Retrieve a source location for the given syntax node.
  ///
  /// - Parameters:
  ///   - node: The syntax node whose source location to produce.
  ///   - position: The position within the syntax node for the resulting
  ///     location.
  ///   - filePathMode: How the file name contained in the source location is
  ///     formed.
  ///
  /// - Returns: the source location within the given node, or `nil` if the
  ///   given syntax node is not rooted in a source file that the macro
  ///   expansion context knows about.
  @_disfavoredOverload
  @available(*, deprecated, message: "Please use AbstractSourceLocation version")
  public func location<Node: SyntaxProtocol>(
    of node: Node,
    at position: PositionInSyntaxNode,
    filePathMode: SourceLocationFilePathMode
  ) -> AbstractSourceLocation? {
    guard let sourceLoc: SourceLocation = location(of: node, at: position, filePathMode: filePathMode),
      let file = sourceLoc.file,
      let line = sourceLoc.line,
      let column = sourceLoc.column
    else {
      return nil
    }

    return AbstractSourceLocation(
      file: "\(literal: file)",
      line: "\(literal: line)",
      column: "\(literal: column)"
    )
  }

  /// Generate a unique name for use in the macro.
  ///
  /// - Parameters:
  ///   - name: The name to use as a basis for the uniquely-generated name,
  ///     which will appear in the unique name that's produced here.
  ///
  /// - Returns: an identifier token containing a unique name that will not
  ///   conflict with any other name in a well-formed program.
  @available(*, renamed: "makeUniqueName(_:)")
  public func createUniqueName(_ name: String) -> TokenSyntax {
    makeUniqueName(name)
  }

  /// Generate a unique name for use in the macro.
  ///
  /// - Parameters:
  ///   - name: The name to use as a basis for the uniquely-generated name,
  ///     which will appear in the unique name that's produced here.
  ///
  /// - Returns: an identifier token containing a unique name that will not
  ///   conflict with any other name in a well-formed program.
  public func makeUniqueName(_ name: String) -> TokenSyntax {
    createUniqueName(name)
  }
}

/// Diagnostic message used for thrown errors.
private struct ThrownErrorDiagnostic: DiagnosticMessage {
  let message: String

  var severity: DiagnosticSeverity { .error }

  var diagnosticID: MessageID {
    .init(domain: "SwiftSyntaxMacros", id: "ThrownErrorDiagnostic")
  }
}

extension MacroExpansionContext {
  /// Add diagnostics from the error thrown during macro expansion.
  public func addDiagnostics<S: SyntaxProtocol>(from error: Error, node: S) {
    guard let diagnosticsError = error as? DiagnosticsError else {
      diagnose(
        Diagnostic(
          node: Syntax(node),
          message: ThrownErrorDiagnostic(message: String(describing: error))
        )
      )
      return
    }

    for diagnostic in diagnosticsError.diagnostics {
      diagnose(diagnostic)
    }

    // handle possibility that none of the diagnostics was an error
    if !diagnosticsError.diagnostics.contains(
      where: { $0.diagMessage.severity == .error }
    ) {
      diagnose(
        Diagnostic(
          node: Syntax(node),
          message: ThrownErrorDiagnostic(
            message: "macro expansion failed without generating an error"
          )
        )
      )
    }
  }
}

/// Describe the position within a syntax node that can be used to compute
/// source locations.
public enum PositionInSyntaxNode {
  /// Refers to the start of the syntax node's leading trivia, which is
  /// the first source location covered by the syntax node.
  case beforeLeadingTrivia

  /// Refers to the start of the syntax node's first token, which
  /// immediately follows the leading trivia.
  case afterLeadingTrivia

  /// Refers to the end of the syntax node's last token, right before the
  /// trailing trivia.
  case beforeTrailingTrivia

  /// Refers just past the end of the source text that is covered by the
  /// syntax node, after all trailing trivia.
  case afterTrailingTrivia
}

/// Describes how the a source location file path
public enum SourceLocationFilePathMode {
  /// A file ID consisting of the module name and file name (without full path),
  /// as would be generated by the macro expansion `#fileID`.
  case fileID

  /// A full path name as would be generated by the macro expansion `#filePath`,
  /// e.g., `/home/taylor/alison.swift`.
  case filePath
}
