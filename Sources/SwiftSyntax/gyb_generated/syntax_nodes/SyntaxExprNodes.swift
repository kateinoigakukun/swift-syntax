//// Automatically Generated From SyntaxNodes.swift.gyb.
//// Do Not Edit Directly!
//===------------ SyntaxNodes.swift - Syntax Node definitions -------------===//
//
// This source file is part of the Swift.org open source project
//
// Copyright (c) 2014 - 2022 Apple Inc. and the Swift project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See https://swift.org/LICENSE.txt for license information
// See https://swift.org/CONTRIBUTORS.txt for the list of Swift project authors
//
//===----------------------------------------------------------------------===//


// MARK: - MissingExprSyntax

public struct MissingExprSyntax: ExprSyntaxProtocol, SyntaxHashable {
  public let _syntaxNode: Syntax

  public init?<S: SyntaxProtocol>(_ node: S) {
    guard node.raw.kind == .missingExpr else { return nil }
    self._syntaxNode = node._syntaxNode
  }

  /// Creates a `MissingExprSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .missingExpr)
    self._syntaxNode = Syntax(data)
  }

  public init() {
    let data: SyntaxData = withExtendedLifetime(SyntaxArena()) { arena in
      let raw = RawSyntax.makeEmptyLayout(kind: SyntaxKind.missingExpr, arena: arena)
      return SyntaxData.forRoot(raw)
    }
    self.init(data)
  }

  public static var structure: SyntaxNodeStructure {
    return .layout([
    ])
  }

  public func childNameForDiagnostics(_ index: SyntaxChildrenIndex) -> String? {
    switch index.data?.indexInParent {
    default:
      fatalError("Invalid index")
    }
  }
}

extension MissingExprSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
    ])
  }
}

// MARK: - InOutExprSyntax

public struct InOutExprSyntax: ExprSyntaxProtocol, SyntaxHashable {
  public let _syntaxNode: Syntax

  public init?<S: SyntaxProtocol>(_ node: S) {
    guard node.raw.kind == .inOutExpr else { return nil }
    self._syntaxNode = node._syntaxNode
  }

  /// Creates a `InOutExprSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .inOutExpr)
    self._syntaxNode = Syntax(data)
  }

  public init<E: ExprSyntaxProtocol>(
    leadingTrivia: Trivia? = nil,
    _ unexpectedBeforeAmpersand: UnexpectedNodesSyntax? = nil,
    ampersand: TokenSyntax = .prefixAmpersandToken(),
    _ unexpectedBetweenAmpersandAndExpression: UnexpectedNodesSyntax? = nil,
    expression: E,
    _ unexpectedAfterExpression: UnexpectedNodesSyntax? = nil,
    trailingTrivia: Trivia? = nil
  ) {
    let layout: [RawSyntax?] = [
      unexpectedBeforeAmpersand?.raw,
      ampersand.raw,
      unexpectedBetweenAmpersandAndExpression?.raw,
      expression.raw,
      unexpectedAfterExpression?.raw,
    ]
    let data: SyntaxData = withExtendedLifetime(SyntaxArena()) { arena in
      let raw = RawSyntax.makeLayout(
        kind: SyntaxKind.inOutExpr, from: layout, arena: arena,
        leadingTrivia: leadingTrivia, trailingTrivia: trailingTrivia)
      return SyntaxData.forRoot(raw)
    }
    self.init(data)
  }

  public var unexpectedBeforeAmpersand: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: 0, parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBeforeAmpersand(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBeforeAmpersand` replaced.
  /// - param newChild: The new `unexpectedBeforeAmpersand` to replace the node's
  ///                   current `unexpectedBeforeAmpersand`, if present.
  public func withUnexpectedBeforeAmpersand(_ newChild: UnexpectedNodesSyntax?) -> InOutExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 0, with: raw, arena: arena)
    return InOutExprSyntax(newData)
  }

  public var ampersand: TokenSyntax {
    get {
      let childData = data.child(at: 1, parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withAmpersand(value)
    }
  }

  /// Returns a copy of the receiver with its `ampersand` replaced.
  /// - param newChild: The new `ampersand` to replace the node's
  ///                   current `ampersand`, if present.
  public func withAmpersand(_ newChild: TokenSyntax?) -> InOutExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.prefixAmpersand, arena: arena)
    let newData = data.replacingChild(at: 1, with: raw, arena: arena)
    return InOutExprSyntax(newData)
  }

  public var unexpectedBetweenAmpersandAndExpression: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: 2, parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenAmpersandAndExpression(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenAmpersandAndExpression` replaced.
  /// - param newChild: The new `unexpectedBetweenAmpersandAndExpression` to replace the node's
  ///                   current `unexpectedBetweenAmpersandAndExpression`, if present.
  public func withUnexpectedBetweenAmpersandAndExpression(_ newChild: UnexpectedNodesSyntax?) -> InOutExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 2, with: raw, arena: arena)
    return InOutExprSyntax(newData)
  }

  public var expression: ExprSyntax {
    get {
      let childData = data.child(at: 3, parent: Syntax(self))
      return ExprSyntax(childData!)
    }
    set(value) {
      self = withExpression(value)
    }
  }

  /// Returns a copy of the receiver with its `expression` replaced.
  /// - param newChild: The new `expression` to replace the node's
  ///                   current `expression`, if present.
  public func withExpression(_ newChild: ExprSyntax?) -> InOutExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw ?? RawSyntax.makeEmptyLayout(kind: SyntaxKind.missingExpr, arena: arena)
    let newData = data.replacingChild(at: 3, with: raw, arena: arena)
    return InOutExprSyntax(newData)
  }

  public var unexpectedAfterExpression: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: 4, parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedAfterExpression(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedAfterExpression` replaced.
  /// - param newChild: The new `unexpectedAfterExpression` to replace the node's
  ///                   current `unexpectedAfterExpression`, if present.
  public func withUnexpectedAfterExpression(_ newChild: UnexpectedNodesSyntax?) -> InOutExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 4, with: raw, arena: arena)
    return InOutExprSyntax(newData)
  }

  public static var structure: SyntaxNodeStructure {
    return .layout([
      \Self.unexpectedBeforeAmpersand,
      \Self.ampersand,
      \Self.unexpectedBetweenAmpersandAndExpression,
      \Self.expression,
      \Self.unexpectedAfterExpression,
    ])
  }

  public func childNameForDiagnostics(_ index: SyntaxChildrenIndex) -> String? {
    switch index.data?.indexInParent {
    case 0:
      return nil
    case 1:
      return nil
    case 2:
      return nil
    case 3:
      return nil
    case 4:
      return nil
    default:
      fatalError("Invalid index")
    }
  }
}

extension InOutExprSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeAmpersand": unexpectedBeforeAmpersand.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "ampersand": Syntax(ampersand).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenAmpersandAndExpression": unexpectedBetweenAmpersandAndExpression.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "expression": Syntax(expression).asProtocol(SyntaxProtocol.self),
      "unexpectedAfterExpression": unexpectedAfterExpression.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - PoundColumnExprSyntax

public struct PoundColumnExprSyntax: ExprSyntaxProtocol, SyntaxHashable {
  public let _syntaxNode: Syntax

  public init?<S: SyntaxProtocol>(_ node: S) {
    guard node.raw.kind == .poundColumnExpr else { return nil }
    self._syntaxNode = node._syntaxNode
  }

  /// Creates a `PoundColumnExprSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .poundColumnExpr)
    self._syntaxNode = Syntax(data)
  }

  public init(
    leadingTrivia: Trivia? = nil,
    _ unexpectedBeforePoundColumn: UnexpectedNodesSyntax? = nil,
    poundColumn: TokenSyntax = .poundColumnKeyword(),
    _ unexpectedAfterPoundColumn: UnexpectedNodesSyntax? = nil,
    trailingTrivia: Trivia? = nil
  ) {
    let layout: [RawSyntax?] = [
      unexpectedBeforePoundColumn?.raw,
      poundColumn.raw,
      unexpectedAfterPoundColumn?.raw,
    ]
    let data: SyntaxData = withExtendedLifetime(SyntaxArena()) { arena in
      let raw = RawSyntax.makeLayout(
        kind: SyntaxKind.poundColumnExpr, from: layout, arena: arena,
        leadingTrivia: leadingTrivia, trailingTrivia: trailingTrivia)
      return SyntaxData.forRoot(raw)
    }
    self.init(data)
  }

  public var unexpectedBeforePoundColumn: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: 0, parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBeforePoundColumn(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBeforePoundColumn` replaced.
  /// - param newChild: The new `unexpectedBeforePoundColumn` to replace the node's
  ///                   current `unexpectedBeforePoundColumn`, if present.
  public func withUnexpectedBeforePoundColumn(_ newChild: UnexpectedNodesSyntax?) -> PoundColumnExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 0, with: raw, arena: arena)
    return PoundColumnExprSyntax(newData)
  }

  public var poundColumn: TokenSyntax {
    get {
      let childData = data.child(at: 1, parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withPoundColumn(value)
    }
  }

  /// Returns a copy of the receiver with its `poundColumn` replaced.
  /// - param newChild: The new `poundColumn` to replace the node's
  ///                   current `poundColumn`, if present.
  public func withPoundColumn(_ newChild: TokenSyntax?) -> PoundColumnExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.poundColumnKeyword, arena: arena)
    let newData = data.replacingChild(at: 1, with: raw, arena: arena)
    return PoundColumnExprSyntax(newData)
  }

  public var unexpectedAfterPoundColumn: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: 2, parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedAfterPoundColumn(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedAfterPoundColumn` replaced.
  /// - param newChild: The new `unexpectedAfterPoundColumn` to replace the node's
  ///                   current `unexpectedAfterPoundColumn`, if present.
  public func withUnexpectedAfterPoundColumn(_ newChild: UnexpectedNodesSyntax?) -> PoundColumnExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 2, with: raw, arena: arena)
    return PoundColumnExprSyntax(newData)
  }

  public static var structure: SyntaxNodeStructure {
    return .layout([
      \Self.unexpectedBeforePoundColumn,
      \Self.poundColumn,
      \Self.unexpectedAfterPoundColumn,
    ])
  }

  public func childNameForDiagnostics(_ index: SyntaxChildrenIndex) -> String? {
    switch index.data?.indexInParent {
    case 0:
      return nil
    case 1:
      return nil
    case 2:
      return nil
    default:
      fatalError("Invalid index")
    }
  }
}

extension PoundColumnExprSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforePoundColumn": unexpectedBeforePoundColumn.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "poundColumn": Syntax(poundColumn).asProtocol(SyntaxProtocol.self),
      "unexpectedAfterPoundColumn": unexpectedAfterPoundColumn.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - TryExprSyntax

public struct TryExprSyntax: ExprSyntaxProtocol, SyntaxHashable {
  public let _syntaxNode: Syntax

  public init?<S: SyntaxProtocol>(_ node: S) {
    guard node.raw.kind == .tryExpr else { return nil }
    self._syntaxNode = node._syntaxNode
  }

  /// Creates a `TryExprSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .tryExpr)
    self._syntaxNode = Syntax(data)
  }

  public init<E: ExprSyntaxProtocol>(
    leadingTrivia: Trivia? = nil,
    _ unexpectedBeforeTryKeyword: UnexpectedNodesSyntax? = nil,
    tryKeyword: TokenSyntax = .tryKeyword(),
    _ unexpectedBetweenTryKeywordAndQuestionOrExclamationMark: UnexpectedNodesSyntax? = nil,
    questionOrExclamationMark: TokenSyntax? = nil,
    _ unexpectedBetweenQuestionOrExclamationMarkAndExpression: UnexpectedNodesSyntax? = nil,
    expression: E,
    _ unexpectedAfterExpression: UnexpectedNodesSyntax? = nil,
    trailingTrivia: Trivia? = nil
  ) {
    let layout: [RawSyntax?] = [
      unexpectedBeforeTryKeyword?.raw,
      tryKeyword.raw,
      unexpectedBetweenTryKeywordAndQuestionOrExclamationMark?.raw,
      questionOrExclamationMark?.raw,
      unexpectedBetweenQuestionOrExclamationMarkAndExpression?.raw,
      expression.raw,
      unexpectedAfterExpression?.raw,
    ]
    let data: SyntaxData = withExtendedLifetime(SyntaxArena()) { arena in
      let raw = RawSyntax.makeLayout(
        kind: SyntaxKind.tryExpr, from: layout, arena: arena,
        leadingTrivia: leadingTrivia, trailingTrivia: trailingTrivia)
      return SyntaxData.forRoot(raw)
    }
    self.init(data)
  }

  public var unexpectedBeforeTryKeyword: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: 0, parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBeforeTryKeyword(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBeforeTryKeyword` replaced.
  /// - param newChild: The new `unexpectedBeforeTryKeyword` to replace the node's
  ///                   current `unexpectedBeforeTryKeyword`, if present.
  public func withUnexpectedBeforeTryKeyword(_ newChild: UnexpectedNodesSyntax?) -> TryExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 0, with: raw, arena: arena)
    return TryExprSyntax(newData)
  }

  public var tryKeyword: TokenSyntax {
    get {
      let childData = data.child(at: 1, parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withTryKeyword(value)
    }
  }

  /// Returns a copy of the receiver with its `tryKeyword` replaced.
  /// - param newChild: The new `tryKeyword` to replace the node's
  ///                   current `tryKeyword`, if present.
  public func withTryKeyword(_ newChild: TokenSyntax?) -> TryExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.tryKeyword, arena: arena)
    let newData = data.replacingChild(at: 1, with: raw, arena: arena)
    return TryExprSyntax(newData)
  }

  public var unexpectedBetweenTryKeywordAndQuestionOrExclamationMark: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: 2, parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenTryKeywordAndQuestionOrExclamationMark(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenTryKeywordAndQuestionOrExclamationMark` replaced.
  /// - param newChild: The new `unexpectedBetweenTryKeywordAndQuestionOrExclamationMark` to replace the node's
  ///                   current `unexpectedBetweenTryKeywordAndQuestionOrExclamationMark`, if present.
  public func withUnexpectedBetweenTryKeywordAndQuestionOrExclamationMark(_ newChild: UnexpectedNodesSyntax?) -> TryExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 2, with: raw, arena: arena)
    return TryExprSyntax(newData)
  }

  public var questionOrExclamationMark: TokenSyntax? {
    get {
      let childData = data.child(at: 3, parent: Syntax(self))
      if childData == nil { return nil }
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withQuestionOrExclamationMark(value)
    }
  }

  /// Returns a copy of the receiver with its `questionOrExclamationMark` replaced.
  /// - param newChild: The new `questionOrExclamationMark` to replace the node's
  ///                   current `questionOrExclamationMark`, if present.
  public func withQuestionOrExclamationMark(_ newChild: TokenSyntax?) -> TryExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 3, with: raw, arena: arena)
    return TryExprSyntax(newData)
  }

  public var unexpectedBetweenQuestionOrExclamationMarkAndExpression: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: 4, parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenQuestionOrExclamationMarkAndExpression(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenQuestionOrExclamationMarkAndExpression` replaced.
  /// - param newChild: The new `unexpectedBetweenQuestionOrExclamationMarkAndExpression` to replace the node's
  ///                   current `unexpectedBetweenQuestionOrExclamationMarkAndExpression`, if present.
  public func withUnexpectedBetweenQuestionOrExclamationMarkAndExpression(_ newChild: UnexpectedNodesSyntax?) -> TryExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 4, with: raw, arena: arena)
    return TryExprSyntax(newData)
  }

  public var expression: ExprSyntax {
    get {
      let childData = data.child(at: 5, parent: Syntax(self))
      return ExprSyntax(childData!)
    }
    set(value) {
      self = withExpression(value)
    }
  }

  /// Returns a copy of the receiver with its `expression` replaced.
  /// - param newChild: The new `expression` to replace the node's
  ///                   current `expression`, if present.
  public func withExpression(_ newChild: ExprSyntax?) -> TryExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw ?? RawSyntax.makeEmptyLayout(kind: SyntaxKind.missingExpr, arena: arena)
    let newData = data.replacingChild(at: 5, with: raw, arena: arena)
    return TryExprSyntax(newData)
  }

  public var unexpectedAfterExpression: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: 6, parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedAfterExpression(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedAfterExpression` replaced.
  /// - param newChild: The new `unexpectedAfterExpression` to replace the node's
  ///                   current `unexpectedAfterExpression`, if present.
  public func withUnexpectedAfterExpression(_ newChild: UnexpectedNodesSyntax?) -> TryExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 6, with: raw, arena: arena)
    return TryExprSyntax(newData)
  }

  public static var structure: SyntaxNodeStructure {
    return .layout([
      \Self.unexpectedBeforeTryKeyword,
      \Self.tryKeyword,
      \Self.unexpectedBetweenTryKeywordAndQuestionOrExclamationMark,
      \Self.questionOrExclamationMark,
      \Self.unexpectedBetweenQuestionOrExclamationMarkAndExpression,
      \Self.expression,
      \Self.unexpectedAfterExpression,
    ])
  }

  public func childNameForDiagnostics(_ index: SyntaxChildrenIndex) -> String? {
    switch index.data?.indexInParent {
    case 0:
      return nil
    case 1:
      return nil
    case 2:
      return nil
    case 3:
      return nil
    case 4:
      return nil
    case 5:
      return nil
    case 6:
      return nil
    default:
      fatalError("Invalid index")
    }
  }
}

extension TryExprSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeTryKeyword": unexpectedBeforeTryKeyword.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "tryKeyword": Syntax(tryKeyword).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenTryKeywordAndQuestionOrExclamationMark": unexpectedBetweenTryKeywordAndQuestionOrExclamationMark.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "questionOrExclamationMark": questionOrExclamationMark.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenQuestionOrExclamationMarkAndExpression": unexpectedBetweenQuestionOrExclamationMarkAndExpression.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "expression": Syntax(expression).asProtocol(SyntaxProtocol.self),
      "unexpectedAfterExpression": unexpectedAfterExpression.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - AwaitExprSyntax

public struct AwaitExprSyntax: ExprSyntaxProtocol, SyntaxHashable {
  public let _syntaxNode: Syntax

  public init?<S: SyntaxProtocol>(_ node: S) {
    guard node.raw.kind == .awaitExpr else { return nil }
    self._syntaxNode = node._syntaxNode
  }

  /// Creates a `AwaitExprSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .awaitExpr)
    self._syntaxNode = Syntax(data)
  }

  public init<E: ExprSyntaxProtocol>(
    leadingTrivia: Trivia? = nil,
    _ unexpectedBeforeAwaitKeyword: UnexpectedNodesSyntax? = nil,
    awaitKeyword: TokenSyntax = .contextualKeyword("await"),
    _ unexpectedBetweenAwaitKeywordAndExpression: UnexpectedNodesSyntax? = nil,
    expression: E,
    _ unexpectedAfterExpression: UnexpectedNodesSyntax? = nil,
    trailingTrivia: Trivia? = nil
  ) {
    let layout: [RawSyntax?] = [
      unexpectedBeforeAwaitKeyword?.raw,
      awaitKeyword.raw,
      unexpectedBetweenAwaitKeywordAndExpression?.raw,
      expression.raw,
      unexpectedAfterExpression?.raw,
    ]
    let data: SyntaxData = withExtendedLifetime(SyntaxArena()) { arena in
      let raw = RawSyntax.makeLayout(
        kind: SyntaxKind.awaitExpr, from: layout, arena: arena,
        leadingTrivia: leadingTrivia, trailingTrivia: trailingTrivia)
      return SyntaxData.forRoot(raw)
    }
    self.init(data)
  }

  public var unexpectedBeforeAwaitKeyword: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: 0, parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBeforeAwaitKeyword(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBeforeAwaitKeyword` replaced.
  /// - param newChild: The new `unexpectedBeforeAwaitKeyword` to replace the node's
  ///                   current `unexpectedBeforeAwaitKeyword`, if present.
  public func withUnexpectedBeforeAwaitKeyword(_ newChild: UnexpectedNodesSyntax?) -> AwaitExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 0, with: raw, arena: arena)
    return AwaitExprSyntax(newData)
  }

  public var awaitKeyword: TokenSyntax {
    get {
      let childData = data.child(at: 1, parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withAwaitKeyword(value)
    }
  }

  /// Returns a copy of the receiver with its `awaitKeyword` replaced.
  /// - param newChild: The new `awaitKeyword` to replace the node's
  ///                   current `awaitKeyword`, if present.
  public func withAwaitKeyword(_ newChild: TokenSyntax?) -> AwaitExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.contextualKeyword(""), arena: arena)
    let newData = data.replacingChild(at: 1, with: raw, arena: arena)
    return AwaitExprSyntax(newData)
  }

  public var unexpectedBetweenAwaitKeywordAndExpression: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: 2, parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenAwaitKeywordAndExpression(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenAwaitKeywordAndExpression` replaced.
  /// - param newChild: The new `unexpectedBetweenAwaitKeywordAndExpression` to replace the node's
  ///                   current `unexpectedBetweenAwaitKeywordAndExpression`, if present.
  public func withUnexpectedBetweenAwaitKeywordAndExpression(_ newChild: UnexpectedNodesSyntax?) -> AwaitExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 2, with: raw, arena: arena)
    return AwaitExprSyntax(newData)
  }

  public var expression: ExprSyntax {
    get {
      let childData = data.child(at: 3, parent: Syntax(self))
      return ExprSyntax(childData!)
    }
    set(value) {
      self = withExpression(value)
    }
  }

  /// Returns a copy of the receiver with its `expression` replaced.
  /// - param newChild: The new `expression` to replace the node's
  ///                   current `expression`, if present.
  public func withExpression(_ newChild: ExprSyntax?) -> AwaitExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw ?? RawSyntax.makeEmptyLayout(kind: SyntaxKind.missingExpr, arena: arena)
    let newData = data.replacingChild(at: 3, with: raw, arena: arena)
    return AwaitExprSyntax(newData)
  }

  public var unexpectedAfterExpression: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: 4, parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedAfterExpression(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedAfterExpression` replaced.
  /// - param newChild: The new `unexpectedAfterExpression` to replace the node's
  ///                   current `unexpectedAfterExpression`, if present.
  public func withUnexpectedAfterExpression(_ newChild: UnexpectedNodesSyntax?) -> AwaitExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 4, with: raw, arena: arena)
    return AwaitExprSyntax(newData)
  }

  public static var structure: SyntaxNodeStructure {
    return .layout([
      \Self.unexpectedBeforeAwaitKeyword,
      \Self.awaitKeyword,
      \Self.unexpectedBetweenAwaitKeywordAndExpression,
      \Self.expression,
      \Self.unexpectedAfterExpression,
    ])
  }

  public func childNameForDiagnostics(_ index: SyntaxChildrenIndex) -> String? {
    switch index.data?.indexInParent {
    case 0:
      return nil
    case 1:
      return nil
    case 2:
      return nil
    case 3:
      return nil
    case 4:
      return nil
    default:
      fatalError("Invalid index")
    }
  }
}

extension AwaitExprSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeAwaitKeyword": unexpectedBeforeAwaitKeyword.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "awaitKeyword": Syntax(awaitKeyword).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenAwaitKeywordAndExpression": unexpectedBetweenAwaitKeywordAndExpression.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "expression": Syntax(expression).asProtocol(SyntaxProtocol.self),
      "unexpectedAfterExpression": unexpectedAfterExpression.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - MoveExprSyntax

public struct MoveExprSyntax: ExprSyntaxProtocol, SyntaxHashable {
  public let _syntaxNode: Syntax

  public init?<S: SyntaxProtocol>(_ node: S) {
    guard node.raw.kind == .moveExpr else { return nil }
    self._syntaxNode = node._syntaxNode
  }

  /// Creates a `MoveExprSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .moveExpr)
    self._syntaxNode = Syntax(data)
  }

  public init<E: ExprSyntaxProtocol>(
    leadingTrivia: Trivia? = nil,
    _ unexpectedBeforeMoveKeyword: UnexpectedNodesSyntax? = nil,
    moveKeyword: TokenSyntax = .contextualKeyword("_move"),
    _ unexpectedBetweenMoveKeywordAndExpression: UnexpectedNodesSyntax? = nil,
    expression: E,
    _ unexpectedAfterExpression: UnexpectedNodesSyntax? = nil,
    trailingTrivia: Trivia? = nil
  ) {
    let layout: [RawSyntax?] = [
      unexpectedBeforeMoveKeyword?.raw,
      moveKeyword.raw,
      unexpectedBetweenMoveKeywordAndExpression?.raw,
      expression.raw,
      unexpectedAfterExpression?.raw,
    ]
    let data: SyntaxData = withExtendedLifetime(SyntaxArena()) { arena in
      let raw = RawSyntax.makeLayout(
        kind: SyntaxKind.moveExpr, from: layout, arena: arena,
        leadingTrivia: leadingTrivia, trailingTrivia: trailingTrivia)
      return SyntaxData.forRoot(raw)
    }
    self.init(data)
  }

  public var unexpectedBeforeMoveKeyword: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: 0, parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBeforeMoveKeyword(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBeforeMoveKeyword` replaced.
  /// - param newChild: The new `unexpectedBeforeMoveKeyword` to replace the node's
  ///                   current `unexpectedBeforeMoveKeyword`, if present.
  public func withUnexpectedBeforeMoveKeyword(_ newChild: UnexpectedNodesSyntax?) -> MoveExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 0, with: raw, arena: arena)
    return MoveExprSyntax(newData)
  }

  public var moveKeyword: TokenSyntax {
    get {
      let childData = data.child(at: 1, parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withMoveKeyword(value)
    }
  }

  /// Returns a copy of the receiver with its `moveKeyword` replaced.
  /// - param newChild: The new `moveKeyword` to replace the node's
  ///                   current `moveKeyword`, if present.
  public func withMoveKeyword(_ newChild: TokenSyntax?) -> MoveExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.contextualKeyword(""), arena: arena)
    let newData = data.replacingChild(at: 1, with: raw, arena: arena)
    return MoveExprSyntax(newData)
  }

  public var unexpectedBetweenMoveKeywordAndExpression: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: 2, parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenMoveKeywordAndExpression(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenMoveKeywordAndExpression` replaced.
  /// - param newChild: The new `unexpectedBetweenMoveKeywordAndExpression` to replace the node's
  ///                   current `unexpectedBetweenMoveKeywordAndExpression`, if present.
  public func withUnexpectedBetweenMoveKeywordAndExpression(_ newChild: UnexpectedNodesSyntax?) -> MoveExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 2, with: raw, arena: arena)
    return MoveExprSyntax(newData)
  }

  public var expression: ExprSyntax {
    get {
      let childData = data.child(at: 3, parent: Syntax(self))
      return ExprSyntax(childData!)
    }
    set(value) {
      self = withExpression(value)
    }
  }

  /// Returns a copy of the receiver with its `expression` replaced.
  /// - param newChild: The new `expression` to replace the node's
  ///                   current `expression`, if present.
  public func withExpression(_ newChild: ExprSyntax?) -> MoveExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw ?? RawSyntax.makeEmptyLayout(kind: SyntaxKind.missingExpr, arena: arena)
    let newData = data.replacingChild(at: 3, with: raw, arena: arena)
    return MoveExprSyntax(newData)
  }

  public var unexpectedAfterExpression: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: 4, parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedAfterExpression(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedAfterExpression` replaced.
  /// - param newChild: The new `unexpectedAfterExpression` to replace the node's
  ///                   current `unexpectedAfterExpression`, if present.
  public func withUnexpectedAfterExpression(_ newChild: UnexpectedNodesSyntax?) -> MoveExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 4, with: raw, arena: arena)
    return MoveExprSyntax(newData)
  }

  public static var structure: SyntaxNodeStructure {
    return .layout([
      \Self.unexpectedBeforeMoveKeyword,
      \Self.moveKeyword,
      \Self.unexpectedBetweenMoveKeywordAndExpression,
      \Self.expression,
      \Self.unexpectedAfterExpression,
    ])
  }

  public func childNameForDiagnostics(_ index: SyntaxChildrenIndex) -> String? {
    switch index.data?.indexInParent {
    case 0:
      return nil
    case 1:
      return nil
    case 2:
      return nil
    case 3:
      return nil
    case 4:
      return nil
    default:
      fatalError("Invalid index")
    }
  }
}

extension MoveExprSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeMoveKeyword": unexpectedBeforeMoveKeyword.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "moveKeyword": Syntax(moveKeyword).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenMoveKeywordAndExpression": unexpectedBetweenMoveKeywordAndExpression.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "expression": Syntax(expression).asProtocol(SyntaxProtocol.self),
      "unexpectedAfterExpression": unexpectedAfterExpression.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - IdentifierExprSyntax

public struct IdentifierExprSyntax: ExprSyntaxProtocol, SyntaxHashable {
  public let _syntaxNode: Syntax

  public init?<S: SyntaxProtocol>(_ node: S) {
    guard node.raw.kind == .identifierExpr else { return nil }
    self._syntaxNode = node._syntaxNode
  }

  /// Creates a `IdentifierExprSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .identifierExpr)
    self._syntaxNode = Syntax(data)
  }

  public init(
    leadingTrivia: Trivia? = nil,
    _ unexpectedBeforeIdentifier: UnexpectedNodesSyntax? = nil,
    identifier: TokenSyntax,
    _ unexpectedBetweenIdentifierAndDeclNameArguments: UnexpectedNodesSyntax? = nil,
    declNameArguments: DeclNameArgumentsSyntax? = nil,
    _ unexpectedAfterDeclNameArguments: UnexpectedNodesSyntax? = nil,
    trailingTrivia: Trivia? = nil
  ) {
    let layout: [RawSyntax?] = [
      unexpectedBeforeIdentifier?.raw,
      identifier.raw,
      unexpectedBetweenIdentifierAndDeclNameArguments?.raw,
      declNameArguments?.raw,
      unexpectedAfterDeclNameArguments?.raw,
    ]
    let data: SyntaxData = withExtendedLifetime(SyntaxArena()) { arena in
      let raw = RawSyntax.makeLayout(
        kind: SyntaxKind.identifierExpr, from: layout, arena: arena,
        leadingTrivia: leadingTrivia, trailingTrivia: trailingTrivia)
      return SyntaxData.forRoot(raw)
    }
    self.init(data)
  }

  public var unexpectedBeforeIdentifier: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: 0, parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBeforeIdentifier(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBeforeIdentifier` replaced.
  /// - param newChild: The new `unexpectedBeforeIdentifier` to replace the node's
  ///                   current `unexpectedBeforeIdentifier`, if present.
  public func withUnexpectedBeforeIdentifier(_ newChild: UnexpectedNodesSyntax?) -> IdentifierExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 0, with: raw, arena: arena)
    return IdentifierExprSyntax(newData)
  }

  public var identifier: TokenSyntax {
    get {
      let childData = data.child(at: 1, parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withIdentifier(value)
    }
  }

  /// Returns a copy of the receiver with its `identifier` replaced.
  /// - param newChild: The new `identifier` to replace the node's
  ///                   current `identifier`, if present.
  public func withIdentifier(_ newChild: TokenSyntax?) -> IdentifierExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.identifier(""), arena: arena)
    let newData = data.replacingChild(at: 1, with: raw, arena: arena)
    return IdentifierExprSyntax(newData)
  }

  public var unexpectedBetweenIdentifierAndDeclNameArguments: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: 2, parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenIdentifierAndDeclNameArguments(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenIdentifierAndDeclNameArguments` replaced.
  /// - param newChild: The new `unexpectedBetweenIdentifierAndDeclNameArguments` to replace the node's
  ///                   current `unexpectedBetweenIdentifierAndDeclNameArguments`, if present.
  public func withUnexpectedBetweenIdentifierAndDeclNameArguments(_ newChild: UnexpectedNodesSyntax?) -> IdentifierExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 2, with: raw, arena: arena)
    return IdentifierExprSyntax(newData)
  }

  public var declNameArguments: DeclNameArgumentsSyntax? {
    get {
      let childData = data.child(at: 3, parent: Syntax(self))
      if childData == nil { return nil }
      return DeclNameArgumentsSyntax(childData!)
    }
    set(value) {
      self = withDeclNameArguments(value)
    }
  }

  /// Returns a copy of the receiver with its `declNameArguments` replaced.
  /// - param newChild: The new `declNameArguments` to replace the node's
  ///                   current `declNameArguments`, if present.
  public func withDeclNameArguments(_ newChild: DeclNameArgumentsSyntax?) -> IdentifierExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 3, with: raw, arena: arena)
    return IdentifierExprSyntax(newData)
  }

  public var unexpectedAfterDeclNameArguments: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: 4, parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedAfterDeclNameArguments(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedAfterDeclNameArguments` replaced.
  /// - param newChild: The new `unexpectedAfterDeclNameArguments` to replace the node's
  ///                   current `unexpectedAfterDeclNameArguments`, if present.
  public func withUnexpectedAfterDeclNameArguments(_ newChild: UnexpectedNodesSyntax?) -> IdentifierExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 4, with: raw, arena: arena)
    return IdentifierExprSyntax(newData)
  }

  public static var structure: SyntaxNodeStructure {
    return .layout([
      \Self.unexpectedBeforeIdentifier,
      \Self.identifier,
      \Self.unexpectedBetweenIdentifierAndDeclNameArguments,
      \Self.declNameArguments,
      \Self.unexpectedAfterDeclNameArguments,
    ])
  }

  public func childNameForDiagnostics(_ index: SyntaxChildrenIndex) -> String? {
    switch index.data?.indexInParent {
    case 0:
      return nil
    case 1:
      return nil
    case 2:
      return nil
    case 3:
      return nil
    case 4:
      return nil
    default:
      fatalError("Invalid index")
    }
  }
}

extension IdentifierExprSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeIdentifier": unexpectedBeforeIdentifier.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "identifier": Syntax(identifier).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenIdentifierAndDeclNameArguments": unexpectedBetweenIdentifierAndDeclNameArguments.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "declNameArguments": declNameArguments.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedAfterDeclNameArguments": unexpectedAfterDeclNameArguments.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - SuperRefExprSyntax

public struct SuperRefExprSyntax: ExprSyntaxProtocol, SyntaxHashable {
  public let _syntaxNode: Syntax

  public init?<S: SyntaxProtocol>(_ node: S) {
    guard node.raw.kind == .superRefExpr else { return nil }
    self._syntaxNode = node._syntaxNode
  }

  /// Creates a `SuperRefExprSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .superRefExpr)
    self._syntaxNode = Syntax(data)
  }

  public init(
    leadingTrivia: Trivia? = nil,
    _ unexpectedBeforeSuperKeyword: UnexpectedNodesSyntax? = nil,
    superKeyword: TokenSyntax = .superKeyword(),
    _ unexpectedAfterSuperKeyword: UnexpectedNodesSyntax? = nil,
    trailingTrivia: Trivia? = nil
  ) {
    let layout: [RawSyntax?] = [
      unexpectedBeforeSuperKeyword?.raw,
      superKeyword.raw,
      unexpectedAfterSuperKeyword?.raw,
    ]
    let data: SyntaxData = withExtendedLifetime(SyntaxArena()) { arena in
      let raw = RawSyntax.makeLayout(
        kind: SyntaxKind.superRefExpr, from: layout, arena: arena,
        leadingTrivia: leadingTrivia, trailingTrivia: trailingTrivia)
      return SyntaxData.forRoot(raw)
    }
    self.init(data)
  }

  public var unexpectedBeforeSuperKeyword: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: 0, parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBeforeSuperKeyword(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBeforeSuperKeyword` replaced.
  /// - param newChild: The new `unexpectedBeforeSuperKeyword` to replace the node's
  ///                   current `unexpectedBeforeSuperKeyword`, if present.
  public func withUnexpectedBeforeSuperKeyword(_ newChild: UnexpectedNodesSyntax?) -> SuperRefExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 0, with: raw, arena: arena)
    return SuperRefExprSyntax(newData)
  }

  public var superKeyword: TokenSyntax {
    get {
      let childData = data.child(at: 1, parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withSuperKeyword(value)
    }
  }

  /// Returns a copy of the receiver with its `superKeyword` replaced.
  /// - param newChild: The new `superKeyword` to replace the node's
  ///                   current `superKeyword`, if present.
  public func withSuperKeyword(_ newChild: TokenSyntax?) -> SuperRefExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.superKeyword, arena: arena)
    let newData = data.replacingChild(at: 1, with: raw, arena: arena)
    return SuperRefExprSyntax(newData)
  }

  public var unexpectedAfterSuperKeyword: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: 2, parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedAfterSuperKeyword(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedAfterSuperKeyword` replaced.
  /// - param newChild: The new `unexpectedAfterSuperKeyword` to replace the node's
  ///                   current `unexpectedAfterSuperKeyword`, if present.
  public func withUnexpectedAfterSuperKeyword(_ newChild: UnexpectedNodesSyntax?) -> SuperRefExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 2, with: raw, arena: arena)
    return SuperRefExprSyntax(newData)
  }

  public static var structure: SyntaxNodeStructure {
    return .layout([
      \Self.unexpectedBeforeSuperKeyword,
      \Self.superKeyword,
      \Self.unexpectedAfterSuperKeyword,
    ])
  }

  public func childNameForDiagnostics(_ index: SyntaxChildrenIndex) -> String? {
    switch index.data?.indexInParent {
    case 0:
      return nil
    case 1:
      return nil
    case 2:
      return nil
    default:
      fatalError("Invalid index")
    }
  }
}

extension SuperRefExprSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeSuperKeyword": unexpectedBeforeSuperKeyword.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "superKeyword": Syntax(superKeyword).asProtocol(SyntaxProtocol.self),
      "unexpectedAfterSuperKeyword": unexpectedAfterSuperKeyword.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - NilLiteralExprSyntax

public struct NilLiteralExprSyntax: ExprSyntaxProtocol, SyntaxHashable {
  public let _syntaxNode: Syntax

  public init?<S: SyntaxProtocol>(_ node: S) {
    guard node.raw.kind == .nilLiteralExpr else { return nil }
    self._syntaxNode = node._syntaxNode
  }

  /// Creates a `NilLiteralExprSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .nilLiteralExpr)
    self._syntaxNode = Syntax(data)
  }

  public init(
    leadingTrivia: Trivia? = nil,
    _ unexpectedBeforeNilKeyword: UnexpectedNodesSyntax? = nil,
    nilKeyword: TokenSyntax = .nilKeyword(),
    _ unexpectedAfterNilKeyword: UnexpectedNodesSyntax? = nil,
    trailingTrivia: Trivia? = nil
  ) {
    let layout: [RawSyntax?] = [
      unexpectedBeforeNilKeyword?.raw,
      nilKeyword.raw,
      unexpectedAfterNilKeyword?.raw,
    ]
    let data: SyntaxData = withExtendedLifetime(SyntaxArena()) { arena in
      let raw = RawSyntax.makeLayout(
        kind: SyntaxKind.nilLiteralExpr, from: layout, arena: arena,
        leadingTrivia: leadingTrivia, trailingTrivia: trailingTrivia)
      return SyntaxData.forRoot(raw)
    }
    self.init(data)
  }

  public var unexpectedBeforeNilKeyword: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: 0, parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBeforeNilKeyword(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBeforeNilKeyword` replaced.
  /// - param newChild: The new `unexpectedBeforeNilKeyword` to replace the node's
  ///                   current `unexpectedBeforeNilKeyword`, if present.
  public func withUnexpectedBeforeNilKeyword(_ newChild: UnexpectedNodesSyntax?) -> NilLiteralExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 0, with: raw, arena: arena)
    return NilLiteralExprSyntax(newData)
  }

  public var nilKeyword: TokenSyntax {
    get {
      let childData = data.child(at: 1, parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withNilKeyword(value)
    }
  }

  /// Returns a copy of the receiver with its `nilKeyword` replaced.
  /// - param newChild: The new `nilKeyword` to replace the node's
  ///                   current `nilKeyword`, if present.
  public func withNilKeyword(_ newChild: TokenSyntax?) -> NilLiteralExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.nilKeyword, arena: arena)
    let newData = data.replacingChild(at: 1, with: raw, arena: arena)
    return NilLiteralExprSyntax(newData)
  }

  public var unexpectedAfterNilKeyword: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: 2, parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedAfterNilKeyword(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedAfterNilKeyword` replaced.
  /// - param newChild: The new `unexpectedAfterNilKeyword` to replace the node's
  ///                   current `unexpectedAfterNilKeyword`, if present.
  public func withUnexpectedAfterNilKeyword(_ newChild: UnexpectedNodesSyntax?) -> NilLiteralExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 2, with: raw, arena: arena)
    return NilLiteralExprSyntax(newData)
  }

  public static var structure: SyntaxNodeStructure {
    return .layout([
      \Self.unexpectedBeforeNilKeyword,
      \Self.nilKeyword,
      \Self.unexpectedAfterNilKeyword,
    ])
  }

  public func childNameForDiagnostics(_ index: SyntaxChildrenIndex) -> String? {
    switch index.data?.indexInParent {
    case 0:
      return nil
    case 1:
      return nil
    case 2:
      return nil
    default:
      fatalError("Invalid index")
    }
  }
}

extension NilLiteralExprSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeNilKeyword": unexpectedBeforeNilKeyword.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "nilKeyword": Syntax(nilKeyword).asProtocol(SyntaxProtocol.self),
      "unexpectedAfterNilKeyword": unexpectedAfterNilKeyword.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - DiscardAssignmentExprSyntax

public struct DiscardAssignmentExprSyntax: ExprSyntaxProtocol, SyntaxHashable {
  public let _syntaxNode: Syntax

  public init?<S: SyntaxProtocol>(_ node: S) {
    guard node.raw.kind == .discardAssignmentExpr else { return nil }
    self._syntaxNode = node._syntaxNode
  }

  /// Creates a `DiscardAssignmentExprSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .discardAssignmentExpr)
    self._syntaxNode = Syntax(data)
  }

  public init(
    leadingTrivia: Trivia? = nil,
    _ unexpectedBeforeWildcard: UnexpectedNodesSyntax? = nil,
    wildcard: TokenSyntax = .wildcardKeyword(),
    _ unexpectedAfterWildcard: UnexpectedNodesSyntax? = nil,
    trailingTrivia: Trivia? = nil
  ) {
    let layout: [RawSyntax?] = [
      unexpectedBeforeWildcard?.raw,
      wildcard.raw,
      unexpectedAfterWildcard?.raw,
    ]
    let data: SyntaxData = withExtendedLifetime(SyntaxArena()) { arena in
      let raw = RawSyntax.makeLayout(
        kind: SyntaxKind.discardAssignmentExpr, from: layout, arena: arena,
        leadingTrivia: leadingTrivia, trailingTrivia: trailingTrivia)
      return SyntaxData.forRoot(raw)
    }
    self.init(data)
  }

  public var unexpectedBeforeWildcard: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: 0, parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBeforeWildcard(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBeforeWildcard` replaced.
  /// - param newChild: The new `unexpectedBeforeWildcard` to replace the node's
  ///                   current `unexpectedBeforeWildcard`, if present.
  public func withUnexpectedBeforeWildcard(_ newChild: UnexpectedNodesSyntax?) -> DiscardAssignmentExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 0, with: raw, arena: arena)
    return DiscardAssignmentExprSyntax(newData)
  }

  public var wildcard: TokenSyntax {
    get {
      let childData = data.child(at: 1, parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withWildcard(value)
    }
  }

  /// Returns a copy of the receiver with its `wildcard` replaced.
  /// - param newChild: The new `wildcard` to replace the node's
  ///                   current `wildcard`, if present.
  public func withWildcard(_ newChild: TokenSyntax?) -> DiscardAssignmentExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.wildcardKeyword, arena: arena)
    let newData = data.replacingChild(at: 1, with: raw, arena: arena)
    return DiscardAssignmentExprSyntax(newData)
  }

  public var unexpectedAfterWildcard: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: 2, parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedAfterWildcard(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedAfterWildcard` replaced.
  /// - param newChild: The new `unexpectedAfterWildcard` to replace the node's
  ///                   current `unexpectedAfterWildcard`, if present.
  public func withUnexpectedAfterWildcard(_ newChild: UnexpectedNodesSyntax?) -> DiscardAssignmentExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 2, with: raw, arena: arena)
    return DiscardAssignmentExprSyntax(newData)
  }

  public static var structure: SyntaxNodeStructure {
    return .layout([
      \Self.unexpectedBeforeWildcard,
      \Self.wildcard,
      \Self.unexpectedAfterWildcard,
    ])
  }

  public func childNameForDiagnostics(_ index: SyntaxChildrenIndex) -> String? {
    switch index.data?.indexInParent {
    case 0:
      return nil
    case 1:
      return nil
    case 2:
      return nil
    default:
      fatalError("Invalid index")
    }
  }
}

extension DiscardAssignmentExprSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeWildcard": unexpectedBeforeWildcard.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "wildcard": Syntax(wildcard).asProtocol(SyntaxProtocol.self),
      "unexpectedAfterWildcard": unexpectedAfterWildcard.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - AssignmentExprSyntax

public struct AssignmentExprSyntax: ExprSyntaxProtocol, SyntaxHashable {
  public let _syntaxNode: Syntax

  public init?<S: SyntaxProtocol>(_ node: S) {
    guard node.raw.kind == .assignmentExpr else { return nil }
    self._syntaxNode = node._syntaxNode
  }

  /// Creates a `AssignmentExprSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .assignmentExpr)
    self._syntaxNode = Syntax(data)
  }

  public init(
    leadingTrivia: Trivia? = nil,
    _ unexpectedBeforeAssignToken: UnexpectedNodesSyntax? = nil,
    assignToken: TokenSyntax = .equalToken(),
    _ unexpectedAfterAssignToken: UnexpectedNodesSyntax? = nil,
    trailingTrivia: Trivia? = nil
  ) {
    let layout: [RawSyntax?] = [
      unexpectedBeforeAssignToken?.raw,
      assignToken.raw,
      unexpectedAfterAssignToken?.raw,
    ]
    let data: SyntaxData = withExtendedLifetime(SyntaxArena()) { arena in
      let raw = RawSyntax.makeLayout(
        kind: SyntaxKind.assignmentExpr, from: layout, arena: arena,
        leadingTrivia: leadingTrivia, trailingTrivia: trailingTrivia)
      return SyntaxData.forRoot(raw)
    }
    self.init(data)
  }

  public var unexpectedBeforeAssignToken: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: 0, parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBeforeAssignToken(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBeforeAssignToken` replaced.
  /// - param newChild: The new `unexpectedBeforeAssignToken` to replace the node's
  ///                   current `unexpectedBeforeAssignToken`, if present.
  public func withUnexpectedBeforeAssignToken(_ newChild: UnexpectedNodesSyntax?) -> AssignmentExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 0, with: raw, arena: arena)
    return AssignmentExprSyntax(newData)
  }

  public var assignToken: TokenSyntax {
    get {
      let childData = data.child(at: 1, parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withAssignToken(value)
    }
  }

  /// Returns a copy of the receiver with its `assignToken` replaced.
  /// - param newChild: The new `assignToken` to replace the node's
  ///                   current `assignToken`, if present.
  public func withAssignToken(_ newChild: TokenSyntax?) -> AssignmentExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.equal, arena: arena)
    let newData = data.replacingChild(at: 1, with: raw, arena: arena)
    return AssignmentExprSyntax(newData)
  }

  public var unexpectedAfterAssignToken: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: 2, parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedAfterAssignToken(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedAfterAssignToken` replaced.
  /// - param newChild: The new `unexpectedAfterAssignToken` to replace the node's
  ///                   current `unexpectedAfterAssignToken`, if present.
  public func withUnexpectedAfterAssignToken(_ newChild: UnexpectedNodesSyntax?) -> AssignmentExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 2, with: raw, arena: arena)
    return AssignmentExprSyntax(newData)
  }

  public static var structure: SyntaxNodeStructure {
    return .layout([
      \Self.unexpectedBeforeAssignToken,
      \Self.assignToken,
      \Self.unexpectedAfterAssignToken,
    ])
  }

  public func childNameForDiagnostics(_ index: SyntaxChildrenIndex) -> String? {
    switch index.data?.indexInParent {
    case 0:
      return nil
    case 1:
      return nil
    case 2:
      return nil
    default:
      fatalError("Invalid index")
    }
  }
}

extension AssignmentExprSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeAssignToken": unexpectedBeforeAssignToken.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "assignToken": Syntax(assignToken).asProtocol(SyntaxProtocol.self),
      "unexpectedAfterAssignToken": unexpectedAfterAssignToken.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - PackElementExprSyntax

public struct PackElementExprSyntax: ExprSyntaxProtocol, SyntaxHashable {
  public let _syntaxNode: Syntax

  public init?<S: SyntaxProtocol>(_ node: S) {
    guard node.raw.kind == .packElementExpr else { return nil }
    self._syntaxNode = node._syntaxNode
  }

  /// Creates a `PackElementExprSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .packElementExpr)
    self._syntaxNode = Syntax(data)
  }

  public init<P: ExprSyntaxProtocol>(
    leadingTrivia: Trivia? = nil,
    _ unexpectedBeforeEachKeyword: UnexpectedNodesSyntax? = nil,
    eachKeyword: TokenSyntax = .contextualKeyword("each"),
    _ unexpectedBetweenEachKeywordAndPackRefExpr: UnexpectedNodesSyntax? = nil,
    packRefExpr: P,
    _ unexpectedAfterPackRefExpr: UnexpectedNodesSyntax? = nil,
    trailingTrivia: Trivia? = nil
  ) {
    let layout: [RawSyntax?] = [
      unexpectedBeforeEachKeyword?.raw,
      eachKeyword.raw,
      unexpectedBetweenEachKeywordAndPackRefExpr?.raw,
      packRefExpr.raw,
      unexpectedAfterPackRefExpr?.raw,
    ]
    let data: SyntaxData = withExtendedLifetime(SyntaxArena()) { arena in
      let raw = RawSyntax.makeLayout(
        kind: SyntaxKind.packElementExpr, from: layout, arena: arena,
        leadingTrivia: leadingTrivia, trailingTrivia: trailingTrivia)
      return SyntaxData.forRoot(raw)
    }
    self.init(data)
  }

  public var unexpectedBeforeEachKeyword: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: 0, parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBeforeEachKeyword(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBeforeEachKeyword` replaced.
  /// - param newChild: The new `unexpectedBeforeEachKeyword` to replace the node's
  ///                   current `unexpectedBeforeEachKeyword`, if present.
  public func withUnexpectedBeforeEachKeyword(_ newChild: UnexpectedNodesSyntax?) -> PackElementExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 0, with: raw, arena: arena)
    return PackElementExprSyntax(newData)
  }

  public var eachKeyword: TokenSyntax {
    get {
      let childData = data.child(at: 1, parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withEachKeyword(value)
    }
  }

  /// Returns a copy of the receiver with its `eachKeyword` replaced.
  /// - param newChild: The new `eachKeyword` to replace the node's
  ///                   current `eachKeyword`, if present.
  public func withEachKeyword(_ newChild: TokenSyntax?) -> PackElementExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.contextualKeyword(""), arena: arena)
    let newData = data.replacingChild(at: 1, with: raw, arena: arena)
    return PackElementExprSyntax(newData)
  }

  public var unexpectedBetweenEachKeywordAndPackRefExpr: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: 2, parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenEachKeywordAndPackRefExpr(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenEachKeywordAndPackRefExpr` replaced.
  /// - param newChild: The new `unexpectedBetweenEachKeywordAndPackRefExpr` to replace the node's
  ///                   current `unexpectedBetweenEachKeywordAndPackRefExpr`, if present.
  public func withUnexpectedBetweenEachKeywordAndPackRefExpr(_ newChild: UnexpectedNodesSyntax?) -> PackElementExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 2, with: raw, arena: arena)
    return PackElementExprSyntax(newData)
  }

  public var packRefExpr: ExprSyntax {
    get {
      let childData = data.child(at: 3, parent: Syntax(self))
      return ExprSyntax(childData!)
    }
    set(value) {
      self = withPackRefExpr(value)
    }
  }

  /// Returns a copy of the receiver with its `packRefExpr` replaced.
  /// - param newChild: The new `packRefExpr` to replace the node's
  ///                   current `packRefExpr`, if present.
  public func withPackRefExpr(_ newChild: ExprSyntax?) -> PackElementExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw ?? RawSyntax.makeEmptyLayout(kind: SyntaxKind.missingExpr, arena: arena)
    let newData = data.replacingChild(at: 3, with: raw, arena: arena)
    return PackElementExprSyntax(newData)
  }

  public var unexpectedAfterPackRefExpr: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: 4, parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedAfterPackRefExpr(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedAfterPackRefExpr` replaced.
  /// - param newChild: The new `unexpectedAfterPackRefExpr` to replace the node's
  ///                   current `unexpectedAfterPackRefExpr`, if present.
  public func withUnexpectedAfterPackRefExpr(_ newChild: UnexpectedNodesSyntax?) -> PackElementExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 4, with: raw, arena: arena)
    return PackElementExprSyntax(newData)
  }

  public static var structure: SyntaxNodeStructure {
    return .layout([
      \Self.unexpectedBeforeEachKeyword,
      \Self.eachKeyword,
      \Self.unexpectedBetweenEachKeywordAndPackRefExpr,
      \Self.packRefExpr,
      \Self.unexpectedAfterPackRefExpr,
    ])
  }

  public func childNameForDiagnostics(_ index: SyntaxChildrenIndex) -> String? {
    switch index.data?.indexInParent {
    case 0:
      return nil
    case 1:
      return nil
    case 2:
      return nil
    case 3:
      return nil
    case 4:
      return nil
    default:
      fatalError("Invalid index")
    }
  }
}

extension PackElementExprSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeEachKeyword": unexpectedBeforeEachKeyword.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "eachKeyword": Syntax(eachKeyword).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenEachKeywordAndPackRefExpr": unexpectedBetweenEachKeywordAndPackRefExpr.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "packRefExpr": Syntax(packRefExpr).asProtocol(SyntaxProtocol.self),
      "unexpectedAfterPackRefExpr": unexpectedAfterPackRefExpr.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - SequenceExprSyntax

public struct SequenceExprSyntax: ExprSyntaxProtocol, SyntaxHashable {
  public let _syntaxNode: Syntax

  public init?<S: SyntaxProtocol>(_ node: S) {
    guard node.raw.kind == .sequenceExpr else { return nil }
    self._syntaxNode = node._syntaxNode
  }

  /// Creates a `SequenceExprSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .sequenceExpr)
    self._syntaxNode = Syntax(data)
  }

  public init(
    leadingTrivia: Trivia? = nil,
    _ unexpectedBeforeElements: UnexpectedNodesSyntax? = nil,
    elements: ExprListSyntax,
    _ unexpectedAfterElements: UnexpectedNodesSyntax? = nil,
    trailingTrivia: Trivia? = nil
  ) {
    let layout: [RawSyntax?] = [
      unexpectedBeforeElements?.raw,
      elements.raw,
      unexpectedAfterElements?.raw,
    ]
    let data: SyntaxData = withExtendedLifetime(SyntaxArena()) { arena in
      let raw = RawSyntax.makeLayout(
        kind: SyntaxKind.sequenceExpr, from: layout, arena: arena,
        leadingTrivia: leadingTrivia, trailingTrivia: trailingTrivia)
      return SyntaxData.forRoot(raw)
    }
    self.init(data)
  }

  public var unexpectedBeforeElements: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: 0, parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBeforeElements(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBeforeElements` replaced.
  /// - param newChild: The new `unexpectedBeforeElements` to replace the node's
  ///                   current `unexpectedBeforeElements`, if present.
  public func withUnexpectedBeforeElements(_ newChild: UnexpectedNodesSyntax?) -> SequenceExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 0, with: raw, arena: arena)
    return SequenceExprSyntax(newData)
  }

  public var elements: ExprListSyntax {
    get {
      let childData = data.child(at: 1, parent: Syntax(self))
      return ExprListSyntax(childData!)
    }
    set(value) {
      self = withElements(value)
    }
  }

  /// Adds the provided `Element` to the node's `elements`
  /// collection.
  /// - param element: The new `Element` to add to the node's
  ///                  `elements` collection.
  /// - returns: A copy of the receiver with the provided `Element`
  ///            appended to its `elements` collection.
  public func addElement(_ element: ExprSyntax) -> SequenceExprSyntax {
    var collection: RawSyntax
    let arena = SyntaxArena()
    if let col = raw.layoutView!.children[1] {
      collection = col.layoutView!.appending(element.raw, arena: arena)
    } else {
      collection = RawSyntax.makeLayout(kind: SyntaxKind.exprList,
        from: [element.raw], arena: arena)
    }
    let newData = data.replacingChild(at: 1, with: collection, arena: arena)
    return SequenceExprSyntax(newData)
  }

  /// Returns a copy of the receiver with its `elements` replaced.
  /// - param newChild: The new `elements` to replace the node's
  ///                   current `elements`, if present.
  public func withElements(_ newChild: ExprListSyntax?) -> SequenceExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw ?? RawSyntax.makeEmptyLayout(kind: SyntaxKind.exprList, arena: arena)
    let newData = data.replacingChild(at: 1, with: raw, arena: arena)
    return SequenceExprSyntax(newData)
  }

  public var unexpectedAfterElements: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: 2, parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedAfterElements(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedAfterElements` replaced.
  /// - param newChild: The new `unexpectedAfterElements` to replace the node's
  ///                   current `unexpectedAfterElements`, if present.
  public func withUnexpectedAfterElements(_ newChild: UnexpectedNodesSyntax?) -> SequenceExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 2, with: raw, arena: arena)
    return SequenceExprSyntax(newData)
  }

  public static var structure: SyntaxNodeStructure {
    return .layout([
      \Self.unexpectedBeforeElements,
      \Self.elements,
      \Self.unexpectedAfterElements,
    ])
  }

  public func childNameForDiagnostics(_ index: SyntaxChildrenIndex) -> String? {
    switch index.data?.indexInParent {
    case 0:
      return nil
    case 1:
      return nil
    case 2:
      return nil
    default:
      fatalError("Invalid index")
    }
  }
}

extension SequenceExprSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeElements": unexpectedBeforeElements.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "elements": Syntax(elements).asProtocol(SyntaxProtocol.self),
      "unexpectedAfterElements": unexpectedAfterElements.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - SymbolicReferenceExprSyntax

public struct SymbolicReferenceExprSyntax: ExprSyntaxProtocol, SyntaxHashable {
  public let _syntaxNode: Syntax

  public init?<S: SyntaxProtocol>(_ node: S) {
    guard node.raw.kind == .symbolicReferenceExpr else { return nil }
    self._syntaxNode = node._syntaxNode
  }

  /// Creates a `SymbolicReferenceExprSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .symbolicReferenceExpr)
    self._syntaxNode = Syntax(data)
  }

  public init(
    leadingTrivia: Trivia? = nil,
    _ unexpectedBeforeIdentifier: UnexpectedNodesSyntax? = nil,
    identifier: TokenSyntax,
    _ unexpectedBetweenIdentifierAndGenericArgumentClause: UnexpectedNodesSyntax? = nil,
    genericArgumentClause: GenericArgumentClauseSyntax? = nil,
    _ unexpectedAfterGenericArgumentClause: UnexpectedNodesSyntax? = nil,
    trailingTrivia: Trivia? = nil
  ) {
    let layout: [RawSyntax?] = [
      unexpectedBeforeIdentifier?.raw,
      identifier.raw,
      unexpectedBetweenIdentifierAndGenericArgumentClause?.raw,
      genericArgumentClause?.raw,
      unexpectedAfterGenericArgumentClause?.raw,
    ]
    let data: SyntaxData = withExtendedLifetime(SyntaxArena()) { arena in
      let raw = RawSyntax.makeLayout(
        kind: SyntaxKind.symbolicReferenceExpr, from: layout, arena: arena,
        leadingTrivia: leadingTrivia, trailingTrivia: trailingTrivia)
      return SyntaxData.forRoot(raw)
    }
    self.init(data)
  }

  public var unexpectedBeforeIdentifier: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: 0, parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBeforeIdentifier(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBeforeIdentifier` replaced.
  /// - param newChild: The new `unexpectedBeforeIdentifier` to replace the node's
  ///                   current `unexpectedBeforeIdentifier`, if present.
  public func withUnexpectedBeforeIdentifier(_ newChild: UnexpectedNodesSyntax?) -> SymbolicReferenceExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 0, with: raw, arena: arena)
    return SymbolicReferenceExprSyntax(newData)
  }

  public var identifier: TokenSyntax {
    get {
      let childData = data.child(at: 1, parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withIdentifier(value)
    }
  }

  /// Returns a copy of the receiver with its `identifier` replaced.
  /// - param newChild: The new `identifier` to replace the node's
  ///                   current `identifier`, if present.
  public func withIdentifier(_ newChild: TokenSyntax?) -> SymbolicReferenceExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.identifier(""), arena: arena)
    let newData = data.replacingChild(at: 1, with: raw, arena: arena)
    return SymbolicReferenceExprSyntax(newData)
  }

  public var unexpectedBetweenIdentifierAndGenericArgumentClause: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: 2, parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenIdentifierAndGenericArgumentClause(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenIdentifierAndGenericArgumentClause` replaced.
  /// - param newChild: The new `unexpectedBetweenIdentifierAndGenericArgumentClause` to replace the node's
  ///                   current `unexpectedBetweenIdentifierAndGenericArgumentClause`, if present.
  public func withUnexpectedBetweenIdentifierAndGenericArgumentClause(_ newChild: UnexpectedNodesSyntax?) -> SymbolicReferenceExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 2, with: raw, arena: arena)
    return SymbolicReferenceExprSyntax(newData)
  }

  public var genericArgumentClause: GenericArgumentClauseSyntax? {
    get {
      let childData = data.child(at: 3, parent: Syntax(self))
      if childData == nil { return nil }
      return GenericArgumentClauseSyntax(childData!)
    }
    set(value) {
      self = withGenericArgumentClause(value)
    }
  }

  /// Returns a copy of the receiver with its `genericArgumentClause` replaced.
  /// - param newChild: The new `genericArgumentClause` to replace the node's
  ///                   current `genericArgumentClause`, if present.
  public func withGenericArgumentClause(_ newChild: GenericArgumentClauseSyntax?) -> SymbolicReferenceExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 3, with: raw, arena: arena)
    return SymbolicReferenceExprSyntax(newData)
  }

  public var unexpectedAfterGenericArgumentClause: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: 4, parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedAfterGenericArgumentClause(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedAfterGenericArgumentClause` replaced.
  /// - param newChild: The new `unexpectedAfterGenericArgumentClause` to replace the node's
  ///                   current `unexpectedAfterGenericArgumentClause`, if present.
  public func withUnexpectedAfterGenericArgumentClause(_ newChild: UnexpectedNodesSyntax?) -> SymbolicReferenceExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 4, with: raw, arena: arena)
    return SymbolicReferenceExprSyntax(newData)
  }

  public static var structure: SyntaxNodeStructure {
    return .layout([
      \Self.unexpectedBeforeIdentifier,
      \Self.identifier,
      \Self.unexpectedBetweenIdentifierAndGenericArgumentClause,
      \Self.genericArgumentClause,
      \Self.unexpectedAfterGenericArgumentClause,
    ])
  }

  public func childNameForDiagnostics(_ index: SyntaxChildrenIndex) -> String? {
    switch index.data?.indexInParent {
    case 0:
      return nil
    case 1:
      return nil
    case 2:
      return nil
    case 3:
      return nil
    case 4:
      return nil
    default:
      fatalError("Invalid index")
    }
  }
}

extension SymbolicReferenceExprSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeIdentifier": unexpectedBeforeIdentifier.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "identifier": Syntax(identifier).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenIdentifierAndGenericArgumentClause": unexpectedBetweenIdentifierAndGenericArgumentClause.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "genericArgumentClause": genericArgumentClause.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedAfterGenericArgumentClause": unexpectedAfterGenericArgumentClause.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - PrefixOperatorExprSyntax

public struct PrefixOperatorExprSyntax: ExprSyntaxProtocol, SyntaxHashable {
  public let _syntaxNode: Syntax

  public init?<S: SyntaxProtocol>(_ node: S) {
    guard node.raw.kind == .prefixOperatorExpr else { return nil }
    self._syntaxNode = node._syntaxNode
  }

  /// Creates a `PrefixOperatorExprSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .prefixOperatorExpr)
    self._syntaxNode = Syntax(data)
  }

  public init<P: ExprSyntaxProtocol>(
    leadingTrivia: Trivia? = nil,
    _ unexpectedBeforeOperatorToken: UnexpectedNodesSyntax? = nil,
    operatorToken: TokenSyntax? = nil,
    _ unexpectedBetweenOperatorTokenAndPostfixExpression: UnexpectedNodesSyntax? = nil,
    postfixExpression: P,
    _ unexpectedAfterPostfixExpression: UnexpectedNodesSyntax? = nil,
    trailingTrivia: Trivia? = nil
  ) {
    let layout: [RawSyntax?] = [
      unexpectedBeforeOperatorToken?.raw,
      operatorToken?.raw,
      unexpectedBetweenOperatorTokenAndPostfixExpression?.raw,
      postfixExpression.raw,
      unexpectedAfterPostfixExpression?.raw,
    ]
    let data: SyntaxData = withExtendedLifetime(SyntaxArena()) { arena in
      let raw = RawSyntax.makeLayout(
        kind: SyntaxKind.prefixOperatorExpr, from: layout, arena: arena,
        leadingTrivia: leadingTrivia, trailingTrivia: trailingTrivia)
      return SyntaxData.forRoot(raw)
    }
    self.init(data)
  }

  public var unexpectedBeforeOperatorToken: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: 0, parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBeforeOperatorToken(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBeforeOperatorToken` replaced.
  /// - param newChild: The new `unexpectedBeforeOperatorToken` to replace the node's
  ///                   current `unexpectedBeforeOperatorToken`, if present.
  public func withUnexpectedBeforeOperatorToken(_ newChild: UnexpectedNodesSyntax?) -> PrefixOperatorExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 0, with: raw, arena: arena)
    return PrefixOperatorExprSyntax(newData)
  }

  public var operatorToken: TokenSyntax? {
    get {
      let childData = data.child(at: 1, parent: Syntax(self))
      if childData == nil { return nil }
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withOperatorToken(value)
    }
  }

  /// Returns a copy of the receiver with its `operatorToken` replaced.
  /// - param newChild: The new `operatorToken` to replace the node's
  ///                   current `operatorToken`, if present.
  public func withOperatorToken(_ newChild: TokenSyntax?) -> PrefixOperatorExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 1, with: raw, arena: arena)
    return PrefixOperatorExprSyntax(newData)
  }

  public var unexpectedBetweenOperatorTokenAndPostfixExpression: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: 2, parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenOperatorTokenAndPostfixExpression(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenOperatorTokenAndPostfixExpression` replaced.
  /// - param newChild: The new `unexpectedBetweenOperatorTokenAndPostfixExpression` to replace the node's
  ///                   current `unexpectedBetweenOperatorTokenAndPostfixExpression`, if present.
  public func withUnexpectedBetweenOperatorTokenAndPostfixExpression(_ newChild: UnexpectedNodesSyntax?) -> PrefixOperatorExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 2, with: raw, arena: arena)
    return PrefixOperatorExprSyntax(newData)
  }

  public var postfixExpression: ExprSyntax {
    get {
      let childData = data.child(at: 3, parent: Syntax(self))
      return ExprSyntax(childData!)
    }
    set(value) {
      self = withPostfixExpression(value)
    }
  }

  /// Returns a copy of the receiver with its `postfixExpression` replaced.
  /// - param newChild: The new `postfixExpression` to replace the node's
  ///                   current `postfixExpression`, if present.
  public func withPostfixExpression(_ newChild: ExprSyntax?) -> PrefixOperatorExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw ?? RawSyntax.makeEmptyLayout(kind: SyntaxKind.missingExpr, arena: arena)
    let newData = data.replacingChild(at: 3, with: raw, arena: arena)
    return PrefixOperatorExprSyntax(newData)
  }

  public var unexpectedAfterPostfixExpression: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: 4, parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedAfterPostfixExpression(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedAfterPostfixExpression` replaced.
  /// - param newChild: The new `unexpectedAfterPostfixExpression` to replace the node's
  ///                   current `unexpectedAfterPostfixExpression`, if present.
  public func withUnexpectedAfterPostfixExpression(_ newChild: UnexpectedNodesSyntax?) -> PrefixOperatorExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 4, with: raw, arena: arena)
    return PrefixOperatorExprSyntax(newData)
  }

  public static var structure: SyntaxNodeStructure {
    return .layout([
      \Self.unexpectedBeforeOperatorToken,
      \Self.operatorToken,
      \Self.unexpectedBetweenOperatorTokenAndPostfixExpression,
      \Self.postfixExpression,
      \Self.unexpectedAfterPostfixExpression,
    ])
  }

  public func childNameForDiagnostics(_ index: SyntaxChildrenIndex) -> String? {
    switch index.data?.indexInParent {
    case 0:
      return nil
    case 1:
      return nil
    case 2:
      return nil
    case 3:
      return nil
    case 4:
      return nil
    default:
      fatalError("Invalid index")
    }
  }
}

extension PrefixOperatorExprSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeOperatorToken": unexpectedBeforeOperatorToken.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "operatorToken": operatorToken.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenOperatorTokenAndPostfixExpression": unexpectedBetweenOperatorTokenAndPostfixExpression.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "postfixExpression": Syntax(postfixExpression).asProtocol(SyntaxProtocol.self),
      "unexpectedAfterPostfixExpression": unexpectedAfterPostfixExpression.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - BinaryOperatorExprSyntax

public struct BinaryOperatorExprSyntax: ExprSyntaxProtocol, SyntaxHashable {
  public let _syntaxNode: Syntax

  public init?<S: SyntaxProtocol>(_ node: S) {
    guard node.raw.kind == .binaryOperatorExpr else { return nil }
    self._syntaxNode = node._syntaxNode
  }

  /// Creates a `BinaryOperatorExprSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .binaryOperatorExpr)
    self._syntaxNode = Syntax(data)
  }

  public init(
    leadingTrivia: Trivia? = nil,
    _ unexpectedBeforeOperatorToken: UnexpectedNodesSyntax? = nil,
    operatorToken: TokenSyntax,
    _ unexpectedAfterOperatorToken: UnexpectedNodesSyntax? = nil,
    trailingTrivia: Trivia? = nil
  ) {
    let layout: [RawSyntax?] = [
      unexpectedBeforeOperatorToken?.raw,
      operatorToken.raw,
      unexpectedAfterOperatorToken?.raw,
    ]
    let data: SyntaxData = withExtendedLifetime(SyntaxArena()) { arena in
      let raw = RawSyntax.makeLayout(
        kind: SyntaxKind.binaryOperatorExpr, from: layout, arena: arena,
        leadingTrivia: leadingTrivia, trailingTrivia: trailingTrivia)
      return SyntaxData.forRoot(raw)
    }
    self.init(data)
  }

  public var unexpectedBeforeOperatorToken: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: 0, parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBeforeOperatorToken(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBeforeOperatorToken` replaced.
  /// - param newChild: The new `unexpectedBeforeOperatorToken` to replace the node's
  ///                   current `unexpectedBeforeOperatorToken`, if present.
  public func withUnexpectedBeforeOperatorToken(_ newChild: UnexpectedNodesSyntax?) -> BinaryOperatorExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 0, with: raw, arena: arena)
    return BinaryOperatorExprSyntax(newData)
  }

  public var operatorToken: TokenSyntax {
    get {
      let childData = data.child(at: 1, parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withOperatorToken(value)
    }
  }

  /// Returns a copy of the receiver with its `operatorToken` replaced.
  /// - param newChild: The new `operatorToken` to replace the node's
  ///                   current `operatorToken`, if present.
  public func withOperatorToken(_ newChild: TokenSyntax?) -> BinaryOperatorExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.unknown(""), arena: arena)
    let newData = data.replacingChild(at: 1, with: raw, arena: arena)
    return BinaryOperatorExprSyntax(newData)
  }

  public var unexpectedAfterOperatorToken: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: 2, parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedAfterOperatorToken(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedAfterOperatorToken` replaced.
  /// - param newChild: The new `unexpectedAfterOperatorToken` to replace the node's
  ///                   current `unexpectedAfterOperatorToken`, if present.
  public func withUnexpectedAfterOperatorToken(_ newChild: UnexpectedNodesSyntax?) -> BinaryOperatorExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 2, with: raw, arena: arena)
    return BinaryOperatorExprSyntax(newData)
  }

  public static var structure: SyntaxNodeStructure {
    return .layout([
      \Self.unexpectedBeforeOperatorToken,
      \Self.operatorToken,
      \Self.unexpectedAfterOperatorToken,
    ])
  }

  public func childNameForDiagnostics(_ index: SyntaxChildrenIndex) -> String? {
    switch index.data?.indexInParent {
    case 0:
      return nil
    case 1:
      return nil
    case 2:
      return nil
    default:
      fatalError("Invalid index")
    }
  }
}

extension BinaryOperatorExprSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeOperatorToken": unexpectedBeforeOperatorToken.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "operatorToken": Syntax(operatorToken).asProtocol(SyntaxProtocol.self),
      "unexpectedAfterOperatorToken": unexpectedAfterOperatorToken.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - ArrowExprSyntax

public struct ArrowExprSyntax: ExprSyntaxProtocol, SyntaxHashable {
  public let _syntaxNode: Syntax

  public init?<S: SyntaxProtocol>(_ node: S) {
    guard node.raw.kind == .arrowExpr else { return nil }
    self._syntaxNode = node._syntaxNode
  }

  /// Creates a `ArrowExprSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .arrowExpr)
    self._syntaxNode = Syntax(data)
  }

  public init(
    leadingTrivia: Trivia? = nil,
    _ unexpectedBeforeAsyncKeyword: UnexpectedNodesSyntax? = nil,
    asyncKeyword: TokenSyntax? = nil,
    _ unexpectedBetweenAsyncKeywordAndThrowsToken: UnexpectedNodesSyntax? = nil,
    throwsToken: TokenSyntax? = nil,
    _ unexpectedBetweenThrowsTokenAndArrowToken: UnexpectedNodesSyntax? = nil,
    arrowToken: TokenSyntax = .arrowToken(),
    _ unexpectedAfterArrowToken: UnexpectedNodesSyntax? = nil,
    trailingTrivia: Trivia? = nil
  ) {
    let layout: [RawSyntax?] = [
      unexpectedBeforeAsyncKeyword?.raw,
      asyncKeyword?.raw,
      unexpectedBetweenAsyncKeywordAndThrowsToken?.raw,
      throwsToken?.raw,
      unexpectedBetweenThrowsTokenAndArrowToken?.raw,
      arrowToken.raw,
      unexpectedAfterArrowToken?.raw,
    ]
    let data: SyntaxData = withExtendedLifetime(SyntaxArena()) { arena in
      let raw = RawSyntax.makeLayout(
        kind: SyntaxKind.arrowExpr, from: layout, arena: arena,
        leadingTrivia: leadingTrivia, trailingTrivia: trailingTrivia)
      return SyntaxData.forRoot(raw)
    }
    self.init(data)
  }

  public var unexpectedBeforeAsyncKeyword: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: 0, parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBeforeAsyncKeyword(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBeforeAsyncKeyword` replaced.
  /// - param newChild: The new `unexpectedBeforeAsyncKeyword` to replace the node's
  ///                   current `unexpectedBeforeAsyncKeyword`, if present.
  public func withUnexpectedBeforeAsyncKeyword(_ newChild: UnexpectedNodesSyntax?) -> ArrowExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 0, with: raw, arena: arena)
    return ArrowExprSyntax(newData)
  }

  public var asyncKeyword: TokenSyntax? {
    get {
      let childData = data.child(at: 1, parent: Syntax(self))
      if childData == nil { return nil }
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withAsyncKeyword(value)
    }
  }

  /// Returns a copy of the receiver with its `asyncKeyword` replaced.
  /// - param newChild: The new `asyncKeyword` to replace the node's
  ///                   current `asyncKeyword`, if present.
  public func withAsyncKeyword(_ newChild: TokenSyntax?) -> ArrowExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 1, with: raw, arena: arena)
    return ArrowExprSyntax(newData)
  }

  public var unexpectedBetweenAsyncKeywordAndThrowsToken: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: 2, parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenAsyncKeywordAndThrowsToken(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenAsyncKeywordAndThrowsToken` replaced.
  /// - param newChild: The new `unexpectedBetweenAsyncKeywordAndThrowsToken` to replace the node's
  ///                   current `unexpectedBetweenAsyncKeywordAndThrowsToken`, if present.
  public func withUnexpectedBetweenAsyncKeywordAndThrowsToken(_ newChild: UnexpectedNodesSyntax?) -> ArrowExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 2, with: raw, arena: arena)
    return ArrowExprSyntax(newData)
  }

  public var throwsToken: TokenSyntax? {
    get {
      let childData = data.child(at: 3, parent: Syntax(self))
      if childData == nil { return nil }
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withThrowsToken(value)
    }
  }

  /// Returns a copy of the receiver with its `throwsToken` replaced.
  /// - param newChild: The new `throwsToken` to replace the node's
  ///                   current `throwsToken`, if present.
  public func withThrowsToken(_ newChild: TokenSyntax?) -> ArrowExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 3, with: raw, arena: arena)
    return ArrowExprSyntax(newData)
  }

  public var unexpectedBetweenThrowsTokenAndArrowToken: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: 4, parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenThrowsTokenAndArrowToken(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenThrowsTokenAndArrowToken` replaced.
  /// - param newChild: The new `unexpectedBetweenThrowsTokenAndArrowToken` to replace the node's
  ///                   current `unexpectedBetweenThrowsTokenAndArrowToken`, if present.
  public func withUnexpectedBetweenThrowsTokenAndArrowToken(_ newChild: UnexpectedNodesSyntax?) -> ArrowExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 4, with: raw, arena: arena)
    return ArrowExprSyntax(newData)
  }

  public var arrowToken: TokenSyntax {
    get {
      let childData = data.child(at: 5, parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withArrowToken(value)
    }
  }

  /// Returns a copy of the receiver with its `arrowToken` replaced.
  /// - param newChild: The new `arrowToken` to replace the node's
  ///                   current `arrowToken`, if present.
  public func withArrowToken(_ newChild: TokenSyntax?) -> ArrowExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.arrow, arena: arena)
    let newData = data.replacingChild(at: 5, with: raw, arena: arena)
    return ArrowExprSyntax(newData)
  }

  public var unexpectedAfterArrowToken: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: 6, parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedAfterArrowToken(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedAfterArrowToken` replaced.
  /// - param newChild: The new `unexpectedAfterArrowToken` to replace the node's
  ///                   current `unexpectedAfterArrowToken`, if present.
  public func withUnexpectedAfterArrowToken(_ newChild: UnexpectedNodesSyntax?) -> ArrowExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 6, with: raw, arena: arena)
    return ArrowExprSyntax(newData)
  }

  public static var structure: SyntaxNodeStructure {
    return .layout([
      \Self.unexpectedBeforeAsyncKeyword,
      \Self.asyncKeyword,
      \Self.unexpectedBetweenAsyncKeywordAndThrowsToken,
      \Self.throwsToken,
      \Self.unexpectedBetweenThrowsTokenAndArrowToken,
      \Self.arrowToken,
      \Self.unexpectedAfterArrowToken,
    ])
  }

  public func childNameForDiagnostics(_ index: SyntaxChildrenIndex) -> String? {
    switch index.data?.indexInParent {
    case 0:
      return nil
    case 1:
      return nil
    case 2:
      return nil
    case 3:
      return nil
    case 4:
      return nil
    case 5:
      return nil
    case 6:
      return nil
    default:
      fatalError("Invalid index")
    }
  }
}

extension ArrowExprSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeAsyncKeyword": unexpectedBeforeAsyncKeyword.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "asyncKeyword": asyncKeyword.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenAsyncKeywordAndThrowsToken": unexpectedBetweenAsyncKeywordAndThrowsToken.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "throwsToken": throwsToken.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenThrowsTokenAndArrowToken": unexpectedBetweenThrowsTokenAndArrowToken.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "arrowToken": Syntax(arrowToken).asProtocol(SyntaxProtocol.self),
      "unexpectedAfterArrowToken": unexpectedAfterArrowToken.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - InfixOperatorExprSyntax

public struct InfixOperatorExprSyntax: ExprSyntaxProtocol, SyntaxHashable {
  public let _syntaxNode: Syntax

  public init?<S: SyntaxProtocol>(_ node: S) {
    guard node.raw.kind == .infixOperatorExpr else { return nil }
    self._syntaxNode = node._syntaxNode
  }

  /// Creates a `InfixOperatorExprSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .infixOperatorExpr)
    self._syntaxNode = Syntax(data)
  }

  public init<L: ExprSyntaxProtocol, O: ExprSyntaxProtocol, R: ExprSyntaxProtocol>(
    leadingTrivia: Trivia? = nil,
    _ unexpectedBeforeLeftOperand: UnexpectedNodesSyntax? = nil,
    leftOperand: L,
    _ unexpectedBetweenLeftOperandAndOperatorOperand: UnexpectedNodesSyntax? = nil,
    operatorOperand: O,
    _ unexpectedBetweenOperatorOperandAndRightOperand: UnexpectedNodesSyntax? = nil,
    rightOperand: R,
    _ unexpectedAfterRightOperand: UnexpectedNodesSyntax? = nil,
    trailingTrivia: Trivia? = nil
  ) {
    let layout: [RawSyntax?] = [
      unexpectedBeforeLeftOperand?.raw,
      leftOperand.raw,
      unexpectedBetweenLeftOperandAndOperatorOperand?.raw,
      operatorOperand.raw,
      unexpectedBetweenOperatorOperandAndRightOperand?.raw,
      rightOperand.raw,
      unexpectedAfterRightOperand?.raw,
    ]
    let data: SyntaxData = withExtendedLifetime(SyntaxArena()) { arena in
      let raw = RawSyntax.makeLayout(
        kind: SyntaxKind.infixOperatorExpr, from: layout, arena: arena,
        leadingTrivia: leadingTrivia, trailingTrivia: trailingTrivia)
      return SyntaxData.forRoot(raw)
    }
    self.init(data)
  }

  public var unexpectedBeforeLeftOperand: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: 0, parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBeforeLeftOperand(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBeforeLeftOperand` replaced.
  /// - param newChild: The new `unexpectedBeforeLeftOperand` to replace the node's
  ///                   current `unexpectedBeforeLeftOperand`, if present.
  public func withUnexpectedBeforeLeftOperand(_ newChild: UnexpectedNodesSyntax?) -> InfixOperatorExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 0, with: raw, arena: arena)
    return InfixOperatorExprSyntax(newData)
  }

  public var leftOperand: ExprSyntax {
    get {
      let childData = data.child(at: 1, parent: Syntax(self))
      return ExprSyntax(childData!)
    }
    set(value) {
      self = withLeftOperand(value)
    }
  }

  /// Returns a copy of the receiver with its `leftOperand` replaced.
  /// - param newChild: The new `leftOperand` to replace the node's
  ///                   current `leftOperand`, if present.
  public func withLeftOperand(_ newChild: ExprSyntax?) -> InfixOperatorExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw ?? RawSyntax.makeEmptyLayout(kind: SyntaxKind.missingExpr, arena: arena)
    let newData = data.replacingChild(at: 1, with: raw, arena: arena)
    return InfixOperatorExprSyntax(newData)
  }

  public var unexpectedBetweenLeftOperandAndOperatorOperand: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: 2, parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenLeftOperandAndOperatorOperand(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenLeftOperandAndOperatorOperand` replaced.
  /// - param newChild: The new `unexpectedBetweenLeftOperandAndOperatorOperand` to replace the node's
  ///                   current `unexpectedBetweenLeftOperandAndOperatorOperand`, if present.
  public func withUnexpectedBetweenLeftOperandAndOperatorOperand(_ newChild: UnexpectedNodesSyntax?) -> InfixOperatorExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 2, with: raw, arena: arena)
    return InfixOperatorExprSyntax(newData)
  }

  public var operatorOperand: ExprSyntax {
    get {
      let childData = data.child(at: 3, parent: Syntax(self))
      return ExprSyntax(childData!)
    }
    set(value) {
      self = withOperatorOperand(value)
    }
  }

  /// Returns a copy of the receiver with its `operatorOperand` replaced.
  /// - param newChild: The new `operatorOperand` to replace the node's
  ///                   current `operatorOperand`, if present.
  public func withOperatorOperand(_ newChild: ExprSyntax?) -> InfixOperatorExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw ?? RawSyntax.makeEmptyLayout(kind: SyntaxKind.missingExpr, arena: arena)
    let newData = data.replacingChild(at: 3, with: raw, arena: arena)
    return InfixOperatorExprSyntax(newData)
  }

  public var unexpectedBetweenOperatorOperandAndRightOperand: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: 4, parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenOperatorOperandAndRightOperand(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenOperatorOperandAndRightOperand` replaced.
  /// - param newChild: The new `unexpectedBetweenOperatorOperandAndRightOperand` to replace the node's
  ///                   current `unexpectedBetweenOperatorOperandAndRightOperand`, if present.
  public func withUnexpectedBetweenOperatorOperandAndRightOperand(_ newChild: UnexpectedNodesSyntax?) -> InfixOperatorExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 4, with: raw, arena: arena)
    return InfixOperatorExprSyntax(newData)
  }

  public var rightOperand: ExprSyntax {
    get {
      let childData = data.child(at: 5, parent: Syntax(self))
      return ExprSyntax(childData!)
    }
    set(value) {
      self = withRightOperand(value)
    }
  }

  /// Returns a copy of the receiver with its `rightOperand` replaced.
  /// - param newChild: The new `rightOperand` to replace the node's
  ///                   current `rightOperand`, if present.
  public func withRightOperand(_ newChild: ExprSyntax?) -> InfixOperatorExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw ?? RawSyntax.makeEmptyLayout(kind: SyntaxKind.missingExpr, arena: arena)
    let newData = data.replacingChild(at: 5, with: raw, arena: arena)
    return InfixOperatorExprSyntax(newData)
  }

  public var unexpectedAfterRightOperand: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: 6, parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedAfterRightOperand(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedAfterRightOperand` replaced.
  /// - param newChild: The new `unexpectedAfterRightOperand` to replace the node's
  ///                   current `unexpectedAfterRightOperand`, if present.
  public func withUnexpectedAfterRightOperand(_ newChild: UnexpectedNodesSyntax?) -> InfixOperatorExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 6, with: raw, arena: arena)
    return InfixOperatorExprSyntax(newData)
  }

  public static var structure: SyntaxNodeStructure {
    return .layout([
      \Self.unexpectedBeforeLeftOperand,
      \Self.leftOperand,
      \Self.unexpectedBetweenLeftOperandAndOperatorOperand,
      \Self.operatorOperand,
      \Self.unexpectedBetweenOperatorOperandAndRightOperand,
      \Self.rightOperand,
      \Self.unexpectedAfterRightOperand,
    ])
  }

  public func childNameForDiagnostics(_ index: SyntaxChildrenIndex) -> String? {
    switch index.data?.indexInParent {
    case 0:
      return nil
    case 1:
      return nil
    case 2:
      return nil
    case 3:
      return nil
    case 4:
      return nil
    case 5:
      return nil
    case 6:
      return nil
    default:
      fatalError("Invalid index")
    }
  }
}

extension InfixOperatorExprSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeLeftOperand": unexpectedBeforeLeftOperand.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "leftOperand": Syntax(leftOperand).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenLeftOperandAndOperatorOperand": unexpectedBetweenLeftOperandAndOperatorOperand.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "operatorOperand": Syntax(operatorOperand).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenOperatorOperandAndRightOperand": unexpectedBetweenOperatorOperandAndRightOperand.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "rightOperand": Syntax(rightOperand).asProtocol(SyntaxProtocol.self),
      "unexpectedAfterRightOperand": unexpectedAfterRightOperand.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - FloatLiteralExprSyntax

public struct FloatLiteralExprSyntax: ExprSyntaxProtocol, SyntaxHashable {
  public let _syntaxNode: Syntax

  public init?<S: SyntaxProtocol>(_ node: S) {
    guard node.raw.kind == .floatLiteralExpr else { return nil }
    self._syntaxNode = node._syntaxNode
  }

  /// Creates a `FloatLiteralExprSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .floatLiteralExpr)
    self._syntaxNode = Syntax(data)
  }

  public init(
    leadingTrivia: Trivia? = nil,
    _ unexpectedBeforeFloatingDigits: UnexpectedNodesSyntax? = nil,
    floatingDigits: TokenSyntax,
    _ unexpectedAfterFloatingDigits: UnexpectedNodesSyntax? = nil,
    trailingTrivia: Trivia? = nil
  ) {
    let layout: [RawSyntax?] = [
      unexpectedBeforeFloatingDigits?.raw,
      floatingDigits.raw,
      unexpectedAfterFloatingDigits?.raw,
    ]
    let data: SyntaxData = withExtendedLifetime(SyntaxArena()) { arena in
      let raw = RawSyntax.makeLayout(
        kind: SyntaxKind.floatLiteralExpr, from: layout, arena: arena,
        leadingTrivia: leadingTrivia, trailingTrivia: trailingTrivia)
      return SyntaxData.forRoot(raw)
    }
    self.init(data)
  }

  public var unexpectedBeforeFloatingDigits: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: 0, parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBeforeFloatingDigits(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBeforeFloatingDigits` replaced.
  /// - param newChild: The new `unexpectedBeforeFloatingDigits` to replace the node's
  ///                   current `unexpectedBeforeFloatingDigits`, if present.
  public func withUnexpectedBeforeFloatingDigits(_ newChild: UnexpectedNodesSyntax?) -> FloatLiteralExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 0, with: raw, arena: arena)
    return FloatLiteralExprSyntax(newData)
  }

  public var floatingDigits: TokenSyntax {
    get {
      let childData = data.child(at: 1, parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withFloatingDigits(value)
    }
  }

  /// Returns a copy of the receiver with its `floatingDigits` replaced.
  /// - param newChild: The new `floatingDigits` to replace the node's
  ///                   current `floatingDigits`, if present.
  public func withFloatingDigits(_ newChild: TokenSyntax?) -> FloatLiteralExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.floatingLiteral(""), arena: arena)
    let newData = data.replacingChild(at: 1, with: raw, arena: arena)
    return FloatLiteralExprSyntax(newData)
  }

  public var unexpectedAfterFloatingDigits: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: 2, parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedAfterFloatingDigits(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedAfterFloatingDigits` replaced.
  /// - param newChild: The new `unexpectedAfterFloatingDigits` to replace the node's
  ///                   current `unexpectedAfterFloatingDigits`, if present.
  public func withUnexpectedAfterFloatingDigits(_ newChild: UnexpectedNodesSyntax?) -> FloatLiteralExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 2, with: raw, arena: arena)
    return FloatLiteralExprSyntax(newData)
  }

  public static var structure: SyntaxNodeStructure {
    return .layout([
      \Self.unexpectedBeforeFloatingDigits,
      \Self.floatingDigits,
      \Self.unexpectedAfterFloatingDigits,
    ])
  }

  public func childNameForDiagnostics(_ index: SyntaxChildrenIndex) -> String? {
    switch index.data?.indexInParent {
    case 0:
      return nil
    case 1:
      return nil
    case 2:
      return nil
    default:
      fatalError("Invalid index")
    }
  }
}

extension FloatLiteralExprSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeFloatingDigits": unexpectedBeforeFloatingDigits.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "floatingDigits": Syntax(floatingDigits).asProtocol(SyntaxProtocol.self),
      "unexpectedAfterFloatingDigits": unexpectedAfterFloatingDigits.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - TupleExprSyntax

public struct TupleExprSyntax: ExprSyntaxProtocol, SyntaxHashable {
  public let _syntaxNode: Syntax

  public init?<S: SyntaxProtocol>(_ node: S) {
    guard node.raw.kind == .tupleExpr else { return nil }
    self._syntaxNode = node._syntaxNode
  }

  /// Creates a `TupleExprSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .tupleExpr)
    self._syntaxNode = Syntax(data)
  }

  public init(
    leadingTrivia: Trivia? = nil,
    _ unexpectedBeforeLeftParen: UnexpectedNodesSyntax? = nil,
    leftParen: TokenSyntax = .leftParenToken(),
    _ unexpectedBetweenLeftParenAndElementList: UnexpectedNodesSyntax? = nil,
    elementList: TupleExprElementListSyntax,
    _ unexpectedBetweenElementListAndRightParen: UnexpectedNodesSyntax? = nil,
    rightParen: TokenSyntax = .rightParenToken(),
    _ unexpectedAfterRightParen: UnexpectedNodesSyntax? = nil,
    trailingTrivia: Trivia? = nil
  ) {
    let layout: [RawSyntax?] = [
      unexpectedBeforeLeftParen?.raw,
      leftParen.raw,
      unexpectedBetweenLeftParenAndElementList?.raw,
      elementList.raw,
      unexpectedBetweenElementListAndRightParen?.raw,
      rightParen.raw,
      unexpectedAfterRightParen?.raw,
    ]
    let data: SyntaxData = withExtendedLifetime(SyntaxArena()) { arena in
      let raw = RawSyntax.makeLayout(
        kind: SyntaxKind.tupleExpr, from: layout, arena: arena,
        leadingTrivia: leadingTrivia, trailingTrivia: trailingTrivia)
      return SyntaxData.forRoot(raw)
    }
    self.init(data)
  }

  public var unexpectedBeforeLeftParen: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: 0, parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBeforeLeftParen(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBeforeLeftParen` replaced.
  /// - param newChild: The new `unexpectedBeforeLeftParen` to replace the node's
  ///                   current `unexpectedBeforeLeftParen`, if present.
  public func withUnexpectedBeforeLeftParen(_ newChild: UnexpectedNodesSyntax?) -> TupleExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 0, with: raw, arena: arena)
    return TupleExprSyntax(newData)
  }

  public var leftParen: TokenSyntax {
    get {
      let childData = data.child(at: 1, parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withLeftParen(value)
    }
  }

  /// Returns a copy of the receiver with its `leftParen` replaced.
  /// - param newChild: The new `leftParen` to replace the node's
  ///                   current `leftParen`, if present.
  public func withLeftParen(_ newChild: TokenSyntax?) -> TupleExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.leftParen, arena: arena)
    let newData = data.replacingChild(at: 1, with: raw, arena: arena)
    return TupleExprSyntax(newData)
  }

  public var unexpectedBetweenLeftParenAndElementList: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: 2, parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenLeftParenAndElementList(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenLeftParenAndElementList` replaced.
  /// - param newChild: The new `unexpectedBetweenLeftParenAndElementList` to replace the node's
  ///                   current `unexpectedBetweenLeftParenAndElementList`, if present.
  public func withUnexpectedBetweenLeftParenAndElementList(_ newChild: UnexpectedNodesSyntax?) -> TupleExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 2, with: raw, arena: arena)
    return TupleExprSyntax(newData)
  }

  public var elementList: TupleExprElementListSyntax {
    get {
      let childData = data.child(at: 3, parent: Syntax(self))
      return TupleExprElementListSyntax(childData!)
    }
    set(value) {
      self = withElementList(value)
    }
  }

  /// Adds the provided `Element` to the node's `elementList`
  /// collection.
  /// - param element: The new `Element` to add to the node's
  ///                  `elementList` collection.
  /// - returns: A copy of the receiver with the provided `Element`
  ///            appended to its `elementList` collection.
  public func addElement(_ element: TupleExprElementSyntax) -> TupleExprSyntax {
    var collection: RawSyntax
    let arena = SyntaxArena()
    if let col = raw.layoutView!.children[3] {
      collection = col.layoutView!.appending(element.raw, arena: arena)
    } else {
      collection = RawSyntax.makeLayout(kind: SyntaxKind.tupleExprElementList,
        from: [element.raw], arena: arena)
    }
    let newData = data.replacingChild(at: 3, with: collection, arena: arena)
    return TupleExprSyntax(newData)
  }

  /// Returns a copy of the receiver with its `elementList` replaced.
  /// - param newChild: The new `elementList` to replace the node's
  ///                   current `elementList`, if present.
  public func withElementList(_ newChild: TupleExprElementListSyntax?) -> TupleExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw ?? RawSyntax.makeEmptyLayout(kind: SyntaxKind.tupleExprElementList, arena: arena)
    let newData = data.replacingChild(at: 3, with: raw, arena: arena)
    return TupleExprSyntax(newData)
  }

  public var unexpectedBetweenElementListAndRightParen: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: 4, parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenElementListAndRightParen(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenElementListAndRightParen` replaced.
  /// - param newChild: The new `unexpectedBetweenElementListAndRightParen` to replace the node's
  ///                   current `unexpectedBetweenElementListAndRightParen`, if present.
  public func withUnexpectedBetweenElementListAndRightParen(_ newChild: UnexpectedNodesSyntax?) -> TupleExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 4, with: raw, arena: arena)
    return TupleExprSyntax(newData)
  }

  public var rightParen: TokenSyntax {
    get {
      let childData = data.child(at: 5, parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withRightParen(value)
    }
  }

  /// Returns a copy of the receiver with its `rightParen` replaced.
  /// - param newChild: The new `rightParen` to replace the node's
  ///                   current `rightParen`, if present.
  public func withRightParen(_ newChild: TokenSyntax?) -> TupleExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.rightParen, arena: arena)
    let newData = data.replacingChild(at: 5, with: raw, arena: arena)
    return TupleExprSyntax(newData)
  }

  public var unexpectedAfterRightParen: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: 6, parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedAfterRightParen(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedAfterRightParen` replaced.
  /// - param newChild: The new `unexpectedAfterRightParen` to replace the node's
  ///                   current `unexpectedAfterRightParen`, if present.
  public func withUnexpectedAfterRightParen(_ newChild: UnexpectedNodesSyntax?) -> TupleExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 6, with: raw, arena: arena)
    return TupleExprSyntax(newData)
  }

  public static var structure: SyntaxNodeStructure {
    return .layout([
      \Self.unexpectedBeforeLeftParen,
      \Self.leftParen,
      \Self.unexpectedBetweenLeftParenAndElementList,
      \Self.elementList,
      \Self.unexpectedBetweenElementListAndRightParen,
      \Self.rightParen,
      \Self.unexpectedAfterRightParen,
    ])
  }

  public func childNameForDiagnostics(_ index: SyntaxChildrenIndex) -> String? {
    switch index.data?.indexInParent {
    case 0:
      return nil
    case 1:
      return nil
    case 2:
      return nil
    case 3:
      return nil
    case 4:
      return nil
    case 5:
      return nil
    case 6:
      return nil
    default:
      fatalError("Invalid index")
    }
  }
}

extension TupleExprSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeLeftParen": unexpectedBeforeLeftParen.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "leftParen": Syntax(leftParen).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenLeftParenAndElementList": unexpectedBetweenLeftParenAndElementList.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "elementList": Syntax(elementList).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenElementListAndRightParen": unexpectedBetweenElementListAndRightParen.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "rightParen": Syntax(rightParen).asProtocol(SyntaxProtocol.self),
      "unexpectedAfterRightParen": unexpectedAfterRightParen.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - ArrayExprSyntax

public struct ArrayExprSyntax: ExprSyntaxProtocol, SyntaxHashable {
  public let _syntaxNode: Syntax

  public init?<S: SyntaxProtocol>(_ node: S) {
    guard node.raw.kind == .arrayExpr else { return nil }
    self._syntaxNode = node._syntaxNode
  }

  /// Creates a `ArrayExprSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .arrayExpr)
    self._syntaxNode = Syntax(data)
  }

  public init(
    leadingTrivia: Trivia? = nil,
    _ unexpectedBeforeLeftSquare: UnexpectedNodesSyntax? = nil,
    leftSquare: TokenSyntax = .leftSquareBracketToken(),
    _ unexpectedBetweenLeftSquareAndElements: UnexpectedNodesSyntax? = nil,
    elements: ArrayElementListSyntax,
    _ unexpectedBetweenElementsAndRightSquare: UnexpectedNodesSyntax? = nil,
    rightSquare: TokenSyntax = .rightSquareBracketToken(),
    _ unexpectedAfterRightSquare: UnexpectedNodesSyntax? = nil,
    trailingTrivia: Trivia? = nil
  ) {
    let layout: [RawSyntax?] = [
      unexpectedBeforeLeftSquare?.raw,
      leftSquare.raw,
      unexpectedBetweenLeftSquareAndElements?.raw,
      elements.raw,
      unexpectedBetweenElementsAndRightSquare?.raw,
      rightSquare.raw,
      unexpectedAfterRightSquare?.raw,
    ]
    let data: SyntaxData = withExtendedLifetime(SyntaxArena()) { arena in
      let raw = RawSyntax.makeLayout(
        kind: SyntaxKind.arrayExpr, from: layout, arena: arena,
        leadingTrivia: leadingTrivia, trailingTrivia: trailingTrivia)
      return SyntaxData.forRoot(raw)
    }
    self.init(data)
  }

  public var unexpectedBeforeLeftSquare: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: 0, parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBeforeLeftSquare(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBeforeLeftSquare` replaced.
  /// - param newChild: The new `unexpectedBeforeLeftSquare` to replace the node's
  ///                   current `unexpectedBeforeLeftSquare`, if present.
  public func withUnexpectedBeforeLeftSquare(_ newChild: UnexpectedNodesSyntax?) -> ArrayExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 0, with: raw, arena: arena)
    return ArrayExprSyntax(newData)
  }

  public var leftSquare: TokenSyntax {
    get {
      let childData = data.child(at: 1, parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withLeftSquare(value)
    }
  }

  /// Returns a copy of the receiver with its `leftSquare` replaced.
  /// - param newChild: The new `leftSquare` to replace the node's
  ///                   current `leftSquare`, if present.
  public func withLeftSquare(_ newChild: TokenSyntax?) -> ArrayExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.leftSquareBracket, arena: arena)
    let newData = data.replacingChild(at: 1, with: raw, arena: arena)
    return ArrayExprSyntax(newData)
  }

  public var unexpectedBetweenLeftSquareAndElements: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: 2, parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenLeftSquareAndElements(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenLeftSquareAndElements` replaced.
  /// - param newChild: The new `unexpectedBetweenLeftSquareAndElements` to replace the node's
  ///                   current `unexpectedBetweenLeftSquareAndElements`, if present.
  public func withUnexpectedBetweenLeftSquareAndElements(_ newChild: UnexpectedNodesSyntax?) -> ArrayExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 2, with: raw, arena: arena)
    return ArrayExprSyntax(newData)
  }

  public var elements: ArrayElementListSyntax {
    get {
      let childData = data.child(at: 3, parent: Syntax(self))
      return ArrayElementListSyntax(childData!)
    }
    set(value) {
      self = withElements(value)
    }
  }

  /// Adds the provided `Element` to the node's `elements`
  /// collection.
  /// - param element: The new `Element` to add to the node's
  ///                  `elements` collection.
  /// - returns: A copy of the receiver with the provided `Element`
  ///            appended to its `elements` collection.
  public func addElement(_ element: ArrayElementSyntax) -> ArrayExprSyntax {
    var collection: RawSyntax
    let arena = SyntaxArena()
    if let col = raw.layoutView!.children[3] {
      collection = col.layoutView!.appending(element.raw, arena: arena)
    } else {
      collection = RawSyntax.makeLayout(kind: SyntaxKind.arrayElementList,
        from: [element.raw], arena: arena)
    }
    let newData = data.replacingChild(at: 3, with: collection, arena: arena)
    return ArrayExprSyntax(newData)
  }

  /// Returns a copy of the receiver with its `elements` replaced.
  /// - param newChild: The new `elements` to replace the node's
  ///                   current `elements`, if present.
  public func withElements(_ newChild: ArrayElementListSyntax?) -> ArrayExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw ?? RawSyntax.makeEmptyLayout(kind: SyntaxKind.arrayElementList, arena: arena)
    let newData = data.replacingChild(at: 3, with: raw, arena: arena)
    return ArrayExprSyntax(newData)
  }

  public var unexpectedBetweenElementsAndRightSquare: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: 4, parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenElementsAndRightSquare(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenElementsAndRightSquare` replaced.
  /// - param newChild: The new `unexpectedBetweenElementsAndRightSquare` to replace the node's
  ///                   current `unexpectedBetweenElementsAndRightSquare`, if present.
  public func withUnexpectedBetweenElementsAndRightSquare(_ newChild: UnexpectedNodesSyntax?) -> ArrayExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 4, with: raw, arena: arena)
    return ArrayExprSyntax(newData)
  }

  public var rightSquare: TokenSyntax {
    get {
      let childData = data.child(at: 5, parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withRightSquare(value)
    }
  }

  /// Returns a copy of the receiver with its `rightSquare` replaced.
  /// - param newChild: The new `rightSquare` to replace the node's
  ///                   current `rightSquare`, if present.
  public func withRightSquare(_ newChild: TokenSyntax?) -> ArrayExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.rightSquareBracket, arena: arena)
    let newData = data.replacingChild(at: 5, with: raw, arena: arena)
    return ArrayExprSyntax(newData)
  }

  public var unexpectedAfterRightSquare: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: 6, parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedAfterRightSquare(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedAfterRightSquare` replaced.
  /// - param newChild: The new `unexpectedAfterRightSquare` to replace the node's
  ///                   current `unexpectedAfterRightSquare`, if present.
  public func withUnexpectedAfterRightSquare(_ newChild: UnexpectedNodesSyntax?) -> ArrayExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 6, with: raw, arena: arena)
    return ArrayExprSyntax(newData)
  }

  public static var structure: SyntaxNodeStructure {
    return .layout([
      \Self.unexpectedBeforeLeftSquare,
      \Self.leftSquare,
      \Self.unexpectedBetweenLeftSquareAndElements,
      \Self.elements,
      \Self.unexpectedBetweenElementsAndRightSquare,
      \Self.rightSquare,
      \Self.unexpectedAfterRightSquare,
    ])
  }

  public func childNameForDiagnostics(_ index: SyntaxChildrenIndex) -> String? {
    switch index.data?.indexInParent {
    case 0:
      return nil
    case 1:
      return nil
    case 2:
      return nil
    case 3:
      return nil
    case 4:
      return nil
    case 5:
      return nil
    case 6:
      return nil
    default:
      fatalError("Invalid index")
    }
  }
}

extension ArrayExprSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeLeftSquare": unexpectedBeforeLeftSquare.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "leftSquare": Syntax(leftSquare).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenLeftSquareAndElements": unexpectedBetweenLeftSquareAndElements.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "elements": Syntax(elements).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenElementsAndRightSquare": unexpectedBetweenElementsAndRightSquare.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "rightSquare": Syntax(rightSquare).asProtocol(SyntaxProtocol.self),
      "unexpectedAfterRightSquare": unexpectedAfterRightSquare.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - DictionaryExprSyntax

public struct DictionaryExprSyntax: ExprSyntaxProtocol, SyntaxHashable {
  public enum Content: SyntaxChildChoices {
    case `colon`(TokenSyntax)
    case `elements`(DictionaryElementListSyntax)
    public var _syntaxNode: Syntax {
      switch self {
      case .colon(let node): return node._syntaxNode
      case .elements(let node): return node._syntaxNode
      }
    }
    init(_ data: SyntaxData) { self.init(Syntax(data))! }
    public init(_ node: TokenSyntax) {
      self = .colon(node)
    }
    public init(_ node: DictionaryElementListSyntax) {
      self = .elements(node)
    }
    public init?<S: SyntaxProtocol>(_ node: S) {
      if let node = node.as(TokenSyntax.self) {
        self = .colon(node)
        return
      }
      if let node = node.as(DictionaryElementListSyntax.self) {
        self = .elements(node)
        return
      }
      return nil
    }

    public static var structure: SyntaxNodeStructure {
      return .choices([
        .node(TokenSyntax.self),
        .node(DictionaryElementListSyntax.self),
      ])
    }
  }

  public let _syntaxNode: Syntax

  public init?<S: SyntaxProtocol>(_ node: S) {
    guard node.raw.kind == .dictionaryExpr else { return nil }
    self._syntaxNode = node._syntaxNode
  }

  /// Creates a `DictionaryExprSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .dictionaryExpr)
    self._syntaxNode = Syntax(data)
  }

  public init(
    leadingTrivia: Trivia? = nil,
    _ unexpectedBeforeLeftSquare: UnexpectedNodesSyntax? = nil,
    leftSquare: TokenSyntax = .leftSquareBracketToken(),
    _ unexpectedBetweenLeftSquareAndContent: UnexpectedNodesSyntax? = nil,
    content: Content,
    _ unexpectedBetweenContentAndRightSquare: UnexpectedNodesSyntax? = nil,
    rightSquare: TokenSyntax = .rightSquareBracketToken(),
    _ unexpectedAfterRightSquare: UnexpectedNodesSyntax? = nil,
    trailingTrivia: Trivia? = nil
  ) {
    let layout: [RawSyntax?] = [
      unexpectedBeforeLeftSquare?.raw,
      leftSquare.raw,
      unexpectedBetweenLeftSquareAndContent?.raw,
      content.raw,
      unexpectedBetweenContentAndRightSquare?.raw,
      rightSquare.raw,
      unexpectedAfterRightSquare?.raw,
    ]
    let data: SyntaxData = withExtendedLifetime(SyntaxArena()) { arena in
      let raw = RawSyntax.makeLayout(
        kind: SyntaxKind.dictionaryExpr, from: layout, arena: arena,
        leadingTrivia: leadingTrivia, trailingTrivia: trailingTrivia)
      return SyntaxData.forRoot(raw)
    }
    self.init(data)
  }

  public var unexpectedBeforeLeftSquare: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: 0, parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBeforeLeftSquare(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBeforeLeftSquare` replaced.
  /// - param newChild: The new `unexpectedBeforeLeftSquare` to replace the node's
  ///                   current `unexpectedBeforeLeftSquare`, if present.
  public func withUnexpectedBeforeLeftSquare(_ newChild: UnexpectedNodesSyntax?) -> DictionaryExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 0, with: raw, arena: arena)
    return DictionaryExprSyntax(newData)
  }

  public var leftSquare: TokenSyntax {
    get {
      let childData = data.child(at: 1, parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withLeftSquare(value)
    }
  }

  /// Returns a copy of the receiver with its `leftSquare` replaced.
  /// - param newChild: The new `leftSquare` to replace the node's
  ///                   current `leftSquare`, if present.
  public func withLeftSquare(_ newChild: TokenSyntax?) -> DictionaryExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.leftSquareBracket, arena: arena)
    let newData = data.replacingChild(at: 1, with: raw, arena: arena)
    return DictionaryExprSyntax(newData)
  }

  public var unexpectedBetweenLeftSquareAndContent: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: 2, parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenLeftSquareAndContent(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenLeftSquareAndContent` replaced.
  /// - param newChild: The new `unexpectedBetweenLeftSquareAndContent` to replace the node's
  ///                   current `unexpectedBetweenLeftSquareAndContent`, if present.
  public func withUnexpectedBetweenLeftSquareAndContent(_ newChild: UnexpectedNodesSyntax?) -> DictionaryExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 2, with: raw, arena: arena)
    return DictionaryExprSyntax(newData)
  }

  public var content: Content {
    get {
      let childData = data.child(at: 3, parent: Syntax(self))
      return Content(childData!)
    }
    set(value) {
      self = withContent(value)
    }
  }

  /// Returns a copy of the receiver with its `content` replaced.
  /// - param newChild: The new `content` to replace the node's
  ///                   current `content`, if present.
  public func withContent(_ newChild: Content?) -> DictionaryExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw ?? RawSyntax.makeEmptyLayout(kind: SyntaxKind.missing, arena: arena)
    let newData = data.replacingChild(at: 3, with: raw, arena: arena)
    return DictionaryExprSyntax(newData)
  }

  public var unexpectedBetweenContentAndRightSquare: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: 4, parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenContentAndRightSquare(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenContentAndRightSquare` replaced.
  /// - param newChild: The new `unexpectedBetweenContentAndRightSquare` to replace the node's
  ///                   current `unexpectedBetweenContentAndRightSquare`, if present.
  public func withUnexpectedBetweenContentAndRightSquare(_ newChild: UnexpectedNodesSyntax?) -> DictionaryExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 4, with: raw, arena: arena)
    return DictionaryExprSyntax(newData)
  }

  public var rightSquare: TokenSyntax {
    get {
      let childData = data.child(at: 5, parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withRightSquare(value)
    }
  }

  /// Returns a copy of the receiver with its `rightSquare` replaced.
  /// - param newChild: The new `rightSquare` to replace the node's
  ///                   current `rightSquare`, if present.
  public func withRightSquare(_ newChild: TokenSyntax?) -> DictionaryExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.rightSquareBracket, arena: arena)
    let newData = data.replacingChild(at: 5, with: raw, arena: arena)
    return DictionaryExprSyntax(newData)
  }

  public var unexpectedAfterRightSquare: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: 6, parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedAfterRightSquare(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedAfterRightSquare` replaced.
  /// - param newChild: The new `unexpectedAfterRightSquare` to replace the node's
  ///                   current `unexpectedAfterRightSquare`, if present.
  public func withUnexpectedAfterRightSquare(_ newChild: UnexpectedNodesSyntax?) -> DictionaryExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 6, with: raw, arena: arena)
    return DictionaryExprSyntax(newData)
  }

  public static var structure: SyntaxNodeStructure {
    return .layout([
      \Self.unexpectedBeforeLeftSquare,
      \Self.leftSquare,
      \Self.unexpectedBetweenLeftSquareAndContent,
      \Self.content,
      \Self.unexpectedBetweenContentAndRightSquare,
      \Self.rightSquare,
      \Self.unexpectedAfterRightSquare,
    ])
  }

  public func childNameForDiagnostics(_ index: SyntaxChildrenIndex) -> String? {
    switch index.data?.indexInParent {
    case 0:
      return nil
    case 1:
      return nil
    case 2:
      return nil
    case 3:
      return nil
    case 4:
      return nil
    case 5:
      return nil
    case 6:
      return nil
    default:
      fatalError("Invalid index")
    }
  }
}

extension DictionaryExprSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeLeftSquare": unexpectedBeforeLeftSquare.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "leftSquare": Syntax(leftSquare).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenLeftSquareAndContent": unexpectedBetweenLeftSquareAndContent.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "content": Syntax(content).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenContentAndRightSquare": unexpectedBetweenContentAndRightSquare.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "rightSquare": Syntax(rightSquare).asProtocol(SyntaxProtocol.self),
      "unexpectedAfterRightSquare": unexpectedAfterRightSquare.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - IntegerLiteralExprSyntax

public struct IntegerLiteralExprSyntax: ExprSyntaxProtocol, SyntaxHashable {
  public let _syntaxNode: Syntax

  public init?<S: SyntaxProtocol>(_ node: S) {
    guard node.raw.kind == .integerLiteralExpr else { return nil }
    self._syntaxNode = node._syntaxNode
  }

  /// Creates a `IntegerLiteralExprSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .integerLiteralExpr)
    self._syntaxNode = Syntax(data)
  }

  public init(
    leadingTrivia: Trivia? = nil,
    _ unexpectedBeforeDigits: UnexpectedNodesSyntax? = nil,
    digits: TokenSyntax,
    _ unexpectedAfterDigits: UnexpectedNodesSyntax? = nil,
    trailingTrivia: Trivia? = nil
  ) {
    let layout: [RawSyntax?] = [
      unexpectedBeforeDigits?.raw,
      digits.raw,
      unexpectedAfterDigits?.raw,
    ]
    let data: SyntaxData = withExtendedLifetime(SyntaxArena()) { arena in
      let raw = RawSyntax.makeLayout(
        kind: SyntaxKind.integerLiteralExpr, from: layout, arena: arena,
        leadingTrivia: leadingTrivia, trailingTrivia: trailingTrivia)
      return SyntaxData.forRoot(raw)
    }
    self.init(data)
  }

  public var unexpectedBeforeDigits: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: 0, parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBeforeDigits(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBeforeDigits` replaced.
  /// - param newChild: The new `unexpectedBeforeDigits` to replace the node's
  ///                   current `unexpectedBeforeDigits`, if present.
  public func withUnexpectedBeforeDigits(_ newChild: UnexpectedNodesSyntax?) -> IntegerLiteralExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 0, with: raw, arena: arena)
    return IntegerLiteralExprSyntax(newData)
  }

  public var digits: TokenSyntax {
    get {
      let childData = data.child(at: 1, parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withDigits(value)
    }
  }

  /// Returns a copy of the receiver with its `digits` replaced.
  /// - param newChild: The new `digits` to replace the node's
  ///                   current `digits`, if present.
  public func withDigits(_ newChild: TokenSyntax?) -> IntegerLiteralExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.integerLiteral(""), arena: arena)
    let newData = data.replacingChild(at: 1, with: raw, arena: arena)
    return IntegerLiteralExprSyntax(newData)
  }

  public var unexpectedAfterDigits: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: 2, parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedAfterDigits(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedAfterDigits` replaced.
  /// - param newChild: The new `unexpectedAfterDigits` to replace the node's
  ///                   current `unexpectedAfterDigits`, if present.
  public func withUnexpectedAfterDigits(_ newChild: UnexpectedNodesSyntax?) -> IntegerLiteralExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 2, with: raw, arena: arena)
    return IntegerLiteralExprSyntax(newData)
  }

  public static var structure: SyntaxNodeStructure {
    return .layout([
      \Self.unexpectedBeforeDigits,
      \Self.digits,
      \Self.unexpectedAfterDigits,
    ])
  }

  public func childNameForDiagnostics(_ index: SyntaxChildrenIndex) -> String? {
    switch index.data?.indexInParent {
    case 0:
      return nil
    case 1:
      return nil
    case 2:
      return nil
    default:
      fatalError("Invalid index")
    }
  }
}

extension IntegerLiteralExprSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeDigits": unexpectedBeforeDigits.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "digits": Syntax(digits).asProtocol(SyntaxProtocol.self),
      "unexpectedAfterDigits": unexpectedAfterDigits.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - BooleanLiteralExprSyntax

public struct BooleanLiteralExprSyntax: ExprSyntaxProtocol, SyntaxHashable {
  public let _syntaxNode: Syntax

  public init?<S: SyntaxProtocol>(_ node: S) {
    guard node.raw.kind == .booleanLiteralExpr else { return nil }
    self._syntaxNode = node._syntaxNode
  }

  /// Creates a `BooleanLiteralExprSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .booleanLiteralExpr)
    self._syntaxNode = Syntax(data)
  }

  public init(
    leadingTrivia: Trivia? = nil,
    _ unexpectedBeforeBooleanLiteral: UnexpectedNodesSyntax? = nil,
    booleanLiteral: TokenSyntax,
    _ unexpectedAfterBooleanLiteral: UnexpectedNodesSyntax? = nil,
    trailingTrivia: Trivia? = nil
  ) {
    let layout: [RawSyntax?] = [
      unexpectedBeforeBooleanLiteral?.raw,
      booleanLiteral.raw,
      unexpectedAfterBooleanLiteral?.raw,
    ]
    let data: SyntaxData = withExtendedLifetime(SyntaxArena()) { arena in
      let raw = RawSyntax.makeLayout(
        kind: SyntaxKind.booleanLiteralExpr, from: layout, arena: arena,
        leadingTrivia: leadingTrivia, trailingTrivia: trailingTrivia)
      return SyntaxData.forRoot(raw)
    }
    self.init(data)
  }

  public var unexpectedBeforeBooleanLiteral: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: 0, parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBeforeBooleanLiteral(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBeforeBooleanLiteral` replaced.
  /// - param newChild: The new `unexpectedBeforeBooleanLiteral` to replace the node's
  ///                   current `unexpectedBeforeBooleanLiteral`, if present.
  public func withUnexpectedBeforeBooleanLiteral(_ newChild: UnexpectedNodesSyntax?) -> BooleanLiteralExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 0, with: raw, arena: arena)
    return BooleanLiteralExprSyntax(newData)
  }

  public var booleanLiteral: TokenSyntax {
    get {
      let childData = data.child(at: 1, parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withBooleanLiteral(value)
    }
  }

  /// Returns a copy of the receiver with its `booleanLiteral` replaced.
  /// - param newChild: The new `booleanLiteral` to replace the node's
  ///                   current `booleanLiteral`, if present.
  public func withBooleanLiteral(_ newChild: TokenSyntax?) -> BooleanLiteralExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.trueKeyword, arena: arena)
    let newData = data.replacingChild(at: 1, with: raw, arena: arena)
    return BooleanLiteralExprSyntax(newData)
  }

  public var unexpectedAfterBooleanLiteral: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: 2, parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedAfterBooleanLiteral(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedAfterBooleanLiteral` replaced.
  /// - param newChild: The new `unexpectedAfterBooleanLiteral` to replace the node's
  ///                   current `unexpectedAfterBooleanLiteral`, if present.
  public func withUnexpectedAfterBooleanLiteral(_ newChild: UnexpectedNodesSyntax?) -> BooleanLiteralExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 2, with: raw, arena: arena)
    return BooleanLiteralExprSyntax(newData)
  }

  public static var structure: SyntaxNodeStructure {
    return .layout([
      \Self.unexpectedBeforeBooleanLiteral,
      \Self.booleanLiteral,
      \Self.unexpectedAfterBooleanLiteral,
    ])
  }

  public func childNameForDiagnostics(_ index: SyntaxChildrenIndex) -> String? {
    switch index.data?.indexInParent {
    case 0:
      return nil
    case 1:
      return nil
    case 2:
      return nil
    default:
      fatalError("Invalid index")
    }
  }
}

extension BooleanLiteralExprSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeBooleanLiteral": unexpectedBeforeBooleanLiteral.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "booleanLiteral": Syntax(booleanLiteral).asProtocol(SyntaxProtocol.self),
      "unexpectedAfterBooleanLiteral": unexpectedAfterBooleanLiteral.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - UnresolvedTernaryExprSyntax

public struct UnresolvedTernaryExprSyntax: ExprSyntaxProtocol, SyntaxHashable {
  public let _syntaxNode: Syntax

  public init?<S: SyntaxProtocol>(_ node: S) {
    guard node.raw.kind == .unresolvedTernaryExpr else { return nil }
    self._syntaxNode = node._syntaxNode
  }

  /// Creates a `UnresolvedTernaryExprSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .unresolvedTernaryExpr)
    self._syntaxNode = Syntax(data)
  }

  public init<F: ExprSyntaxProtocol>(
    leadingTrivia: Trivia? = nil,
    _ unexpectedBeforeQuestionMark: UnexpectedNodesSyntax? = nil,
    questionMark: TokenSyntax = .infixQuestionMarkToken(),
    _ unexpectedBetweenQuestionMarkAndFirstChoice: UnexpectedNodesSyntax? = nil,
    firstChoice: F,
    _ unexpectedBetweenFirstChoiceAndColonMark: UnexpectedNodesSyntax? = nil,
    colonMark: TokenSyntax = .colonToken(),
    _ unexpectedAfterColonMark: UnexpectedNodesSyntax? = nil,
    trailingTrivia: Trivia? = nil
  ) {
    let layout: [RawSyntax?] = [
      unexpectedBeforeQuestionMark?.raw,
      questionMark.raw,
      unexpectedBetweenQuestionMarkAndFirstChoice?.raw,
      firstChoice.raw,
      unexpectedBetweenFirstChoiceAndColonMark?.raw,
      colonMark.raw,
      unexpectedAfterColonMark?.raw,
    ]
    let data: SyntaxData = withExtendedLifetime(SyntaxArena()) { arena in
      let raw = RawSyntax.makeLayout(
        kind: SyntaxKind.unresolvedTernaryExpr, from: layout, arena: arena,
        leadingTrivia: leadingTrivia, trailingTrivia: trailingTrivia)
      return SyntaxData.forRoot(raw)
    }
    self.init(data)
  }

  public var unexpectedBeforeQuestionMark: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: 0, parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBeforeQuestionMark(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBeforeQuestionMark` replaced.
  /// - param newChild: The new `unexpectedBeforeQuestionMark` to replace the node's
  ///                   current `unexpectedBeforeQuestionMark`, if present.
  public func withUnexpectedBeforeQuestionMark(_ newChild: UnexpectedNodesSyntax?) -> UnresolvedTernaryExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 0, with: raw, arena: arena)
    return UnresolvedTernaryExprSyntax(newData)
  }

  public var questionMark: TokenSyntax {
    get {
      let childData = data.child(at: 1, parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withQuestionMark(value)
    }
  }

  /// Returns a copy of the receiver with its `questionMark` replaced.
  /// - param newChild: The new `questionMark` to replace the node's
  ///                   current `questionMark`, if present.
  public func withQuestionMark(_ newChild: TokenSyntax?) -> UnresolvedTernaryExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.infixQuestionMark, arena: arena)
    let newData = data.replacingChild(at: 1, with: raw, arena: arena)
    return UnresolvedTernaryExprSyntax(newData)
  }

  public var unexpectedBetweenQuestionMarkAndFirstChoice: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: 2, parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenQuestionMarkAndFirstChoice(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenQuestionMarkAndFirstChoice` replaced.
  /// - param newChild: The new `unexpectedBetweenQuestionMarkAndFirstChoice` to replace the node's
  ///                   current `unexpectedBetweenQuestionMarkAndFirstChoice`, if present.
  public func withUnexpectedBetweenQuestionMarkAndFirstChoice(_ newChild: UnexpectedNodesSyntax?) -> UnresolvedTernaryExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 2, with: raw, arena: arena)
    return UnresolvedTernaryExprSyntax(newData)
  }

  public var firstChoice: ExprSyntax {
    get {
      let childData = data.child(at: 3, parent: Syntax(self))
      return ExprSyntax(childData!)
    }
    set(value) {
      self = withFirstChoice(value)
    }
  }

  /// Returns a copy of the receiver with its `firstChoice` replaced.
  /// - param newChild: The new `firstChoice` to replace the node's
  ///                   current `firstChoice`, if present.
  public func withFirstChoice(_ newChild: ExprSyntax?) -> UnresolvedTernaryExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw ?? RawSyntax.makeEmptyLayout(kind: SyntaxKind.missingExpr, arena: arena)
    let newData = data.replacingChild(at: 3, with: raw, arena: arena)
    return UnresolvedTernaryExprSyntax(newData)
  }

  public var unexpectedBetweenFirstChoiceAndColonMark: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: 4, parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenFirstChoiceAndColonMark(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenFirstChoiceAndColonMark` replaced.
  /// - param newChild: The new `unexpectedBetweenFirstChoiceAndColonMark` to replace the node's
  ///                   current `unexpectedBetweenFirstChoiceAndColonMark`, if present.
  public func withUnexpectedBetweenFirstChoiceAndColonMark(_ newChild: UnexpectedNodesSyntax?) -> UnresolvedTernaryExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 4, with: raw, arena: arena)
    return UnresolvedTernaryExprSyntax(newData)
  }

  public var colonMark: TokenSyntax {
    get {
      let childData = data.child(at: 5, parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withColonMark(value)
    }
  }

  /// Returns a copy of the receiver with its `colonMark` replaced.
  /// - param newChild: The new `colonMark` to replace the node's
  ///                   current `colonMark`, if present.
  public func withColonMark(_ newChild: TokenSyntax?) -> UnresolvedTernaryExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.colon, arena: arena)
    let newData = data.replacingChild(at: 5, with: raw, arena: arena)
    return UnresolvedTernaryExprSyntax(newData)
  }

  public var unexpectedAfterColonMark: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: 6, parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedAfterColonMark(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedAfterColonMark` replaced.
  /// - param newChild: The new `unexpectedAfterColonMark` to replace the node's
  ///                   current `unexpectedAfterColonMark`, if present.
  public func withUnexpectedAfterColonMark(_ newChild: UnexpectedNodesSyntax?) -> UnresolvedTernaryExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 6, with: raw, arena: arena)
    return UnresolvedTernaryExprSyntax(newData)
  }

  public static var structure: SyntaxNodeStructure {
    return .layout([
      \Self.unexpectedBeforeQuestionMark,
      \Self.questionMark,
      \Self.unexpectedBetweenQuestionMarkAndFirstChoice,
      \Self.firstChoice,
      \Self.unexpectedBetweenFirstChoiceAndColonMark,
      \Self.colonMark,
      \Self.unexpectedAfterColonMark,
    ])
  }

  public func childNameForDiagnostics(_ index: SyntaxChildrenIndex) -> String? {
    switch index.data?.indexInParent {
    case 0:
      return nil
    case 1:
      return nil
    case 2:
      return nil
    case 3:
      return nil
    case 4:
      return nil
    case 5:
      return nil
    case 6:
      return nil
    default:
      fatalError("Invalid index")
    }
  }
}

extension UnresolvedTernaryExprSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeQuestionMark": unexpectedBeforeQuestionMark.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "questionMark": Syntax(questionMark).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenQuestionMarkAndFirstChoice": unexpectedBetweenQuestionMarkAndFirstChoice.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "firstChoice": Syntax(firstChoice).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenFirstChoiceAndColonMark": unexpectedBetweenFirstChoiceAndColonMark.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "colonMark": Syntax(colonMark).asProtocol(SyntaxProtocol.self),
      "unexpectedAfterColonMark": unexpectedAfterColonMark.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - TernaryExprSyntax

public struct TernaryExprSyntax: ExprSyntaxProtocol, SyntaxHashable {
  public let _syntaxNode: Syntax

  public init?<S: SyntaxProtocol>(_ node: S) {
    guard node.raw.kind == .ternaryExpr else { return nil }
    self._syntaxNode = node._syntaxNode
  }

  /// Creates a `TernaryExprSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .ternaryExpr)
    self._syntaxNode = Syntax(data)
  }

  public init<C: ExprSyntaxProtocol, F: ExprSyntaxProtocol, S: ExprSyntaxProtocol>(
    leadingTrivia: Trivia? = nil,
    _ unexpectedBeforeConditionExpression: UnexpectedNodesSyntax? = nil,
    conditionExpression: C,
    _ unexpectedBetweenConditionExpressionAndQuestionMark: UnexpectedNodesSyntax? = nil,
    questionMark: TokenSyntax = .infixQuestionMarkToken(),
    _ unexpectedBetweenQuestionMarkAndFirstChoice: UnexpectedNodesSyntax? = nil,
    firstChoice: F,
    _ unexpectedBetweenFirstChoiceAndColonMark: UnexpectedNodesSyntax? = nil,
    colonMark: TokenSyntax = .colonToken(),
    _ unexpectedBetweenColonMarkAndSecondChoice: UnexpectedNodesSyntax? = nil,
    secondChoice: S,
    _ unexpectedAfterSecondChoice: UnexpectedNodesSyntax? = nil,
    trailingTrivia: Trivia? = nil
  ) {
    let layout: [RawSyntax?] = [
      unexpectedBeforeConditionExpression?.raw,
      conditionExpression.raw,
      unexpectedBetweenConditionExpressionAndQuestionMark?.raw,
      questionMark.raw,
      unexpectedBetweenQuestionMarkAndFirstChoice?.raw,
      firstChoice.raw,
      unexpectedBetweenFirstChoiceAndColonMark?.raw,
      colonMark.raw,
      unexpectedBetweenColonMarkAndSecondChoice?.raw,
      secondChoice.raw,
      unexpectedAfterSecondChoice?.raw,
    ]
    let data: SyntaxData = withExtendedLifetime(SyntaxArena()) { arena in
      let raw = RawSyntax.makeLayout(
        kind: SyntaxKind.ternaryExpr, from: layout, arena: arena,
        leadingTrivia: leadingTrivia, trailingTrivia: trailingTrivia)
      return SyntaxData.forRoot(raw)
    }
    self.init(data)
  }

  public var unexpectedBeforeConditionExpression: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: 0, parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBeforeConditionExpression(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBeforeConditionExpression` replaced.
  /// - param newChild: The new `unexpectedBeforeConditionExpression` to replace the node's
  ///                   current `unexpectedBeforeConditionExpression`, if present.
  public func withUnexpectedBeforeConditionExpression(_ newChild: UnexpectedNodesSyntax?) -> TernaryExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 0, with: raw, arena: arena)
    return TernaryExprSyntax(newData)
  }

  public var conditionExpression: ExprSyntax {
    get {
      let childData = data.child(at: 1, parent: Syntax(self))
      return ExprSyntax(childData!)
    }
    set(value) {
      self = withConditionExpression(value)
    }
  }

  /// Returns a copy of the receiver with its `conditionExpression` replaced.
  /// - param newChild: The new `conditionExpression` to replace the node's
  ///                   current `conditionExpression`, if present.
  public func withConditionExpression(_ newChild: ExprSyntax?) -> TernaryExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw ?? RawSyntax.makeEmptyLayout(kind: SyntaxKind.missingExpr, arena: arena)
    let newData = data.replacingChild(at: 1, with: raw, arena: arena)
    return TernaryExprSyntax(newData)
  }

  public var unexpectedBetweenConditionExpressionAndQuestionMark: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: 2, parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenConditionExpressionAndQuestionMark(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenConditionExpressionAndQuestionMark` replaced.
  /// - param newChild: The new `unexpectedBetweenConditionExpressionAndQuestionMark` to replace the node's
  ///                   current `unexpectedBetweenConditionExpressionAndQuestionMark`, if present.
  public func withUnexpectedBetweenConditionExpressionAndQuestionMark(_ newChild: UnexpectedNodesSyntax?) -> TernaryExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 2, with: raw, arena: arena)
    return TernaryExprSyntax(newData)
  }

  public var questionMark: TokenSyntax {
    get {
      let childData = data.child(at: 3, parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withQuestionMark(value)
    }
  }

  /// Returns a copy of the receiver with its `questionMark` replaced.
  /// - param newChild: The new `questionMark` to replace the node's
  ///                   current `questionMark`, if present.
  public func withQuestionMark(_ newChild: TokenSyntax?) -> TernaryExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.infixQuestionMark, arena: arena)
    let newData = data.replacingChild(at: 3, with: raw, arena: arena)
    return TernaryExprSyntax(newData)
  }

  public var unexpectedBetweenQuestionMarkAndFirstChoice: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: 4, parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenQuestionMarkAndFirstChoice(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenQuestionMarkAndFirstChoice` replaced.
  /// - param newChild: The new `unexpectedBetweenQuestionMarkAndFirstChoice` to replace the node's
  ///                   current `unexpectedBetweenQuestionMarkAndFirstChoice`, if present.
  public func withUnexpectedBetweenQuestionMarkAndFirstChoice(_ newChild: UnexpectedNodesSyntax?) -> TernaryExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 4, with: raw, arena: arena)
    return TernaryExprSyntax(newData)
  }

  public var firstChoice: ExprSyntax {
    get {
      let childData = data.child(at: 5, parent: Syntax(self))
      return ExprSyntax(childData!)
    }
    set(value) {
      self = withFirstChoice(value)
    }
  }

  /// Returns a copy of the receiver with its `firstChoice` replaced.
  /// - param newChild: The new `firstChoice` to replace the node's
  ///                   current `firstChoice`, if present.
  public func withFirstChoice(_ newChild: ExprSyntax?) -> TernaryExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw ?? RawSyntax.makeEmptyLayout(kind: SyntaxKind.missingExpr, arena: arena)
    let newData = data.replacingChild(at: 5, with: raw, arena: arena)
    return TernaryExprSyntax(newData)
  }

  public var unexpectedBetweenFirstChoiceAndColonMark: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: 6, parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenFirstChoiceAndColonMark(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenFirstChoiceAndColonMark` replaced.
  /// - param newChild: The new `unexpectedBetweenFirstChoiceAndColonMark` to replace the node's
  ///                   current `unexpectedBetweenFirstChoiceAndColonMark`, if present.
  public func withUnexpectedBetweenFirstChoiceAndColonMark(_ newChild: UnexpectedNodesSyntax?) -> TernaryExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 6, with: raw, arena: arena)
    return TernaryExprSyntax(newData)
  }

  public var colonMark: TokenSyntax {
    get {
      let childData = data.child(at: 7, parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withColonMark(value)
    }
  }

  /// Returns a copy of the receiver with its `colonMark` replaced.
  /// - param newChild: The new `colonMark` to replace the node's
  ///                   current `colonMark`, if present.
  public func withColonMark(_ newChild: TokenSyntax?) -> TernaryExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.colon, arena: arena)
    let newData = data.replacingChild(at: 7, with: raw, arena: arena)
    return TernaryExprSyntax(newData)
  }

  public var unexpectedBetweenColonMarkAndSecondChoice: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: 8, parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenColonMarkAndSecondChoice(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenColonMarkAndSecondChoice` replaced.
  /// - param newChild: The new `unexpectedBetweenColonMarkAndSecondChoice` to replace the node's
  ///                   current `unexpectedBetweenColonMarkAndSecondChoice`, if present.
  public func withUnexpectedBetweenColonMarkAndSecondChoice(_ newChild: UnexpectedNodesSyntax?) -> TernaryExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 8, with: raw, arena: arena)
    return TernaryExprSyntax(newData)
  }

  public var secondChoice: ExprSyntax {
    get {
      let childData = data.child(at: 9, parent: Syntax(self))
      return ExprSyntax(childData!)
    }
    set(value) {
      self = withSecondChoice(value)
    }
  }

  /// Returns a copy of the receiver with its `secondChoice` replaced.
  /// - param newChild: The new `secondChoice` to replace the node's
  ///                   current `secondChoice`, if present.
  public func withSecondChoice(_ newChild: ExprSyntax?) -> TernaryExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw ?? RawSyntax.makeEmptyLayout(kind: SyntaxKind.missingExpr, arena: arena)
    let newData = data.replacingChild(at: 9, with: raw, arena: arena)
    return TernaryExprSyntax(newData)
  }

  public var unexpectedAfterSecondChoice: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: 10, parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedAfterSecondChoice(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedAfterSecondChoice` replaced.
  /// - param newChild: The new `unexpectedAfterSecondChoice` to replace the node's
  ///                   current `unexpectedAfterSecondChoice`, if present.
  public func withUnexpectedAfterSecondChoice(_ newChild: UnexpectedNodesSyntax?) -> TernaryExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 10, with: raw, arena: arena)
    return TernaryExprSyntax(newData)
  }

  public static var structure: SyntaxNodeStructure {
    return .layout([
      \Self.unexpectedBeforeConditionExpression,
      \Self.conditionExpression,
      \Self.unexpectedBetweenConditionExpressionAndQuestionMark,
      \Self.questionMark,
      \Self.unexpectedBetweenQuestionMarkAndFirstChoice,
      \Self.firstChoice,
      \Self.unexpectedBetweenFirstChoiceAndColonMark,
      \Self.colonMark,
      \Self.unexpectedBetweenColonMarkAndSecondChoice,
      \Self.secondChoice,
      \Self.unexpectedAfterSecondChoice,
    ])
  }

  public func childNameForDiagnostics(_ index: SyntaxChildrenIndex) -> String? {
    switch index.data?.indexInParent {
    case 0:
      return nil
    case 1:
      return "condition"
    case 2:
      return nil
    case 3:
      return nil
    case 4:
      return nil
    case 5:
      return "first choice"
    case 6:
      return nil
    case 7:
      return nil
    case 8:
      return nil
    case 9:
      return "second choice"
    case 10:
      return nil
    default:
      fatalError("Invalid index")
    }
  }
}

extension TernaryExprSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeConditionExpression": unexpectedBeforeConditionExpression.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "conditionExpression": Syntax(conditionExpression).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenConditionExpressionAndQuestionMark": unexpectedBetweenConditionExpressionAndQuestionMark.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "questionMark": Syntax(questionMark).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenQuestionMarkAndFirstChoice": unexpectedBetweenQuestionMarkAndFirstChoice.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "firstChoice": Syntax(firstChoice).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenFirstChoiceAndColonMark": unexpectedBetweenFirstChoiceAndColonMark.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "colonMark": Syntax(colonMark).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenColonMarkAndSecondChoice": unexpectedBetweenColonMarkAndSecondChoice.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "secondChoice": Syntax(secondChoice).asProtocol(SyntaxProtocol.self),
      "unexpectedAfterSecondChoice": unexpectedAfterSecondChoice.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - MemberAccessExprSyntax

public struct MemberAccessExprSyntax: ExprSyntaxProtocol, SyntaxHashable {
  public let _syntaxNode: Syntax

  public init?<S: SyntaxProtocol>(_ node: S) {
    guard node.raw.kind == .memberAccessExpr else { return nil }
    self._syntaxNode = node._syntaxNode
  }

  /// Creates a `MemberAccessExprSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .memberAccessExpr)
    self._syntaxNode = Syntax(data)
  }

  public init<B: ExprSyntaxProtocol>(
    leadingTrivia: Trivia? = nil,
    _ unexpectedBeforeBase: UnexpectedNodesSyntax? = nil,
    base: B? = nil,
    _ unexpectedBetweenBaseAndDot: UnexpectedNodesSyntax? = nil,
    dot: TokenSyntax,
    _ unexpectedBetweenDotAndName: UnexpectedNodesSyntax? = nil,
    name: TokenSyntax,
    _ unexpectedBetweenNameAndDeclNameArguments: UnexpectedNodesSyntax? = nil,
    declNameArguments: DeclNameArgumentsSyntax? = nil,
    _ unexpectedAfterDeclNameArguments: UnexpectedNodesSyntax? = nil,
    trailingTrivia: Trivia? = nil
  ) {
    let layout: [RawSyntax?] = [
      unexpectedBeforeBase?.raw,
      base?.raw,
      unexpectedBetweenBaseAndDot?.raw,
      dot.raw,
      unexpectedBetweenDotAndName?.raw,
      name.raw,
      unexpectedBetweenNameAndDeclNameArguments?.raw,
      declNameArguments?.raw,
      unexpectedAfterDeclNameArguments?.raw,
    ]
    let data: SyntaxData = withExtendedLifetime(SyntaxArena()) { arena in
      let raw = RawSyntax.makeLayout(
        kind: SyntaxKind.memberAccessExpr, from: layout, arena: arena,
        leadingTrivia: leadingTrivia, trailingTrivia: trailingTrivia)
      return SyntaxData.forRoot(raw)
    }
    self.init(data)
  }

  /// This initializer exists solely because Swift 5.6 does not support
  /// `Optional<ConcreteType>.none` as a default value of a generic parameter.
  /// The above initializer thus defaults to `nil` instead, but that means it
  /// is not actually callable when either not passing the defaulted parameter,
  /// or passing `nil`.
  ///
  /// Hack around that limitation using this initializer, which takes a
  /// `Missing*` syntax node instead. `Missing*` is used over the base type as
  /// the base type would allow implicit conversion from a string literal,
  /// which the above initializer doesn't support.
  public init(
    leadingTrivia: Trivia? = nil,
    _ unexpectedBeforeBase: UnexpectedNodesSyntax? = nil,
    base: MissingExprSyntax? = nil,
    _ unexpectedBetweenBaseAndDot: UnexpectedNodesSyntax? = nil,
    dot: TokenSyntax,
    _ unexpectedBetweenDotAndName: UnexpectedNodesSyntax? = nil,
    name: TokenSyntax,
    _ unexpectedBetweenNameAndDeclNameArguments: UnexpectedNodesSyntax? = nil,
    declNameArguments: DeclNameArgumentsSyntax? = nil,
    _ unexpectedAfterDeclNameArguments: UnexpectedNodesSyntax? = nil,
    trailingTrivia: Trivia? = nil
  ) {
    self.init(
      leadingTrivia: leadingTrivia,
      unexpectedBeforeBase,
      base: Optional<ExprSyntax>.none,
      unexpectedBetweenBaseAndDot,
      dot: dot,
      unexpectedBetweenDotAndName,
      name: name,
      unexpectedBetweenNameAndDeclNameArguments,
      declNameArguments: declNameArguments,
      unexpectedAfterDeclNameArguments,
      trailingTrivia: trailingTrivia
    )
  }

  public var unexpectedBeforeBase: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: 0, parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBeforeBase(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBeforeBase` replaced.
  /// - param newChild: The new `unexpectedBeforeBase` to replace the node's
  ///                   current `unexpectedBeforeBase`, if present.
  public func withUnexpectedBeforeBase(_ newChild: UnexpectedNodesSyntax?) -> MemberAccessExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 0, with: raw, arena: arena)
    return MemberAccessExprSyntax(newData)
  }

  public var base: ExprSyntax? {
    get {
      let childData = data.child(at: 1, parent: Syntax(self))
      if childData == nil { return nil }
      return ExprSyntax(childData!)
    }
    set(value) {
      self = withBase(value)
    }
  }

  /// Returns a copy of the receiver with its `base` replaced.
  /// - param newChild: The new `base` to replace the node's
  ///                   current `base`, if present.
  public func withBase(_ newChild: ExprSyntax?) -> MemberAccessExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 1, with: raw, arena: arena)
    return MemberAccessExprSyntax(newData)
  }

  public var unexpectedBetweenBaseAndDot: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: 2, parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenBaseAndDot(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenBaseAndDot` replaced.
  /// - param newChild: The new `unexpectedBetweenBaseAndDot` to replace the node's
  ///                   current `unexpectedBetweenBaseAndDot`, if present.
  public func withUnexpectedBetweenBaseAndDot(_ newChild: UnexpectedNodesSyntax?) -> MemberAccessExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 2, with: raw, arena: arena)
    return MemberAccessExprSyntax(newData)
  }

  public var dot: TokenSyntax {
    get {
      let childData = data.child(at: 3, parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withDot(value)
    }
  }

  /// Returns a copy of the receiver with its `dot` replaced.
  /// - param newChild: The new `dot` to replace the node's
  ///                   current `dot`, if present.
  public func withDot(_ newChild: TokenSyntax?) -> MemberAccessExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.period, arena: arena)
    let newData = data.replacingChild(at: 3, with: raw, arena: arena)
    return MemberAccessExprSyntax(newData)
  }

  public var unexpectedBetweenDotAndName: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: 4, parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenDotAndName(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenDotAndName` replaced.
  /// - param newChild: The new `unexpectedBetweenDotAndName` to replace the node's
  ///                   current `unexpectedBetweenDotAndName`, if present.
  public func withUnexpectedBetweenDotAndName(_ newChild: UnexpectedNodesSyntax?) -> MemberAccessExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 4, with: raw, arena: arena)
    return MemberAccessExprSyntax(newData)
  }

  public var name: TokenSyntax {
    get {
      let childData = data.child(at: 5, parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withName(value)
    }
  }

  /// Returns a copy of the receiver with its `name` replaced.
  /// - param newChild: The new `name` to replace the node's
  ///                   current `name`, if present.
  public func withName(_ newChild: TokenSyntax?) -> MemberAccessExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.unknown(""), arena: arena)
    let newData = data.replacingChild(at: 5, with: raw, arena: arena)
    return MemberAccessExprSyntax(newData)
  }

  public var unexpectedBetweenNameAndDeclNameArguments: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: 6, parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenNameAndDeclNameArguments(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenNameAndDeclNameArguments` replaced.
  /// - param newChild: The new `unexpectedBetweenNameAndDeclNameArguments` to replace the node's
  ///                   current `unexpectedBetweenNameAndDeclNameArguments`, if present.
  public func withUnexpectedBetweenNameAndDeclNameArguments(_ newChild: UnexpectedNodesSyntax?) -> MemberAccessExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 6, with: raw, arena: arena)
    return MemberAccessExprSyntax(newData)
  }

  public var declNameArguments: DeclNameArgumentsSyntax? {
    get {
      let childData = data.child(at: 7, parent: Syntax(self))
      if childData == nil { return nil }
      return DeclNameArgumentsSyntax(childData!)
    }
    set(value) {
      self = withDeclNameArguments(value)
    }
  }

  /// Returns a copy of the receiver with its `declNameArguments` replaced.
  /// - param newChild: The new `declNameArguments` to replace the node's
  ///                   current `declNameArguments`, if present.
  public func withDeclNameArguments(_ newChild: DeclNameArgumentsSyntax?) -> MemberAccessExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 7, with: raw, arena: arena)
    return MemberAccessExprSyntax(newData)
  }

  public var unexpectedAfterDeclNameArguments: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: 8, parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedAfterDeclNameArguments(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedAfterDeclNameArguments` replaced.
  /// - param newChild: The new `unexpectedAfterDeclNameArguments` to replace the node's
  ///                   current `unexpectedAfterDeclNameArguments`, if present.
  public func withUnexpectedAfterDeclNameArguments(_ newChild: UnexpectedNodesSyntax?) -> MemberAccessExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 8, with: raw, arena: arena)
    return MemberAccessExprSyntax(newData)
  }

  public static var structure: SyntaxNodeStructure {
    return .layout([
      \Self.unexpectedBeforeBase,
      \Self.base,
      \Self.unexpectedBetweenBaseAndDot,
      \Self.dot,
      \Self.unexpectedBetweenDotAndName,
      \Self.name,
      \Self.unexpectedBetweenNameAndDeclNameArguments,
      \Self.declNameArguments,
      \Self.unexpectedAfterDeclNameArguments,
    ])
  }

  public func childNameForDiagnostics(_ index: SyntaxChildrenIndex) -> String? {
    switch index.data?.indexInParent {
    case 0:
      return nil
    case 1:
      return "base"
    case 2:
      return nil
    case 3:
      return nil
    case 4:
      return nil
    case 5:
      return "name"
    case 6:
      return nil
    case 7:
      return nil
    case 8:
      return nil
    default:
      fatalError("Invalid index")
    }
  }
}

extension MemberAccessExprSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeBase": unexpectedBeforeBase.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "base": base.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenBaseAndDot": unexpectedBetweenBaseAndDot.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "dot": Syntax(dot).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenDotAndName": unexpectedBetweenDotAndName.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "name": Syntax(name).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenNameAndDeclNameArguments": unexpectedBetweenNameAndDeclNameArguments.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "declNameArguments": declNameArguments.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedAfterDeclNameArguments": unexpectedAfterDeclNameArguments.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - UnresolvedIsExprSyntax

public struct UnresolvedIsExprSyntax: ExprSyntaxProtocol, SyntaxHashable {
  public let _syntaxNode: Syntax

  public init?<S: SyntaxProtocol>(_ node: S) {
    guard node.raw.kind == .unresolvedIsExpr else { return nil }
    self._syntaxNode = node._syntaxNode
  }

  /// Creates a `UnresolvedIsExprSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .unresolvedIsExpr)
    self._syntaxNode = Syntax(data)
  }

  public init(
    leadingTrivia: Trivia? = nil,
    _ unexpectedBeforeIsTok: UnexpectedNodesSyntax? = nil,
    isTok: TokenSyntax = .isKeyword(),
    _ unexpectedAfterIsTok: UnexpectedNodesSyntax? = nil,
    trailingTrivia: Trivia? = nil
  ) {
    let layout: [RawSyntax?] = [
      unexpectedBeforeIsTok?.raw,
      isTok.raw,
      unexpectedAfterIsTok?.raw,
    ]
    let data: SyntaxData = withExtendedLifetime(SyntaxArena()) { arena in
      let raw = RawSyntax.makeLayout(
        kind: SyntaxKind.unresolvedIsExpr, from: layout, arena: arena,
        leadingTrivia: leadingTrivia, trailingTrivia: trailingTrivia)
      return SyntaxData.forRoot(raw)
    }
    self.init(data)
  }

  public var unexpectedBeforeIsTok: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: 0, parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBeforeIsTok(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBeforeIsTok` replaced.
  /// - param newChild: The new `unexpectedBeforeIsTok` to replace the node's
  ///                   current `unexpectedBeforeIsTok`, if present.
  public func withUnexpectedBeforeIsTok(_ newChild: UnexpectedNodesSyntax?) -> UnresolvedIsExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 0, with: raw, arena: arena)
    return UnresolvedIsExprSyntax(newData)
  }

  public var isTok: TokenSyntax {
    get {
      let childData = data.child(at: 1, parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withIsTok(value)
    }
  }

  /// Returns a copy of the receiver with its `isTok` replaced.
  /// - param newChild: The new `isTok` to replace the node's
  ///                   current `isTok`, if present.
  public func withIsTok(_ newChild: TokenSyntax?) -> UnresolvedIsExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.isKeyword, arena: arena)
    let newData = data.replacingChild(at: 1, with: raw, arena: arena)
    return UnresolvedIsExprSyntax(newData)
  }

  public var unexpectedAfterIsTok: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: 2, parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedAfterIsTok(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedAfterIsTok` replaced.
  /// - param newChild: The new `unexpectedAfterIsTok` to replace the node's
  ///                   current `unexpectedAfterIsTok`, if present.
  public func withUnexpectedAfterIsTok(_ newChild: UnexpectedNodesSyntax?) -> UnresolvedIsExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 2, with: raw, arena: arena)
    return UnresolvedIsExprSyntax(newData)
  }

  public static var structure: SyntaxNodeStructure {
    return .layout([
      \Self.unexpectedBeforeIsTok,
      \Self.isTok,
      \Self.unexpectedAfterIsTok,
    ])
  }

  public func childNameForDiagnostics(_ index: SyntaxChildrenIndex) -> String? {
    switch index.data?.indexInParent {
    case 0:
      return nil
    case 1:
      return nil
    case 2:
      return nil
    default:
      fatalError("Invalid index")
    }
  }
}

extension UnresolvedIsExprSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeIsTok": unexpectedBeforeIsTok.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "isTok": Syntax(isTok).asProtocol(SyntaxProtocol.self),
      "unexpectedAfterIsTok": unexpectedAfterIsTok.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - IsExprSyntax

public struct IsExprSyntax: ExprSyntaxProtocol, SyntaxHashable {
  public let _syntaxNode: Syntax

  public init?<S: SyntaxProtocol>(_ node: S) {
    guard node.raw.kind == .isExpr else { return nil }
    self._syntaxNode = node._syntaxNode
  }

  /// Creates a `IsExprSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .isExpr)
    self._syntaxNode = Syntax(data)
  }

  public init<E: ExprSyntaxProtocol, T: TypeSyntaxProtocol>(
    leadingTrivia: Trivia? = nil,
    _ unexpectedBeforeExpression: UnexpectedNodesSyntax? = nil,
    expression: E,
    _ unexpectedBetweenExpressionAndIsTok: UnexpectedNodesSyntax? = nil,
    isTok: TokenSyntax = .isKeyword(),
    _ unexpectedBetweenIsTokAndTypeName: UnexpectedNodesSyntax? = nil,
    typeName: T,
    _ unexpectedAfterTypeName: UnexpectedNodesSyntax? = nil,
    trailingTrivia: Trivia? = nil
  ) {
    let layout: [RawSyntax?] = [
      unexpectedBeforeExpression?.raw,
      expression.raw,
      unexpectedBetweenExpressionAndIsTok?.raw,
      isTok.raw,
      unexpectedBetweenIsTokAndTypeName?.raw,
      typeName.raw,
      unexpectedAfterTypeName?.raw,
    ]
    let data: SyntaxData = withExtendedLifetime(SyntaxArena()) { arena in
      let raw = RawSyntax.makeLayout(
        kind: SyntaxKind.isExpr, from: layout, arena: arena,
        leadingTrivia: leadingTrivia, trailingTrivia: trailingTrivia)
      return SyntaxData.forRoot(raw)
    }
    self.init(data)
  }

  public var unexpectedBeforeExpression: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: 0, parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBeforeExpression(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBeforeExpression` replaced.
  /// - param newChild: The new `unexpectedBeforeExpression` to replace the node's
  ///                   current `unexpectedBeforeExpression`, if present.
  public func withUnexpectedBeforeExpression(_ newChild: UnexpectedNodesSyntax?) -> IsExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 0, with: raw, arena: arena)
    return IsExprSyntax(newData)
  }

  public var expression: ExprSyntax {
    get {
      let childData = data.child(at: 1, parent: Syntax(self))
      return ExprSyntax(childData!)
    }
    set(value) {
      self = withExpression(value)
    }
  }

  /// Returns a copy of the receiver with its `expression` replaced.
  /// - param newChild: The new `expression` to replace the node's
  ///                   current `expression`, if present.
  public func withExpression(_ newChild: ExprSyntax?) -> IsExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw ?? RawSyntax.makeEmptyLayout(kind: SyntaxKind.missingExpr, arena: arena)
    let newData = data.replacingChild(at: 1, with: raw, arena: arena)
    return IsExprSyntax(newData)
  }

  public var unexpectedBetweenExpressionAndIsTok: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: 2, parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenExpressionAndIsTok(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenExpressionAndIsTok` replaced.
  /// - param newChild: The new `unexpectedBetweenExpressionAndIsTok` to replace the node's
  ///                   current `unexpectedBetweenExpressionAndIsTok`, if present.
  public func withUnexpectedBetweenExpressionAndIsTok(_ newChild: UnexpectedNodesSyntax?) -> IsExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 2, with: raw, arena: arena)
    return IsExprSyntax(newData)
  }

  public var isTok: TokenSyntax {
    get {
      let childData = data.child(at: 3, parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withIsTok(value)
    }
  }

  /// Returns a copy of the receiver with its `isTok` replaced.
  /// - param newChild: The new `isTok` to replace the node's
  ///                   current `isTok`, if present.
  public func withIsTok(_ newChild: TokenSyntax?) -> IsExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.isKeyword, arena: arena)
    let newData = data.replacingChild(at: 3, with: raw, arena: arena)
    return IsExprSyntax(newData)
  }

  public var unexpectedBetweenIsTokAndTypeName: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: 4, parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenIsTokAndTypeName(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenIsTokAndTypeName` replaced.
  /// - param newChild: The new `unexpectedBetweenIsTokAndTypeName` to replace the node's
  ///                   current `unexpectedBetweenIsTokAndTypeName`, if present.
  public func withUnexpectedBetweenIsTokAndTypeName(_ newChild: UnexpectedNodesSyntax?) -> IsExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 4, with: raw, arena: arena)
    return IsExprSyntax(newData)
  }

  public var typeName: TypeSyntax {
    get {
      let childData = data.child(at: 5, parent: Syntax(self))
      return TypeSyntax(childData!)
    }
    set(value) {
      self = withTypeName(value)
    }
  }

  /// Returns a copy of the receiver with its `typeName` replaced.
  /// - param newChild: The new `typeName` to replace the node's
  ///                   current `typeName`, if present.
  public func withTypeName(_ newChild: TypeSyntax?) -> IsExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw ?? RawSyntax.makeEmptyLayout(kind: SyntaxKind.missingType, arena: arena)
    let newData = data.replacingChild(at: 5, with: raw, arena: arena)
    return IsExprSyntax(newData)
  }

  public var unexpectedAfterTypeName: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: 6, parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedAfterTypeName(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedAfterTypeName` replaced.
  /// - param newChild: The new `unexpectedAfterTypeName` to replace the node's
  ///                   current `unexpectedAfterTypeName`, if present.
  public func withUnexpectedAfterTypeName(_ newChild: UnexpectedNodesSyntax?) -> IsExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 6, with: raw, arena: arena)
    return IsExprSyntax(newData)
  }

  public static var structure: SyntaxNodeStructure {
    return .layout([
      \Self.unexpectedBeforeExpression,
      \Self.expression,
      \Self.unexpectedBetweenExpressionAndIsTok,
      \Self.isTok,
      \Self.unexpectedBetweenIsTokAndTypeName,
      \Self.typeName,
      \Self.unexpectedAfterTypeName,
    ])
  }

  public func childNameForDiagnostics(_ index: SyntaxChildrenIndex) -> String? {
    switch index.data?.indexInParent {
    case 0:
      return nil
    case 1:
      return nil
    case 2:
      return nil
    case 3:
      return nil
    case 4:
      return nil
    case 5:
      return nil
    case 6:
      return nil
    default:
      fatalError("Invalid index")
    }
  }
}

extension IsExprSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeExpression": unexpectedBeforeExpression.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "expression": Syntax(expression).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenExpressionAndIsTok": unexpectedBetweenExpressionAndIsTok.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "isTok": Syntax(isTok).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenIsTokAndTypeName": unexpectedBetweenIsTokAndTypeName.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "typeName": Syntax(typeName).asProtocol(SyntaxProtocol.self),
      "unexpectedAfterTypeName": unexpectedAfterTypeName.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - UnresolvedAsExprSyntax

public struct UnresolvedAsExprSyntax: ExprSyntaxProtocol, SyntaxHashable {
  public let _syntaxNode: Syntax

  public init?<S: SyntaxProtocol>(_ node: S) {
    guard node.raw.kind == .unresolvedAsExpr else { return nil }
    self._syntaxNode = node._syntaxNode
  }

  /// Creates a `UnresolvedAsExprSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .unresolvedAsExpr)
    self._syntaxNode = Syntax(data)
  }

  public init(
    leadingTrivia: Trivia? = nil,
    _ unexpectedBeforeAsTok: UnexpectedNodesSyntax? = nil,
    asTok: TokenSyntax = .asKeyword(),
    _ unexpectedBetweenAsTokAndQuestionOrExclamationMark: UnexpectedNodesSyntax? = nil,
    questionOrExclamationMark: TokenSyntax? = nil,
    _ unexpectedAfterQuestionOrExclamationMark: UnexpectedNodesSyntax? = nil,
    trailingTrivia: Trivia? = nil
  ) {
    let layout: [RawSyntax?] = [
      unexpectedBeforeAsTok?.raw,
      asTok.raw,
      unexpectedBetweenAsTokAndQuestionOrExclamationMark?.raw,
      questionOrExclamationMark?.raw,
      unexpectedAfterQuestionOrExclamationMark?.raw,
    ]
    let data: SyntaxData = withExtendedLifetime(SyntaxArena()) { arena in
      let raw = RawSyntax.makeLayout(
        kind: SyntaxKind.unresolvedAsExpr, from: layout, arena: arena,
        leadingTrivia: leadingTrivia, trailingTrivia: trailingTrivia)
      return SyntaxData.forRoot(raw)
    }
    self.init(data)
  }

  public var unexpectedBeforeAsTok: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: 0, parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBeforeAsTok(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBeforeAsTok` replaced.
  /// - param newChild: The new `unexpectedBeforeAsTok` to replace the node's
  ///                   current `unexpectedBeforeAsTok`, if present.
  public func withUnexpectedBeforeAsTok(_ newChild: UnexpectedNodesSyntax?) -> UnresolvedAsExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 0, with: raw, arena: arena)
    return UnresolvedAsExprSyntax(newData)
  }

  public var asTok: TokenSyntax {
    get {
      let childData = data.child(at: 1, parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withAsTok(value)
    }
  }

  /// Returns a copy of the receiver with its `asTok` replaced.
  /// - param newChild: The new `asTok` to replace the node's
  ///                   current `asTok`, if present.
  public func withAsTok(_ newChild: TokenSyntax?) -> UnresolvedAsExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.asKeyword, arena: arena)
    let newData = data.replacingChild(at: 1, with: raw, arena: arena)
    return UnresolvedAsExprSyntax(newData)
  }

  public var unexpectedBetweenAsTokAndQuestionOrExclamationMark: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: 2, parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenAsTokAndQuestionOrExclamationMark(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenAsTokAndQuestionOrExclamationMark` replaced.
  /// - param newChild: The new `unexpectedBetweenAsTokAndQuestionOrExclamationMark` to replace the node's
  ///                   current `unexpectedBetweenAsTokAndQuestionOrExclamationMark`, if present.
  public func withUnexpectedBetweenAsTokAndQuestionOrExclamationMark(_ newChild: UnexpectedNodesSyntax?) -> UnresolvedAsExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 2, with: raw, arena: arena)
    return UnresolvedAsExprSyntax(newData)
  }

  public var questionOrExclamationMark: TokenSyntax? {
    get {
      let childData = data.child(at: 3, parent: Syntax(self))
      if childData == nil { return nil }
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withQuestionOrExclamationMark(value)
    }
  }

  /// Returns a copy of the receiver with its `questionOrExclamationMark` replaced.
  /// - param newChild: The new `questionOrExclamationMark` to replace the node's
  ///                   current `questionOrExclamationMark`, if present.
  public func withQuestionOrExclamationMark(_ newChild: TokenSyntax?) -> UnresolvedAsExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 3, with: raw, arena: arena)
    return UnresolvedAsExprSyntax(newData)
  }

  public var unexpectedAfterQuestionOrExclamationMark: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: 4, parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedAfterQuestionOrExclamationMark(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedAfterQuestionOrExclamationMark` replaced.
  /// - param newChild: The new `unexpectedAfterQuestionOrExclamationMark` to replace the node's
  ///                   current `unexpectedAfterQuestionOrExclamationMark`, if present.
  public func withUnexpectedAfterQuestionOrExclamationMark(_ newChild: UnexpectedNodesSyntax?) -> UnresolvedAsExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 4, with: raw, arena: arena)
    return UnresolvedAsExprSyntax(newData)
  }

  public static var structure: SyntaxNodeStructure {
    return .layout([
      \Self.unexpectedBeforeAsTok,
      \Self.asTok,
      \Self.unexpectedBetweenAsTokAndQuestionOrExclamationMark,
      \Self.questionOrExclamationMark,
      \Self.unexpectedAfterQuestionOrExclamationMark,
    ])
  }

  public func childNameForDiagnostics(_ index: SyntaxChildrenIndex) -> String? {
    switch index.data?.indexInParent {
    case 0:
      return nil
    case 1:
      return nil
    case 2:
      return nil
    case 3:
      return nil
    case 4:
      return nil
    default:
      fatalError("Invalid index")
    }
  }
}

extension UnresolvedAsExprSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeAsTok": unexpectedBeforeAsTok.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "asTok": Syntax(asTok).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenAsTokAndQuestionOrExclamationMark": unexpectedBetweenAsTokAndQuestionOrExclamationMark.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "questionOrExclamationMark": questionOrExclamationMark.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedAfterQuestionOrExclamationMark": unexpectedAfterQuestionOrExclamationMark.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - AsExprSyntax

public struct AsExprSyntax: ExprSyntaxProtocol, SyntaxHashable {
  public let _syntaxNode: Syntax

  public init?<S: SyntaxProtocol>(_ node: S) {
    guard node.raw.kind == .asExpr else { return nil }
    self._syntaxNode = node._syntaxNode
  }

  /// Creates a `AsExprSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .asExpr)
    self._syntaxNode = Syntax(data)
  }

  public init<E: ExprSyntaxProtocol, T: TypeSyntaxProtocol>(
    leadingTrivia: Trivia? = nil,
    _ unexpectedBeforeExpression: UnexpectedNodesSyntax? = nil,
    expression: E,
    _ unexpectedBetweenExpressionAndAsTok: UnexpectedNodesSyntax? = nil,
    asTok: TokenSyntax = .asKeyword(),
    _ unexpectedBetweenAsTokAndQuestionOrExclamationMark: UnexpectedNodesSyntax? = nil,
    questionOrExclamationMark: TokenSyntax? = nil,
    _ unexpectedBetweenQuestionOrExclamationMarkAndTypeName: UnexpectedNodesSyntax? = nil,
    typeName: T,
    _ unexpectedAfterTypeName: UnexpectedNodesSyntax? = nil,
    trailingTrivia: Trivia? = nil
  ) {
    let layout: [RawSyntax?] = [
      unexpectedBeforeExpression?.raw,
      expression.raw,
      unexpectedBetweenExpressionAndAsTok?.raw,
      asTok.raw,
      unexpectedBetweenAsTokAndQuestionOrExclamationMark?.raw,
      questionOrExclamationMark?.raw,
      unexpectedBetweenQuestionOrExclamationMarkAndTypeName?.raw,
      typeName.raw,
      unexpectedAfterTypeName?.raw,
    ]
    let data: SyntaxData = withExtendedLifetime(SyntaxArena()) { arena in
      let raw = RawSyntax.makeLayout(
        kind: SyntaxKind.asExpr, from: layout, arena: arena,
        leadingTrivia: leadingTrivia, trailingTrivia: trailingTrivia)
      return SyntaxData.forRoot(raw)
    }
    self.init(data)
  }

  public var unexpectedBeforeExpression: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: 0, parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBeforeExpression(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBeforeExpression` replaced.
  /// - param newChild: The new `unexpectedBeforeExpression` to replace the node's
  ///                   current `unexpectedBeforeExpression`, if present.
  public func withUnexpectedBeforeExpression(_ newChild: UnexpectedNodesSyntax?) -> AsExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 0, with: raw, arena: arena)
    return AsExprSyntax(newData)
  }

  public var expression: ExprSyntax {
    get {
      let childData = data.child(at: 1, parent: Syntax(self))
      return ExprSyntax(childData!)
    }
    set(value) {
      self = withExpression(value)
    }
  }

  /// Returns a copy of the receiver with its `expression` replaced.
  /// - param newChild: The new `expression` to replace the node's
  ///                   current `expression`, if present.
  public func withExpression(_ newChild: ExprSyntax?) -> AsExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw ?? RawSyntax.makeEmptyLayout(kind: SyntaxKind.missingExpr, arena: arena)
    let newData = data.replacingChild(at: 1, with: raw, arena: arena)
    return AsExprSyntax(newData)
  }

  public var unexpectedBetweenExpressionAndAsTok: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: 2, parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenExpressionAndAsTok(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenExpressionAndAsTok` replaced.
  /// - param newChild: The new `unexpectedBetweenExpressionAndAsTok` to replace the node's
  ///                   current `unexpectedBetweenExpressionAndAsTok`, if present.
  public func withUnexpectedBetweenExpressionAndAsTok(_ newChild: UnexpectedNodesSyntax?) -> AsExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 2, with: raw, arena: arena)
    return AsExprSyntax(newData)
  }

  public var asTok: TokenSyntax {
    get {
      let childData = data.child(at: 3, parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withAsTok(value)
    }
  }

  /// Returns a copy of the receiver with its `asTok` replaced.
  /// - param newChild: The new `asTok` to replace the node's
  ///                   current `asTok`, if present.
  public func withAsTok(_ newChild: TokenSyntax?) -> AsExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.asKeyword, arena: arena)
    let newData = data.replacingChild(at: 3, with: raw, arena: arena)
    return AsExprSyntax(newData)
  }

  public var unexpectedBetweenAsTokAndQuestionOrExclamationMark: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: 4, parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenAsTokAndQuestionOrExclamationMark(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenAsTokAndQuestionOrExclamationMark` replaced.
  /// - param newChild: The new `unexpectedBetweenAsTokAndQuestionOrExclamationMark` to replace the node's
  ///                   current `unexpectedBetweenAsTokAndQuestionOrExclamationMark`, if present.
  public func withUnexpectedBetweenAsTokAndQuestionOrExclamationMark(_ newChild: UnexpectedNodesSyntax?) -> AsExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 4, with: raw, arena: arena)
    return AsExprSyntax(newData)
  }

  public var questionOrExclamationMark: TokenSyntax? {
    get {
      let childData = data.child(at: 5, parent: Syntax(self))
      if childData == nil { return nil }
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withQuestionOrExclamationMark(value)
    }
  }

  /// Returns a copy of the receiver with its `questionOrExclamationMark` replaced.
  /// - param newChild: The new `questionOrExclamationMark` to replace the node's
  ///                   current `questionOrExclamationMark`, if present.
  public func withQuestionOrExclamationMark(_ newChild: TokenSyntax?) -> AsExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 5, with: raw, arena: arena)
    return AsExprSyntax(newData)
  }

  public var unexpectedBetweenQuestionOrExclamationMarkAndTypeName: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: 6, parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenQuestionOrExclamationMarkAndTypeName(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenQuestionOrExclamationMarkAndTypeName` replaced.
  /// - param newChild: The new `unexpectedBetweenQuestionOrExclamationMarkAndTypeName` to replace the node's
  ///                   current `unexpectedBetweenQuestionOrExclamationMarkAndTypeName`, if present.
  public func withUnexpectedBetweenQuestionOrExclamationMarkAndTypeName(_ newChild: UnexpectedNodesSyntax?) -> AsExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 6, with: raw, arena: arena)
    return AsExprSyntax(newData)
  }

  public var typeName: TypeSyntax {
    get {
      let childData = data.child(at: 7, parent: Syntax(self))
      return TypeSyntax(childData!)
    }
    set(value) {
      self = withTypeName(value)
    }
  }

  /// Returns a copy of the receiver with its `typeName` replaced.
  /// - param newChild: The new `typeName` to replace the node's
  ///                   current `typeName`, if present.
  public func withTypeName(_ newChild: TypeSyntax?) -> AsExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw ?? RawSyntax.makeEmptyLayout(kind: SyntaxKind.missingType, arena: arena)
    let newData = data.replacingChild(at: 7, with: raw, arena: arena)
    return AsExprSyntax(newData)
  }

  public var unexpectedAfterTypeName: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: 8, parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedAfterTypeName(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedAfterTypeName` replaced.
  /// - param newChild: The new `unexpectedAfterTypeName` to replace the node's
  ///                   current `unexpectedAfterTypeName`, if present.
  public func withUnexpectedAfterTypeName(_ newChild: UnexpectedNodesSyntax?) -> AsExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 8, with: raw, arena: arena)
    return AsExprSyntax(newData)
  }

  public static var structure: SyntaxNodeStructure {
    return .layout([
      \Self.unexpectedBeforeExpression,
      \Self.expression,
      \Self.unexpectedBetweenExpressionAndAsTok,
      \Self.asTok,
      \Self.unexpectedBetweenAsTokAndQuestionOrExclamationMark,
      \Self.questionOrExclamationMark,
      \Self.unexpectedBetweenQuestionOrExclamationMarkAndTypeName,
      \Self.typeName,
      \Self.unexpectedAfterTypeName,
    ])
  }

  public func childNameForDiagnostics(_ index: SyntaxChildrenIndex) -> String? {
    switch index.data?.indexInParent {
    case 0:
      return nil
    case 1:
      return nil
    case 2:
      return nil
    case 3:
      return nil
    case 4:
      return nil
    case 5:
      return nil
    case 6:
      return nil
    case 7:
      return nil
    case 8:
      return nil
    default:
      fatalError("Invalid index")
    }
  }
}

extension AsExprSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeExpression": unexpectedBeforeExpression.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "expression": Syntax(expression).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenExpressionAndAsTok": unexpectedBetweenExpressionAndAsTok.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "asTok": Syntax(asTok).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenAsTokAndQuestionOrExclamationMark": unexpectedBetweenAsTokAndQuestionOrExclamationMark.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "questionOrExclamationMark": questionOrExclamationMark.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenQuestionOrExclamationMarkAndTypeName": unexpectedBetweenQuestionOrExclamationMarkAndTypeName.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "typeName": Syntax(typeName).asProtocol(SyntaxProtocol.self),
      "unexpectedAfterTypeName": unexpectedAfterTypeName.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - TypeExprSyntax

public struct TypeExprSyntax: ExprSyntaxProtocol, SyntaxHashable {
  public let _syntaxNode: Syntax

  public init?<S: SyntaxProtocol>(_ node: S) {
    guard node.raw.kind == .typeExpr else { return nil }
    self._syntaxNode = node._syntaxNode
  }

  /// Creates a `TypeExprSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .typeExpr)
    self._syntaxNode = Syntax(data)
  }

  public init<T: TypeSyntaxProtocol>(
    leadingTrivia: Trivia? = nil,
    _ unexpectedBeforeType: UnexpectedNodesSyntax? = nil,
    type: T,
    _ unexpectedAfterType: UnexpectedNodesSyntax? = nil,
    trailingTrivia: Trivia? = nil
  ) {
    let layout: [RawSyntax?] = [
      unexpectedBeforeType?.raw,
      type.raw,
      unexpectedAfterType?.raw,
    ]
    let data: SyntaxData = withExtendedLifetime(SyntaxArena()) { arena in
      let raw = RawSyntax.makeLayout(
        kind: SyntaxKind.typeExpr, from: layout, arena: arena,
        leadingTrivia: leadingTrivia, trailingTrivia: trailingTrivia)
      return SyntaxData.forRoot(raw)
    }
    self.init(data)
  }

  public var unexpectedBeforeType: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: 0, parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBeforeType(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBeforeType` replaced.
  /// - param newChild: The new `unexpectedBeforeType` to replace the node's
  ///                   current `unexpectedBeforeType`, if present.
  public func withUnexpectedBeforeType(_ newChild: UnexpectedNodesSyntax?) -> TypeExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 0, with: raw, arena: arena)
    return TypeExprSyntax(newData)
  }

  public var type: TypeSyntax {
    get {
      let childData = data.child(at: 1, parent: Syntax(self))
      return TypeSyntax(childData!)
    }
    set(value) {
      self = withType(value)
    }
  }

  /// Returns a copy of the receiver with its `type` replaced.
  /// - param newChild: The new `type` to replace the node's
  ///                   current `type`, if present.
  public func withType(_ newChild: TypeSyntax?) -> TypeExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw ?? RawSyntax.makeEmptyLayout(kind: SyntaxKind.missingType, arena: arena)
    let newData = data.replacingChild(at: 1, with: raw, arena: arena)
    return TypeExprSyntax(newData)
  }

  public var unexpectedAfterType: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: 2, parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedAfterType(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedAfterType` replaced.
  /// - param newChild: The new `unexpectedAfterType` to replace the node's
  ///                   current `unexpectedAfterType`, if present.
  public func withUnexpectedAfterType(_ newChild: UnexpectedNodesSyntax?) -> TypeExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 2, with: raw, arena: arena)
    return TypeExprSyntax(newData)
  }

  public static var structure: SyntaxNodeStructure {
    return .layout([
      \Self.unexpectedBeforeType,
      \Self.type,
      \Self.unexpectedAfterType,
    ])
  }

  public func childNameForDiagnostics(_ index: SyntaxChildrenIndex) -> String? {
    switch index.data?.indexInParent {
    case 0:
      return nil
    case 1:
      return nil
    case 2:
      return nil
    default:
      fatalError("Invalid index")
    }
  }
}

extension TypeExprSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeType": unexpectedBeforeType.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "type": Syntax(type).asProtocol(SyntaxProtocol.self),
      "unexpectedAfterType": unexpectedAfterType.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - ClosureExprSyntax

public struct ClosureExprSyntax: ExprSyntaxProtocol, SyntaxHashable {
  public let _syntaxNode: Syntax

  public init?<S: SyntaxProtocol>(_ node: S) {
    guard node.raw.kind == .closureExpr else { return nil }
    self._syntaxNode = node._syntaxNode
  }

  /// Creates a `ClosureExprSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .closureExpr)
    self._syntaxNode = Syntax(data)
  }

  public init(
    leadingTrivia: Trivia? = nil,
    _ unexpectedBeforeLeftBrace: UnexpectedNodesSyntax? = nil,
    leftBrace: TokenSyntax = .leftBraceToken(),
    _ unexpectedBetweenLeftBraceAndSignature: UnexpectedNodesSyntax? = nil,
    signature: ClosureSignatureSyntax? = nil,
    _ unexpectedBetweenSignatureAndStatements: UnexpectedNodesSyntax? = nil,
    statements: CodeBlockItemListSyntax,
    _ unexpectedBetweenStatementsAndRightBrace: UnexpectedNodesSyntax? = nil,
    rightBrace: TokenSyntax = .rightBraceToken(),
    _ unexpectedAfterRightBrace: UnexpectedNodesSyntax? = nil,
    trailingTrivia: Trivia? = nil
  ) {
    let layout: [RawSyntax?] = [
      unexpectedBeforeLeftBrace?.raw,
      leftBrace.raw,
      unexpectedBetweenLeftBraceAndSignature?.raw,
      signature?.raw,
      unexpectedBetweenSignatureAndStatements?.raw,
      statements.raw,
      unexpectedBetweenStatementsAndRightBrace?.raw,
      rightBrace.raw,
      unexpectedAfterRightBrace?.raw,
    ]
    let data: SyntaxData = withExtendedLifetime(SyntaxArena()) { arena in
      let raw = RawSyntax.makeLayout(
        kind: SyntaxKind.closureExpr, from: layout, arena: arena,
        leadingTrivia: leadingTrivia, trailingTrivia: trailingTrivia)
      return SyntaxData.forRoot(raw)
    }
    self.init(data)
  }

  public var unexpectedBeforeLeftBrace: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: 0, parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBeforeLeftBrace(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBeforeLeftBrace` replaced.
  /// - param newChild: The new `unexpectedBeforeLeftBrace` to replace the node's
  ///                   current `unexpectedBeforeLeftBrace`, if present.
  public func withUnexpectedBeforeLeftBrace(_ newChild: UnexpectedNodesSyntax?) -> ClosureExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 0, with: raw, arena: arena)
    return ClosureExprSyntax(newData)
  }

  public var leftBrace: TokenSyntax {
    get {
      let childData = data.child(at: 1, parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withLeftBrace(value)
    }
  }

  /// Returns a copy of the receiver with its `leftBrace` replaced.
  /// - param newChild: The new `leftBrace` to replace the node's
  ///                   current `leftBrace`, if present.
  public func withLeftBrace(_ newChild: TokenSyntax?) -> ClosureExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.leftBrace, arena: arena)
    let newData = data.replacingChild(at: 1, with: raw, arena: arena)
    return ClosureExprSyntax(newData)
  }

  public var unexpectedBetweenLeftBraceAndSignature: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: 2, parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenLeftBraceAndSignature(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenLeftBraceAndSignature` replaced.
  /// - param newChild: The new `unexpectedBetweenLeftBraceAndSignature` to replace the node's
  ///                   current `unexpectedBetweenLeftBraceAndSignature`, if present.
  public func withUnexpectedBetweenLeftBraceAndSignature(_ newChild: UnexpectedNodesSyntax?) -> ClosureExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 2, with: raw, arena: arena)
    return ClosureExprSyntax(newData)
  }

  public var signature: ClosureSignatureSyntax? {
    get {
      let childData = data.child(at: 3, parent: Syntax(self))
      if childData == nil { return nil }
      return ClosureSignatureSyntax(childData!)
    }
    set(value) {
      self = withSignature(value)
    }
  }

  /// Returns a copy of the receiver with its `signature` replaced.
  /// - param newChild: The new `signature` to replace the node's
  ///                   current `signature`, if present.
  public func withSignature(_ newChild: ClosureSignatureSyntax?) -> ClosureExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 3, with: raw, arena: arena)
    return ClosureExprSyntax(newData)
  }

  public var unexpectedBetweenSignatureAndStatements: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: 4, parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenSignatureAndStatements(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenSignatureAndStatements` replaced.
  /// - param newChild: The new `unexpectedBetweenSignatureAndStatements` to replace the node's
  ///                   current `unexpectedBetweenSignatureAndStatements`, if present.
  public func withUnexpectedBetweenSignatureAndStatements(_ newChild: UnexpectedNodesSyntax?) -> ClosureExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 4, with: raw, arena: arena)
    return ClosureExprSyntax(newData)
  }

  public var statements: CodeBlockItemListSyntax {
    get {
      let childData = data.child(at: 5, parent: Syntax(self))
      return CodeBlockItemListSyntax(childData!)
    }
    set(value) {
      self = withStatements(value)
    }
  }

  /// Adds the provided `Statement` to the node's `statements`
  /// collection.
  /// - param element: The new `Statement` to add to the node's
  ///                  `statements` collection.
  /// - returns: A copy of the receiver with the provided `Statement`
  ///            appended to its `statements` collection.
  public func addStatement(_ element: CodeBlockItemSyntax) -> ClosureExprSyntax {
    var collection: RawSyntax
    let arena = SyntaxArena()
    if let col = raw.layoutView!.children[5] {
      collection = col.layoutView!.appending(element.raw, arena: arena)
    } else {
      collection = RawSyntax.makeLayout(kind: SyntaxKind.codeBlockItemList,
        from: [element.raw], arena: arena)
    }
    let newData = data.replacingChild(at: 5, with: collection, arena: arena)
    return ClosureExprSyntax(newData)
  }

  /// Returns a copy of the receiver with its `statements` replaced.
  /// - param newChild: The new `statements` to replace the node's
  ///                   current `statements`, if present.
  public func withStatements(_ newChild: CodeBlockItemListSyntax?) -> ClosureExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw ?? RawSyntax.makeEmptyLayout(kind: SyntaxKind.codeBlockItemList, arena: arena)
    let newData = data.replacingChild(at: 5, with: raw, arena: arena)
    return ClosureExprSyntax(newData)
  }

  public var unexpectedBetweenStatementsAndRightBrace: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: 6, parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenStatementsAndRightBrace(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenStatementsAndRightBrace` replaced.
  /// - param newChild: The new `unexpectedBetweenStatementsAndRightBrace` to replace the node's
  ///                   current `unexpectedBetweenStatementsAndRightBrace`, if present.
  public func withUnexpectedBetweenStatementsAndRightBrace(_ newChild: UnexpectedNodesSyntax?) -> ClosureExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 6, with: raw, arena: arena)
    return ClosureExprSyntax(newData)
  }

  public var rightBrace: TokenSyntax {
    get {
      let childData = data.child(at: 7, parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withRightBrace(value)
    }
  }

  /// Returns a copy of the receiver with its `rightBrace` replaced.
  /// - param newChild: The new `rightBrace` to replace the node's
  ///                   current `rightBrace`, if present.
  public func withRightBrace(_ newChild: TokenSyntax?) -> ClosureExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.rightBrace, arena: arena)
    let newData = data.replacingChild(at: 7, with: raw, arena: arena)
    return ClosureExprSyntax(newData)
  }

  public var unexpectedAfterRightBrace: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: 8, parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedAfterRightBrace(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedAfterRightBrace` replaced.
  /// - param newChild: The new `unexpectedAfterRightBrace` to replace the node's
  ///                   current `unexpectedAfterRightBrace`, if present.
  public func withUnexpectedAfterRightBrace(_ newChild: UnexpectedNodesSyntax?) -> ClosureExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 8, with: raw, arena: arena)
    return ClosureExprSyntax(newData)
  }

  public static var structure: SyntaxNodeStructure {
    return .layout([
      \Self.unexpectedBeforeLeftBrace,
      \Self.leftBrace,
      \Self.unexpectedBetweenLeftBraceAndSignature,
      \Self.signature,
      \Self.unexpectedBetweenSignatureAndStatements,
      \Self.statements,
      \Self.unexpectedBetweenStatementsAndRightBrace,
      \Self.rightBrace,
      \Self.unexpectedAfterRightBrace,
    ])
  }

  public func childNameForDiagnostics(_ index: SyntaxChildrenIndex) -> String? {
    switch index.data?.indexInParent {
    case 0:
      return nil
    case 1:
      return nil
    case 2:
      return nil
    case 3:
      return nil
    case 4:
      return nil
    case 5:
      return nil
    case 6:
      return nil
    case 7:
      return nil
    case 8:
      return nil
    default:
      fatalError("Invalid index")
    }
  }
}

extension ClosureExprSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeLeftBrace": unexpectedBeforeLeftBrace.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "leftBrace": Syntax(leftBrace).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenLeftBraceAndSignature": unexpectedBetweenLeftBraceAndSignature.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "signature": signature.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenSignatureAndStatements": unexpectedBetweenSignatureAndStatements.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "statements": Syntax(statements).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenStatementsAndRightBrace": unexpectedBetweenStatementsAndRightBrace.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "rightBrace": Syntax(rightBrace).asProtocol(SyntaxProtocol.self),
      "unexpectedAfterRightBrace": unexpectedAfterRightBrace.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - UnresolvedPatternExprSyntax

public struct UnresolvedPatternExprSyntax: ExprSyntaxProtocol, SyntaxHashable {
  public let _syntaxNode: Syntax

  public init?<S: SyntaxProtocol>(_ node: S) {
    guard node.raw.kind == .unresolvedPatternExpr else { return nil }
    self._syntaxNode = node._syntaxNode
  }

  /// Creates a `UnresolvedPatternExprSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .unresolvedPatternExpr)
    self._syntaxNode = Syntax(data)
  }

  public init<P: PatternSyntaxProtocol>(
    leadingTrivia: Trivia? = nil,
    _ unexpectedBeforePattern: UnexpectedNodesSyntax? = nil,
    pattern: P,
    _ unexpectedAfterPattern: UnexpectedNodesSyntax? = nil,
    trailingTrivia: Trivia? = nil
  ) {
    let layout: [RawSyntax?] = [
      unexpectedBeforePattern?.raw,
      pattern.raw,
      unexpectedAfterPattern?.raw,
    ]
    let data: SyntaxData = withExtendedLifetime(SyntaxArena()) { arena in
      let raw = RawSyntax.makeLayout(
        kind: SyntaxKind.unresolvedPatternExpr, from: layout, arena: arena,
        leadingTrivia: leadingTrivia, trailingTrivia: trailingTrivia)
      return SyntaxData.forRoot(raw)
    }
    self.init(data)
  }

  public var unexpectedBeforePattern: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: 0, parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBeforePattern(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBeforePattern` replaced.
  /// - param newChild: The new `unexpectedBeforePattern` to replace the node's
  ///                   current `unexpectedBeforePattern`, if present.
  public func withUnexpectedBeforePattern(_ newChild: UnexpectedNodesSyntax?) -> UnresolvedPatternExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 0, with: raw, arena: arena)
    return UnresolvedPatternExprSyntax(newData)
  }

  public var pattern: PatternSyntax {
    get {
      let childData = data.child(at: 1, parent: Syntax(self))
      return PatternSyntax(childData!)
    }
    set(value) {
      self = withPattern(value)
    }
  }

  /// Returns a copy of the receiver with its `pattern` replaced.
  /// - param newChild: The new `pattern` to replace the node's
  ///                   current `pattern`, if present.
  public func withPattern(_ newChild: PatternSyntax?) -> UnresolvedPatternExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw ?? RawSyntax.makeEmptyLayout(kind: SyntaxKind.missingPattern, arena: arena)
    let newData = data.replacingChild(at: 1, with: raw, arena: arena)
    return UnresolvedPatternExprSyntax(newData)
  }

  public var unexpectedAfterPattern: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: 2, parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedAfterPattern(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedAfterPattern` replaced.
  /// - param newChild: The new `unexpectedAfterPattern` to replace the node's
  ///                   current `unexpectedAfterPattern`, if present.
  public func withUnexpectedAfterPattern(_ newChild: UnexpectedNodesSyntax?) -> UnresolvedPatternExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 2, with: raw, arena: arena)
    return UnresolvedPatternExprSyntax(newData)
  }

  public static var structure: SyntaxNodeStructure {
    return .layout([
      \Self.unexpectedBeforePattern,
      \Self.pattern,
      \Self.unexpectedAfterPattern,
    ])
  }

  public func childNameForDiagnostics(_ index: SyntaxChildrenIndex) -> String? {
    switch index.data?.indexInParent {
    case 0:
      return nil
    case 1:
      return nil
    case 2:
      return nil
    default:
      fatalError("Invalid index")
    }
  }
}

extension UnresolvedPatternExprSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforePattern": unexpectedBeforePattern.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "pattern": Syntax(pattern).asProtocol(SyntaxProtocol.self),
      "unexpectedAfterPattern": unexpectedAfterPattern.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - FunctionCallExprSyntax

public struct FunctionCallExprSyntax: ExprSyntaxProtocol, SyntaxHashable {
  public let _syntaxNode: Syntax

  public init?<S: SyntaxProtocol>(_ node: S) {
    guard node.raw.kind == .functionCallExpr else { return nil }
    self._syntaxNode = node._syntaxNode
  }

  /// Creates a `FunctionCallExprSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .functionCallExpr)
    self._syntaxNode = Syntax(data)
  }

  public init<C: ExprSyntaxProtocol>(
    leadingTrivia: Trivia? = nil,
    _ unexpectedBeforeCalledExpression: UnexpectedNodesSyntax? = nil,
    calledExpression: C,
    _ unexpectedBetweenCalledExpressionAndLeftParen: UnexpectedNodesSyntax? = nil,
    leftParen: TokenSyntax? = nil,
    _ unexpectedBetweenLeftParenAndArgumentList: UnexpectedNodesSyntax? = nil,
    argumentList: TupleExprElementListSyntax,
    _ unexpectedBetweenArgumentListAndRightParen: UnexpectedNodesSyntax? = nil,
    rightParen: TokenSyntax? = nil,
    _ unexpectedBetweenRightParenAndTrailingClosure: UnexpectedNodesSyntax? = nil,
    trailingClosure: ClosureExprSyntax? = nil,
    _ unexpectedBetweenTrailingClosureAndAdditionalTrailingClosures: UnexpectedNodesSyntax? = nil,
    additionalTrailingClosures: MultipleTrailingClosureElementListSyntax? = nil,
    _ unexpectedAfterAdditionalTrailingClosures: UnexpectedNodesSyntax? = nil,
    trailingTrivia: Trivia? = nil
  ) {
    let layout: [RawSyntax?] = [
      unexpectedBeforeCalledExpression?.raw,
      calledExpression.raw,
      unexpectedBetweenCalledExpressionAndLeftParen?.raw,
      leftParen?.raw,
      unexpectedBetweenLeftParenAndArgumentList?.raw,
      argumentList.raw,
      unexpectedBetweenArgumentListAndRightParen?.raw,
      rightParen?.raw,
      unexpectedBetweenRightParenAndTrailingClosure?.raw,
      trailingClosure?.raw,
      unexpectedBetweenTrailingClosureAndAdditionalTrailingClosures?.raw,
      additionalTrailingClosures?.raw,
      unexpectedAfterAdditionalTrailingClosures?.raw,
    ]
    let data: SyntaxData = withExtendedLifetime(SyntaxArena()) { arena in
      let raw = RawSyntax.makeLayout(
        kind: SyntaxKind.functionCallExpr, from: layout, arena: arena,
        leadingTrivia: leadingTrivia, trailingTrivia: trailingTrivia)
      return SyntaxData.forRoot(raw)
    }
    self.init(data)
  }

  public var unexpectedBeforeCalledExpression: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: 0, parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBeforeCalledExpression(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBeforeCalledExpression` replaced.
  /// - param newChild: The new `unexpectedBeforeCalledExpression` to replace the node's
  ///                   current `unexpectedBeforeCalledExpression`, if present.
  public func withUnexpectedBeforeCalledExpression(_ newChild: UnexpectedNodesSyntax?) -> FunctionCallExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 0, with: raw, arena: arena)
    return FunctionCallExprSyntax(newData)
  }

  public var calledExpression: ExprSyntax {
    get {
      let childData = data.child(at: 1, parent: Syntax(self))
      return ExprSyntax(childData!)
    }
    set(value) {
      self = withCalledExpression(value)
    }
  }

  /// Returns a copy of the receiver with its `calledExpression` replaced.
  /// - param newChild: The new `calledExpression` to replace the node's
  ///                   current `calledExpression`, if present.
  public func withCalledExpression(_ newChild: ExprSyntax?) -> FunctionCallExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw ?? RawSyntax.makeEmptyLayout(kind: SyntaxKind.missingExpr, arena: arena)
    let newData = data.replacingChild(at: 1, with: raw, arena: arena)
    return FunctionCallExprSyntax(newData)
  }

  public var unexpectedBetweenCalledExpressionAndLeftParen: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: 2, parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenCalledExpressionAndLeftParen(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenCalledExpressionAndLeftParen` replaced.
  /// - param newChild: The new `unexpectedBetweenCalledExpressionAndLeftParen` to replace the node's
  ///                   current `unexpectedBetweenCalledExpressionAndLeftParen`, if present.
  public func withUnexpectedBetweenCalledExpressionAndLeftParen(_ newChild: UnexpectedNodesSyntax?) -> FunctionCallExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 2, with: raw, arena: arena)
    return FunctionCallExprSyntax(newData)
  }

  public var leftParen: TokenSyntax? {
    get {
      let childData = data.child(at: 3, parent: Syntax(self))
      if childData == nil { return nil }
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withLeftParen(value)
    }
  }

  /// Returns a copy of the receiver with its `leftParen` replaced.
  /// - param newChild: The new `leftParen` to replace the node's
  ///                   current `leftParen`, if present.
  public func withLeftParen(_ newChild: TokenSyntax?) -> FunctionCallExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 3, with: raw, arena: arena)
    return FunctionCallExprSyntax(newData)
  }

  public var unexpectedBetweenLeftParenAndArgumentList: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: 4, parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenLeftParenAndArgumentList(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenLeftParenAndArgumentList` replaced.
  /// - param newChild: The new `unexpectedBetweenLeftParenAndArgumentList` to replace the node's
  ///                   current `unexpectedBetweenLeftParenAndArgumentList`, if present.
  public func withUnexpectedBetweenLeftParenAndArgumentList(_ newChild: UnexpectedNodesSyntax?) -> FunctionCallExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 4, with: raw, arena: arena)
    return FunctionCallExprSyntax(newData)
  }

  public var argumentList: TupleExprElementListSyntax {
    get {
      let childData = data.child(at: 5, parent: Syntax(self))
      return TupleExprElementListSyntax(childData!)
    }
    set(value) {
      self = withArgumentList(value)
    }
  }

  /// Adds the provided `Argument` to the node's `argumentList`
  /// collection.
  /// - param element: The new `Argument` to add to the node's
  ///                  `argumentList` collection.
  /// - returns: A copy of the receiver with the provided `Argument`
  ///            appended to its `argumentList` collection.
  public func addArgument(_ element: TupleExprElementSyntax) -> FunctionCallExprSyntax {
    var collection: RawSyntax
    let arena = SyntaxArena()
    if let col = raw.layoutView!.children[5] {
      collection = col.layoutView!.appending(element.raw, arena: arena)
    } else {
      collection = RawSyntax.makeLayout(kind: SyntaxKind.tupleExprElementList,
        from: [element.raw], arena: arena)
    }
    let newData = data.replacingChild(at: 5, with: collection, arena: arena)
    return FunctionCallExprSyntax(newData)
  }

  /// Returns a copy of the receiver with its `argumentList` replaced.
  /// - param newChild: The new `argumentList` to replace the node's
  ///                   current `argumentList`, if present.
  public func withArgumentList(_ newChild: TupleExprElementListSyntax?) -> FunctionCallExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw ?? RawSyntax.makeEmptyLayout(kind: SyntaxKind.tupleExprElementList, arena: arena)
    let newData = data.replacingChild(at: 5, with: raw, arena: arena)
    return FunctionCallExprSyntax(newData)
  }

  public var unexpectedBetweenArgumentListAndRightParen: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: 6, parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenArgumentListAndRightParen(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenArgumentListAndRightParen` replaced.
  /// - param newChild: The new `unexpectedBetweenArgumentListAndRightParen` to replace the node's
  ///                   current `unexpectedBetweenArgumentListAndRightParen`, if present.
  public func withUnexpectedBetweenArgumentListAndRightParen(_ newChild: UnexpectedNodesSyntax?) -> FunctionCallExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 6, with: raw, arena: arena)
    return FunctionCallExprSyntax(newData)
  }

  public var rightParen: TokenSyntax? {
    get {
      let childData = data.child(at: 7, parent: Syntax(self))
      if childData == nil { return nil }
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withRightParen(value)
    }
  }

  /// Returns a copy of the receiver with its `rightParen` replaced.
  /// - param newChild: The new `rightParen` to replace the node's
  ///                   current `rightParen`, if present.
  public func withRightParen(_ newChild: TokenSyntax?) -> FunctionCallExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 7, with: raw, arena: arena)
    return FunctionCallExprSyntax(newData)
  }

  public var unexpectedBetweenRightParenAndTrailingClosure: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: 8, parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenRightParenAndTrailingClosure(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenRightParenAndTrailingClosure` replaced.
  /// - param newChild: The new `unexpectedBetweenRightParenAndTrailingClosure` to replace the node's
  ///                   current `unexpectedBetweenRightParenAndTrailingClosure`, if present.
  public func withUnexpectedBetweenRightParenAndTrailingClosure(_ newChild: UnexpectedNodesSyntax?) -> FunctionCallExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 8, with: raw, arena: arena)
    return FunctionCallExprSyntax(newData)
  }

  public var trailingClosure: ClosureExprSyntax? {
    get {
      let childData = data.child(at: 9, parent: Syntax(self))
      if childData == nil { return nil }
      return ClosureExprSyntax(childData!)
    }
    set(value) {
      self = withTrailingClosure(value)
    }
  }

  /// Returns a copy of the receiver with its `trailingClosure` replaced.
  /// - param newChild: The new `trailingClosure` to replace the node's
  ///                   current `trailingClosure`, if present.
  public func withTrailingClosure(_ newChild: ClosureExprSyntax?) -> FunctionCallExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 9, with: raw, arena: arena)
    return FunctionCallExprSyntax(newData)
  }

  public var unexpectedBetweenTrailingClosureAndAdditionalTrailingClosures: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: 10, parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenTrailingClosureAndAdditionalTrailingClosures(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenTrailingClosureAndAdditionalTrailingClosures` replaced.
  /// - param newChild: The new `unexpectedBetweenTrailingClosureAndAdditionalTrailingClosures` to replace the node's
  ///                   current `unexpectedBetweenTrailingClosureAndAdditionalTrailingClosures`, if present.
  public func withUnexpectedBetweenTrailingClosureAndAdditionalTrailingClosures(_ newChild: UnexpectedNodesSyntax?) -> FunctionCallExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 10, with: raw, arena: arena)
    return FunctionCallExprSyntax(newData)
  }

  public var additionalTrailingClosures: MultipleTrailingClosureElementListSyntax? {
    get {
      let childData = data.child(at: 11, parent: Syntax(self))
      if childData == nil { return nil }
      return MultipleTrailingClosureElementListSyntax(childData!)
    }
    set(value) {
      self = withAdditionalTrailingClosures(value)
    }
  }

  /// Adds the provided `AdditionalTrailingClosure` to the node's `additionalTrailingClosures`
  /// collection.
  /// - param element: The new `AdditionalTrailingClosure` to add to the node's
  ///                  `additionalTrailingClosures` collection.
  /// - returns: A copy of the receiver with the provided `AdditionalTrailingClosure`
  ///            appended to its `additionalTrailingClosures` collection.
  public func addAdditionalTrailingClosure(_ element: MultipleTrailingClosureElementSyntax) -> FunctionCallExprSyntax {
    var collection: RawSyntax
    let arena = SyntaxArena()
    if let col = raw.layoutView!.children[11] {
      collection = col.layoutView!.appending(element.raw, arena: arena)
    } else {
      collection = RawSyntax.makeLayout(kind: SyntaxKind.multipleTrailingClosureElementList,
        from: [element.raw], arena: arena)
    }
    let newData = data.replacingChild(at: 11, with: collection, arena: arena)
    return FunctionCallExprSyntax(newData)
  }

  /// Returns a copy of the receiver with its `additionalTrailingClosures` replaced.
  /// - param newChild: The new `additionalTrailingClosures` to replace the node's
  ///                   current `additionalTrailingClosures`, if present.
  public func withAdditionalTrailingClosures(_ newChild: MultipleTrailingClosureElementListSyntax?) -> FunctionCallExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 11, with: raw, arena: arena)
    return FunctionCallExprSyntax(newData)
  }

  public var unexpectedAfterAdditionalTrailingClosures: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: 12, parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedAfterAdditionalTrailingClosures(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedAfterAdditionalTrailingClosures` replaced.
  /// - param newChild: The new `unexpectedAfterAdditionalTrailingClosures` to replace the node's
  ///                   current `unexpectedAfterAdditionalTrailingClosures`, if present.
  public func withUnexpectedAfterAdditionalTrailingClosures(_ newChild: UnexpectedNodesSyntax?) -> FunctionCallExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 12, with: raw, arena: arena)
    return FunctionCallExprSyntax(newData)
  }

  public static var structure: SyntaxNodeStructure {
    return .layout([
      \Self.unexpectedBeforeCalledExpression,
      \Self.calledExpression,
      \Self.unexpectedBetweenCalledExpressionAndLeftParen,
      \Self.leftParen,
      \Self.unexpectedBetweenLeftParenAndArgumentList,
      \Self.argumentList,
      \Self.unexpectedBetweenArgumentListAndRightParen,
      \Self.rightParen,
      \Self.unexpectedBetweenRightParenAndTrailingClosure,
      \Self.trailingClosure,
      \Self.unexpectedBetweenTrailingClosureAndAdditionalTrailingClosures,
      \Self.additionalTrailingClosures,
      \Self.unexpectedAfterAdditionalTrailingClosures,
    ])
  }

  public func childNameForDiagnostics(_ index: SyntaxChildrenIndex) -> String? {
    switch index.data?.indexInParent {
    case 0:
      return nil
    case 1:
      return "called expression"
    case 2:
      return nil
    case 3:
      return nil
    case 4:
      return nil
    case 5:
      return "arguments"
    case 6:
      return nil
    case 7:
      return nil
    case 8:
      return nil
    case 9:
      return "trailing closure"
    case 10:
      return nil
    case 11:
      return "trailing closures"
    case 12:
      return nil
    default:
      fatalError("Invalid index")
    }
  }
}

extension FunctionCallExprSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeCalledExpression": unexpectedBeforeCalledExpression.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "calledExpression": Syntax(calledExpression).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenCalledExpressionAndLeftParen": unexpectedBetweenCalledExpressionAndLeftParen.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "leftParen": leftParen.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenLeftParenAndArgumentList": unexpectedBetweenLeftParenAndArgumentList.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "argumentList": Syntax(argumentList).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenArgumentListAndRightParen": unexpectedBetweenArgumentListAndRightParen.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "rightParen": rightParen.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenRightParenAndTrailingClosure": unexpectedBetweenRightParenAndTrailingClosure.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "trailingClosure": trailingClosure.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenTrailingClosureAndAdditionalTrailingClosures": unexpectedBetweenTrailingClosureAndAdditionalTrailingClosures.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "additionalTrailingClosures": additionalTrailingClosures.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedAfterAdditionalTrailingClosures": unexpectedAfterAdditionalTrailingClosures.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - SubscriptExprSyntax

public struct SubscriptExprSyntax: ExprSyntaxProtocol, SyntaxHashable {
  public let _syntaxNode: Syntax

  public init?<S: SyntaxProtocol>(_ node: S) {
    guard node.raw.kind == .subscriptExpr else { return nil }
    self._syntaxNode = node._syntaxNode
  }

  /// Creates a `SubscriptExprSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .subscriptExpr)
    self._syntaxNode = Syntax(data)
  }

  public init<C: ExprSyntaxProtocol>(
    leadingTrivia: Trivia? = nil,
    _ unexpectedBeforeCalledExpression: UnexpectedNodesSyntax? = nil,
    calledExpression: C,
    _ unexpectedBetweenCalledExpressionAndLeftBracket: UnexpectedNodesSyntax? = nil,
    leftBracket: TokenSyntax = .leftSquareBracketToken(),
    _ unexpectedBetweenLeftBracketAndArgumentList: UnexpectedNodesSyntax? = nil,
    argumentList: TupleExprElementListSyntax,
    _ unexpectedBetweenArgumentListAndRightBracket: UnexpectedNodesSyntax? = nil,
    rightBracket: TokenSyntax = .rightSquareBracketToken(),
    _ unexpectedBetweenRightBracketAndTrailingClosure: UnexpectedNodesSyntax? = nil,
    trailingClosure: ClosureExprSyntax? = nil,
    _ unexpectedBetweenTrailingClosureAndAdditionalTrailingClosures: UnexpectedNodesSyntax? = nil,
    additionalTrailingClosures: MultipleTrailingClosureElementListSyntax? = nil,
    _ unexpectedAfterAdditionalTrailingClosures: UnexpectedNodesSyntax? = nil,
    trailingTrivia: Trivia? = nil
  ) {
    let layout: [RawSyntax?] = [
      unexpectedBeforeCalledExpression?.raw,
      calledExpression.raw,
      unexpectedBetweenCalledExpressionAndLeftBracket?.raw,
      leftBracket.raw,
      unexpectedBetweenLeftBracketAndArgumentList?.raw,
      argumentList.raw,
      unexpectedBetweenArgumentListAndRightBracket?.raw,
      rightBracket.raw,
      unexpectedBetweenRightBracketAndTrailingClosure?.raw,
      trailingClosure?.raw,
      unexpectedBetweenTrailingClosureAndAdditionalTrailingClosures?.raw,
      additionalTrailingClosures?.raw,
      unexpectedAfterAdditionalTrailingClosures?.raw,
    ]
    let data: SyntaxData = withExtendedLifetime(SyntaxArena()) { arena in
      let raw = RawSyntax.makeLayout(
        kind: SyntaxKind.subscriptExpr, from: layout, arena: arena,
        leadingTrivia: leadingTrivia, trailingTrivia: trailingTrivia)
      return SyntaxData.forRoot(raw)
    }
    self.init(data)
  }

  public var unexpectedBeforeCalledExpression: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: 0, parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBeforeCalledExpression(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBeforeCalledExpression` replaced.
  /// - param newChild: The new `unexpectedBeforeCalledExpression` to replace the node's
  ///                   current `unexpectedBeforeCalledExpression`, if present.
  public func withUnexpectedBeforeCalledExpression(_ newChild: UnexpectedNodesSyntax?) -> SubscriptExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 0, with: raw, arena: arena)
    return SubscriptExprSyntax(newData)
  }

  public var calledExpression: ExprSyntax {
    get {
      let childData = data.child(at: 1, parent: Syntax(self))
      return ExprSyntax(childData!)
    }
    set(value) {
      self = withCalledExpression(value)
    }
  }

  /// Returns a copy of the receiver with its `calledExpression` replaced.
  /// - param newChild: The new `calledExpression` to replace the node's
  ///                   current `calledExpression`, if present.
  public func withCalledExpression(_ newChild: ExprSyntax?) -> SubscriptExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw ?? RawSyntax.makeEmptyLayout(kind: SyntaxKind.missingExpr, arena: arena)
    let newData = data.replacingChild(at: 1, with: raw, arena: arena)
    return SubscriptExprSyntax(newData)
  }

  public var unexpectedBetweenCalledExpressionAndLeftBracket: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: 2, parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenCalledExpressionAndLeftBracket(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenCalledExpressionAndLeftBracket` replaced.
  /// - param newChild: The new `unexpectedBetweenCalledExpressionAndLeftBracket` to replace the node's
  ///                   current `unexpectedBetweenCalledExpressionAndLeftBracket`, if present.
  public func withUnexpectedBetweenCalledExpressionAndLeftBracket(_ newChild: UnexpectedNodesSyntax?) -> SubscriptExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 2, with: raw, arena: arena)
    return SubscriptExprSyntax(newData)
  }

  public var leftBracket: TokenSyntax {
    get {
      let childData = data.child(at: 3, parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withLeftBracket(value)
    }
  }

  /// Returns a copy of the receiver with its `leftBracket` replaced.
  /// - param newChild: The new `leftBracket` to replace the node's
  ///                   current `leftBracket`, if present.
  public func withLeftBracket(_ newChild: TokenSyntax?) -> SubscriptExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.leftSquareBracket, arena: arena)
    let newData = data.replacingChild(at: 3, with: raw, arena: arena)
    return SubscriptExprSyntax(newData)
  }

  public var unexpectedBetweenLeftBracketAndArgumentList: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: 4, parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenLeftBracketAndArgumentList(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenLeftBracketAndArgumentList` replaced.
  /// - param newChild: The new `unexpectedBetweenLeftBracketAndArgumentList` to replace the node's
  ///                   current `unexpectedBetweenLeftBracketAndArgumentList`, if present.
  public func withUnexpectedBetweenLeftBracketAndArgumentList(_ newChild: UnexpectedNodesSyntax?) -> SubscriptExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 4, with: raw, arena: arena)
    return SubscriptExprSyntax(newData)
  }

  public var argumentList: TupleExprElementListSyntax {
    get {
      let childData = data.child(at: 5, parent: Syntax(self))
      return TupleExprElementListSyntax(childData!)
    }
    set(value) {
      self = withArgumentList(value)
    }
  }

  /// Adds the provided `Argument` to the node's `argumentList`
  /// collection.
  /// - param element: The new `Argument` to add to the node's
  ///                  `argumentList` collection.
  /// - returns: A copy of the receiver with the provided `Argument`
  ///            appended to its `argumentList` collection.
  public func addArgument(_ element: TupleExprElementSyntax) -> SubscriptExprSyntax {
    var collection: RawSyntax
    let arena = SyntaxArena()
    if let col = raw.layoutView!.children[5] {
      collection = col.layoutView!.appending(element.raw, arena: arena)
    } else {
      collection = RawSyntax.makeLayout(kind: SyntaxKind.tupleExprElementList,
        from: [element.raw], arena: arena)
    }
    let newData = data.replacingChild(at: 5, with: collection, arena: arena)
    return SubscriptExprSyntax(newData)
  }

  /// Returns a copy of the receiver with its `argumentList` replaced.
  /// - param newChild: The new `argumentList` to replace the node's
  ///                   current `argumentList`, if present.
  public func withArgumentList(_ newChild: TupleExprElementListSyntax?) -> SubscriptExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw ?? RawSyntax.makeEmptyLayout(kind: SyntaxKind.tupleExprElementList, arena: arena)
    let newData = data.replacingChild(at: 5, with: raw, arena: arena)
    return SubscriptExprSyntax(newData)
  }

  public var unexpectedBetweenArgumentListAndRightBracket: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: 6, parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenArgumentListAndRightBracket(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenArgumentListAndRightBracket` replaced.
  /// - param newChild: The new `unexpectedBetweenArgumentListAndRightBracket` to replace the node's
  ///                   current `unexpectedBetweenArgumentListAndRightBracket`, if present.
  public func withUnexpectedBetweenArgumentListAndRightBracket(_ newChild: UnexpectedNodesSyntax?) -> SubscriptExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 6, with: raw, arena: arena)
    return SubscriptExprSyntax(newData)
  }

  public var rightBracket: TokenSyntax {
    get {
      let childData = data.child(at: 7, parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withRightBracket(value)
    }
  }

  /// Returns a copy of the receiver with its `rightBracket` replaced.
  /// - param newChild: The new `rightBracket` to replace the node's
  ///                   current `rightBracket`, if present.
  public func withRightBracket(_ newChild: TokenSyntax?) -> SubscriptExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.rightSquareBracket, arena: arena)
    let newData = data.replacingChild(at: 7, with: raw, arena: arena)
    return SubscriptExprSyntax(newData)
  }

  public var unexpectedBetweenRightBracketAndTrailingClosure: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: 8, parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenRightBracketAndTrailingClosure(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenRightBracketAndTrailingClosure` replaced.
  /// - param newChild: The new `unexpectedBetweenRightBracketAndTrailingClosure` to replace the node's
  ///                   current `unexpectedBetweenRightBracketAndTrailingClosure`, if present.
  public func withUnexpectedBetweenRightBracketAndTrailingClosure(_ newChild: UnexpectedNodesSyntax?) -> SubscriptExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 8, with: raw, arena: arena)
    return SubscriptExprSyntax(newData)
  }

  public var trailingClosure: ClosureExprSyntax? {
    get {
      let childData = data.child(at: 9, parent: Syntax(self))
      if childData == nil { return nil }
      return ClosureExprSyntax(childData!)
    }
    set(value) {
      self = withTrailingClosure(value)
    }
  }

  /// Returns a copy of the receiver with its `trailingClosure` replaced.
  /// - param newChild: The new `trailingClosure` to replace the node's
  ///                   current `trailingClosure`, if present.
  public func withTrailingClosure(_ newChild: ClosureExprSyntax?) -> SubscriptExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 9, with: raw, arena: arena)
    return SubscriptExprSyntax(newData)
  }

  public var unexpectedBetweenTrailingClosureAndAdditionalTrailingClosures: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: 10, parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenTrailingClosureAndAdditionalTrailingClosures(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenTrailingClosureAndAdditionalTrailingClosures` replaced.
  /// - param newChild: The new `unexpectedBetweenTrailingClosureAndAdditionalTrailingClosures` to replace the node's
  ///                   current `unexpectedBetweenTrailingClosureAndAdditionalTrailingClosures`, if present.
  public func withUnexpectedBetweenTrailingClosureAndAdditionalTrailingClosures(_ newChild: UnexpectedNodesSyntax?) -> SubscriptExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 10, with: raw, arena: arena)
    return SubscriptExprSyntax(newData)
  }

  public var additionalTrailingClosures: MultipleTrailingClosureElementListSyntax? {
    get {
      let childData = data.child(at: 11, parent: Syntax(self))
      if childData == nil { return nil }
      return MultipleTrailingClosureElementListSyntax(childData!)
    }
    set(value) {
      self = withAdditionalTrailingClosures(value)
    }
  }

  /// Adds the provided `AdditionalTrailingClosure` to the node's `additionalTrailingClosures`
  /// collection.
  /// - param element: The new `AdditionalTrailingClosure` to add to the node's
  ///                  `additionalTrailingClosures` collection.
  /// - returns: A copy of the receiver with the provided `AdditionalTrailingClosure`
  ///            appended to its `additionalTrailingClosures` collection.
  public func addAdditionalTrailingClosure(_ element: MultipleTrailingClosureElementSyntax) -> SubscriptExprSyntax {
    var collection: RawSyntax
    let arena = SyntaxArena()
    if let col = raw.layoutView!.children[11] {
      collection = col.layoutView!.appending(element.raw, arena: arena)
    } else {
      collection = RawSyntax.makeLayout(kind: SyntaxKind.multipleTrailingClosureElementList,
        from: [element.raw], arena: arena)
    }
    let newData = data.replacingChild(at: 11, with: collection, arena: arena)
    return SubscriptExprSyntax(newData)
  }

  /// Returns a copy of the receiver with its `additionalTrailingClosures` replaced.
  /// - param newChild: The new `additionalTrailingClosures` to replace the node's
  ///                   current `additionalTrailingClosures`, if present.
  public func withAdditionalTrailingClosures(_ newChild: MultipleTrailingClosureElementListSyntax?) -> SubscriptExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 11, with: raw, arena: arena)
    return SubscriptExprSyntax(newData)
  }

  public var unexpectedAfterAdditionalTrailingClosures: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: 12, parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedAfterAdditionalTrailingClosures(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedAfterAdditionalTrailingClosures` replaced.
  /// - param newChild: The new `unexpectedAfterAdditionalTrailingClosures` to replace the node's
  ///                   current `unexpectedAfterAdditionalTrailingClosures`, if present.
  public func withUnexpectedAfterAdditionalTrailingClosures(_ newChild: UnexpectedNodesSyntax?) -> SubscriptExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 12, with: raw, arena: arena)
    return SubscriptExprSyntax(newData)
  }

  public static var structure: SyntaxNodeStructure {
    return .layout([
      \Self.unexpectedBeforeCalledExpression,
      \Self.calledExpression,
      \Self.unexpectedBetweenCalledExpressionAndLeftBracket,
      \Self.leftBracket,
      \Self.unexpectedBetweenLeftBracketAndArgumentList,
      \Self.argumentList,
      \Self.unexpectedBetweenArgumentListAndRightBracket,
      \Self.rightBracket,
      \Self.unexpectedBetweenRightBracketAndTrailingClosure,
      \Self.trailingClosure,
      \Self.unexpectedBetweenTrailingClosureAndAdditionalTrailingClosures,
      \Self.additionalTrailingClosures,
      \Self.unexpectedAfterAdditionalTrailingClosures,
    ])
  }

  public func childNameForDiagnostics(_ index: SyntaxChildrenIndex) -> String? {
    switch index.data?.indexInParent {
    case 0:
      return nil
    case 1:
      return "called expression"
    case 2:
      return nil
    case 3:
      return nil
    case 4:
      return nil
    case 5:
      return "arguments"
    case 6:
      return nil
    case 7:
      return nil
    case 8:
      return nil
    case 9:
      return "trailing closure"
    case 10:
      return nil
    case 11:
      return "trailing closures"
    case 12:
      return nil
    default:
      fatalError("Invalid index")
    }
  }
}

extension SubscriptExprSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeCalledExpression": unexpectedBeforeCalledExpression.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "calledExpression": Syntax(calledExpression).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenCalledExpressionAndLeftBracket": unexpectedBetweenCalledExpressionAndLeftBracket.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "leftBracket": Syntax(leftBracket).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenLeftBracketAndArgumentList": unexpectedBetweenLeftBracketAndArgumentList.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "argumentList": Syntax(argumentList).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenArgumentListAndRightBracket": unexpectedBetweenArgumentListAndRightBracket.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "rightBracket": Syntax(rightBracket).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenRightBracketAndTrailingClosure": unexpectedBetweenRightBracketAndTrailingClosure.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "trailingClosure": trailingClosure.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenTrailingClosureAndAdditionalTrailingClosures": unexpectedBetweenTrailingClosureAndAdditionalTrailingClosures.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "additionalTrailingClosures": additionalTrailingClosures.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedAfterAdditionalTrailingClosures": unexpectedAfterAdditionalTrailingClosures.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - OptionalChainingExprSyntax

public struct OptionalChainingExprSyntax: ExprSyntaxProtocol, SyntaxHashable {
  public let _syntaxNode: Syntax

  public init?<S: SyntaxProtocol>(_ node: S) {
    guard node.raw.kind == .optionalChainingExpr else { return nil }
    self._syntaxNode = node._syntaxNode
  }

  /// Creates a `OptionalChainingExprSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .optionalChainingExpr)
    self._syntaxNode = Syntax(data)
  }

  public init<E: ExprSyntaxProtocol>(
    leadingTrivia: Trivia? = nil,
    _ unexpectedBeforeExpression: UnexpectedNodesSyntax? = nil,
    expression: E,
    _ unexpectedBetweenExpressionAndQuestionMark: UnexpectedNodesSyntax? = nil,
    questionMark: TokenSyntax = .postfixQuestionMarkToken(),
    _ unexpectedAfterQuestionMark: UnexpectedNodesSyntax? = nil,
    trailingTrivia: Trivia? = nil
  ) {
    let layout: [RawSyntax?] = [
      unexpectedBeforeExpression?.raw,
      expression.raw,
      unexpectedBetweenExpressionAndQuestionMark?.raw,
      questionMark.raw,
      unexpectedAfterQuestionMark?.raw,
    ]
    let data: SyntaxData = withExtendedLifetime(SyntaxArena()) { arena in
      let raw = RawSyntax.makeLayout(
        kind: SyntaxKind.optionalChainingExpr, from: layout, arena: arena,
        leadingTrivia: leadingTrivia, trailingTrivia: trailingTrivia)
      return SyntaxData.forRoot(raw)
    }
    self.init(data)
  }

  public var unexpectedBeforeExpression: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: 0, parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBeforeExpression(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBeforeExpression` replaced.
  /// - param newChild: The new `unexpectedBeforeExpression` to replace the node's
  ///                   current `unexpectedBeforeExpression`, if present.
  public func withUnexpectedBeforeExpression(_ newChild: UnexpectedNodesSyntax?) -> OptionalChainingExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 0, with: raw, arena: arena)
    return OptionalChainingExprSyntax(newData)
  }

  public var expression: ExprSyntax {
    get {
      let childData = data.child(at: 1, parent: Syntax(self))
      return ExprSyntax(childData!)
    }
    set(value) {
      self = withExpression(value)
    }
  }

  /// Returns a copy of the receiver with its `expression` replaced.
  /// - param newChild: The new `expression` to replace the node's
  ///                   current `expression`, if present.
  public func withExpression(_ newChild: ExprSyntax?) -> OptionalChainingExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw ?? RawSyntax.makeEmptyLayout(kind: SyntaxKind.missingExpr, arena: arena)
    let newData = data.replacingChild(at: 1, with: raw, arena: arena)
    return OptionalChainingExprSyntax(newData)
  }

  public var unexpectedBetweenExpressionAndQuestionMark: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: 2, parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenExpressionAndQuestionMark(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenExpressionAndQuestionMark` replaced.
  /// - param newChild: The new `unexpectedBetweenExpressionAndQuestionMark` to replace the node's
  ///                   current `unexpectedBetweenExpressionAndQuestionMark`, if present.
  public func withUnexpectedBetweenExpressionAndQuestionMark(_ newChild: UnexpectedNodesSyntax?) -> OptionalChainingExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 2, with: raw, arena: arena)
    return OptionalChainingExprSyntax(newData)
  }

  public var questionMark: TokenSyntax {
    get {
      let childData = data.child(at: 3, parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withQuestionMark(value)
    }
  }

  /// Returns a copy of the receiver with its `questionMark` replaced.
  /// - param newChild: The new `questionMark` to replace the node's
  ///                   current `questionMark`, if present.
  public func withQuestionMark(_ newChild: TokenSyntax?) -> OptionalChainingExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.postfixQuestionMark, arena: arena)
    let newData = data.replacingChild(at: 3, with: raw, arena: arena)
    return OptionalChainingExprSyntax(newData)
  }

  public var unexpectedAfterQuestionMark: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: 4, parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedAfterQuestionMark(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedAfterQuestionMark` replaced.
  /// - param newChild: The new `unexpectedAfterQuestionMark` to replace the node's
  ///                   current `unexpectedAfterQuestionMark`, if present.
  public func withUnexpectedAfterQuestionMark(_ newChild: UnexpectedNodesSyntax?) -> OptionalChainingExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 4, with: raw, arena: arena)
    return OptionalChainingExprSyntax(newData)
  }

  public static var structure: SyntaxNodeStructure {
    return .layout([
      \Self.unexpectedBeforeExpression,
      \Self.expression,
      \Self.unexpectedBetweenExpressionAndQuestionMark,
      \Self.questionMark,
      \Self.unexpectedAfterQuestionMark,
    ])
  }

  public func childNameForDiagnostics(_ index: SyntaxChildrenIndex) -> String? {
    switch index.data?.indexInParent {
    case 0:
      return nil
    case 1:
      return nil
    case 2:
      return nil
    case 3:
      return nil
    case 4:
      return nil
    default:
      fatalError("Invalid index")
    }
  }
}

extension OptionalChainingExprSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeExpression": unexpectedBeforeExpression.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "expression": Syntax(expression).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenExpressionAndQuestionMark": unexpectedBetweenExpressionAndQuestionMark.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "questionMark": Syntax(questionMark).asProtocol(SyntaxProtocol.self),
      "unexpectedAfterQuestionMark": unexpectedAfterQuestionMark.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - ForcedValueExprSyntax

public struct ForcedValueExprSyntax: ExprSyntaxProtocol, SyntaxHashable {
  public let _syntaxNode: Syntax

  public init?<S: SyntaxProtocol>(_ node: S) {
    guard node.raw.kind == .forcedValueExpr else { return nil }
    self._syntaxNode = node._syntaxNode
  }

  /// Creates a `ForcedValueExprSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .forcedValueExpr)
    self._syntaxNode = Syntax(data)
  }

  public init<E: ExprSyntaxProtocol>(
    leadingTrivia: Trivia? = nil,
    _ unexpectedBeforeExpression: UnexpectedNodesSyntax? = nil,
    expression: E,
    _ unexpectedBetweenExpressionAndExclamationMark: UnexpectedNodesSyntax? = nil,
    exclamationMark: TokenSyntax = .exclamationMarkToken(),
    _ unexpectedAfterExclamationMark: UnexpectedNodesSyntax? = nil,
    trailingTrivia: Trivia? = nil
  ) {
    let layout: [RawSyntax?] = [
      unexpectedBeforeExpression?.raw,
      expression.raw,
      unexpectedBetweenExpressionAndExclamationMark?.raw,
      exclamationMark.raw,
      unexpectedAfterExclamationMark?.raw,
    ]
    let data: SyntaxData = withExtendedLifetime(SyntaxArena()) { arena in
      let raw = RawSyntax.makeLayout(
        kind: SyntaxKind.forcedValueExpr, from: layout, arena: arena,
        leadingTrivia: leadingTrivia, trailingTrivia: trailingTrivia)
      return SyntaxData.forRoot(raw)
    }
    self.init(data)
  }

  public var unexpectedBeforeExpression: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: 0, parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBeforeExpression(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBeforeExpression` replaced.
  /// - param newChild: The new `unexpectedBeforeExpression` to replace the node's
  ///                   current `unexpectedBeforeExpression`, if present.
  public func withUnexpectedBeforeExpression(_ newChild: UnexpectedNodesSyntax?) -> ForcedValueExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 0, with: raw, arena: arena)
    return ForcedValueExprSyntax(newData)
  }

  public var expression: ExprSyntax {
    get {
      let childData = data.child(at: 1, parent: Syntax(self))
      return ExprSyntax(childData!)
    }
    set(value) {
      self = withExpression(value)
    }
  }

  /// Returns a copy of the receiver with its `expression` replaced.
  /// - param newChild: The new `expression` to replace the node's
  ///                   current `expression`, if present.
  public func withExpression(_ newChild: ExprSyntax?) -> ForcedValueExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw ?? RawSyntax.makeEmptyLayout(kind: SyntaxKind.missingExpr, arena: arena)
    let newData = data.replacingChild(at: 1, with: raw, arena: arena)
    return ForcedValueExprSyntax(newData)
  }

  public var unexpectedBetweenExpressionAndExclamationMark: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: 2, parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenExpressionAndExclamationMark(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenExpressionAndExclamationMark` replaced.
  /// - param newChild: The new `unexpectedBetweenExpressionAndExclamationMark` to replace the node's
  ///                   current `unexpectedBetweenExpressionAndExclamationMark`, if present.
  public func withUnexpectedBetweenExpressionAndExclamationMark(_ newChild: UnexpectedNodesSyntax?) -> ForcedValueExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 2, with: raw, arena: arena)
    return ForcedValueExprSyntax(newData)
  }

  public var exclamationMark: TokenSyntax {
    get {
      let childData = data.child(at: 3, parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withExclamationMark(value)
    }
  }

  /// Returns a copy of the receiver with its `exclamationMark` replaced.
  /// - param newChild: The new `exclamationMark` to replace the node's
  ///                   current `exclamationMark`, if present.
  public func withExclamationMark(_ newChild: TokenSyntax?) -> ForcedValueExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.exclamationMark, arena: arena)
    let newData = data.replacingChild(at: 3, with: raw, arena: arena)
    return ForcedValueExprSyntax(newData)
  }

  public var unexpectedAfterExclamationMark: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: 4, parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedAfterExclamationMark(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedAfterExclamationMark` replaced.
  /// - param newChild: The new `unexpectedAfterExclamationMark` to replace the node's
  ///                   current `unexpectedAfterExclamationMark`, if present.
  public func withUnexpectedAfterExclamationMark(_ newChild: UnexpectedNodesSyntax?) -> ForcedValueExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 4, with: raw, arena: arena)
    return ForcedValueExprSyntax(newData)
  }

  public static var structure: SyntaxNodeStructure {
    return .layout([
      \Self.unexpectedBeforeExpression,
      \Self.expression,
      \Self.unexpectedBetweenExpressionAndExclamationMark,
      \Self.exclamationMark,
      \Self.unexpectedAfterExclamationMark,
    ])
  }

  public func childNameForDiagnostics(_ index: SyntaxChildrenIndex) -> String? {
    switch index.data?.indexInParent {
    case 0:
      return nil
    case 1:
      return nil
    case 2:
      return nil
    case 3:
      return nil
    case 4:
      return nil
    default:
      fatalError("Invalid index")
    }
  }
}

extension ForcedValueExprSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeExpression": unexpectedBeforeExpression.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "expression": Syntax(expression).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenExpressionAndExclamationMark": unexpectedBetweenExpressionAndExclamationMark.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "exclamationMark": Syntax(exclamationMark).asProtocol(SyntaxProtocol.self),
      "unexpectedAfterExclamationMark": unexpectedAfterExclamationMark.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - PostfixUnaryExprSyntax

public struct PostfixUnaryExprSyntax: ExprSyntaxProtocol, SyntaxHashable {
  public let _syntaxNode: Syntax

  public init?<S: SyntaxProtocol>(_ node: S) {
    guard node.raw.kind == .postfixUnaryExpr else { return nil }
    self._syntaxNode = node._syntaxNode
  }

  /// Creates a `PostfixUnaryExprSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .postfixUnaryExpr)
    self._syntaxNode = Syntax(data)
  }

  public init<E: ExprSyntaxProtocol>(
    leadingTrivia: Trivia? = nil,
    _ unexpectedBeforeExpression: UnexpectedNodesSyntax? = nil,
    expression: E,
    _ unexpectedBetweenExpressionAndOperatorToken: UnexpectedNodesSyntax? = nil,
    operatorToken: TokenSyntax,
    _ unexpectedAfterOperatorToken: UnexpectedNodesSyntax? = nil,
    trailingTrivia: Trivia? = nil
  ) {
    let layout: [RawSyntax?] = [
      unexpectedBeforeExpression?.raw,
      expression.raw,
      unexpectedBetweenExpressionAndOperatorToken?.raw,
      operatorToken.raw,
      unexpectedAfterOperatorToken?.raw,
    ]
    let data: SyntaxData = withExtendedLifetime(SyntaxArena()) { arena in
      let raw = RawSyntax.makeLayout(
        kind: SyntaxKind.postfixUnaryExpr, from: layout, arena: arena,
        leadingTrivia: leadingTrivia, trailingTrivia: trailingTrivia)
      return SyntaxData.forRoot(raw)
    }
    self.init(data)
  }

  public var unexpectedBeforeExpression: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: 0, parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBeforeExpression(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBeforeExpression` replaced.
  /// - param newChild: The new `unexpectedBeforeExpression` to replace the node's
  ///                   current `unexpectedBeforeExpression`, if present.
  public func withUnexpectedBeforeExpression(_ newChild: UnexpectedNodesSyntax?) -> PostfixUnaryExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 0, with: raw, arena: arena)
    return PostfixUnaryExprSyntax(newData)
  }

  public var expression: ExprSyntax {
    get {
      let childData = data.child(at: 1, parent: Syntax(self))
      return ExprSyntax(childData!)
    }
    set(value) {
      self = withExpression(value)
    }
  }

  /// Returns a copy of the receiver with its `expression` replaced.
  /// - param newChild: The new `expression` to replace the node's
  ///                   current `expression`, if present.
  public func withExpression(_ newChild: ExprSyntax?) -> PostfixUnaryExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw ?? RawSyntax.makeEmptyLayout(kind: SyntaxKind.missingExpr, arena: arena)
    let newData = data.replacingChild(at: 1, with: raw, arena: arena)
    return PostfixUnaryExprSyntax(newData)
  }

  public var unexpectedBetweenExpressionAndOperatorToken: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: 2, parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenExpressionAndOperatorToken(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenExpressionAndOperatorToken` replaced.
  /// - param newChild: The new `unexpectedBetweenExpressionAndOperatorToken` to replace the node's
  ///                   current `unexpectedBetweenExpressionAndOperatorToken`, if present.
  public func withUnexpectedBetweenExpressionAndOperatorToken(_ newChild: UnexpectedNodesSyntax?) -> PostfixUnaryExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 2, with: raw, arena: arena)
    return PostfixUnaryExprSyntax(newData)
  }

  public var operatorToken: TokenSyntax {
    get {
      let childData = data.child(at: 3, parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withOperatorToken(value)
    }
  }

  /// Returns a copy of the receiver with its `operatorToken` replaced.
  /// - param newChild: The new `operatorToken` to replace the node's
  ///                   current `operatorToken`, if present.
  public func withOperatorToken(_ newChild: TokenSyntax?) -> PostfixUnaryExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.postfixOperator(""), arena: arena)
    let newData = data.replacingChild(at: 3, with: raw, arena: arena)
    return PostfixUnaryExprSyntax(newData)
  }

  public var unexpectedAfterOperatorToken: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: 4, parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedAfterOperatorToken(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedAfterOperatorToken` replaced.
  /// - param newChild: The new `unexpectedAfterOperatorToken` to replace the node's
  ///                   current `unexpectedAfterOperatorToken`, if present.
  public func withUnexpectedAfterOperatorToken(_ newChild: UnexpectedNodesSyntax?) -> PostfixUnaryExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 4, with: raw, arena: arena)
    return PostfixUnaryExprSyntax(newData)
  }

  public static var structure: SyntaxNodeStructure {
    return .layout([
      \Self.unexpectedBeforeExpression,
      \Self.expression,
      \Self.unexpectedBetweenExpressionAndOperatorToken,
      \Self.operatorToken,
      \Self.unexpectedAfterOperatorToken,
    ])
  }

  public func childNameForDiagnostics(_ index: SyntaxChildrenIndex) -> String? {
    switch index.data?.indexInParent {
    case 0:
      return nil
    case 1:
      return nil
    case 2:
      return nil
    case 3:
      return nil
    case 4:
      return nil
    default:
      fatalError("Invalid index")
    }
  }
}

extension PostfixUnaryExprSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeExpression": unexpectedBeforeExpression.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "expression": Syntax(expression).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenExpressionAndOperatorToken": unexpectedBetweenExpressionAndOperatorToken.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "operatorToken": Syntax(operatorToken).asProtocol(SyntaxProtocol.self),
      "unexpectedAfterOperatorToken": unexpectedAfterOperatorToken.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - SpecializeExprSyntax

public struct SpecializeExprSyntax: ExprSyntaxProtocol, SyntaxHashable {
  public let _syntaxNode: Syntax

  public init?<S: SyntaxProtocol>(_ node: S) {
    guard node.raw.kind == .specializeExpr else { return nil }
    self._syntaxNode = node._syntaxNode
  }

  /// Creates a `SpecializeExprSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .specializeExpr)
    self._syntaxNode = Syntax(data)
  }

  public init<E: ExprSyntaxProtocol>(
    leadingTrivia: Trivia? = nil,
    _ unexpectedBeforeExpression: UnexpectedNodesSyntax? = nil,
    expression: E,
    _ unexpectedBetweenExpressionAndGenericArgumentClause: UnexpectedNodesSyntax? = nil,
    genericArgumentClause: GenericArgumentClauseSyntax,
    _ unexpectedAfterGenericArgumentClause: UnexpectedNodesSyntax? = nil,
    trailingTrivia: Trivia? = nil
  ) {
    let layout: [RawSyntax?] = [
      unexpectedBeforeExpression?.raw,
      expression.raw,
      unexpectedBetweenExpressionAndGenericArgumentClause?.raw,
      genericArgumentClause.raw,
      unexpectedAfterGenericArgumentClause?.raw,
    ]
    let data: SyntaxData = withExtendedLifetime(SyntaxArena()) { arena in
      let raw = RawSyntax.makeLayout(
        kind: SyntaxKind.specializeExpr, from: layout, arena: arena,
        leadingTrivia: leadingTrivia, trailingTrivia: trailingTrivia)
      return SyntaxData.forRoot(raw)
    }
    self.init(data)
  }

  public var unexpectedBeforeExpression: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: 0, parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBeforeExpression(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBeforeExpression` replaced.
  /// - param newChild: The new `unexpectedBeforeExpression` to replace the node's
  ///                   current `unexpectedBeforeExpression`, if present.
  public func withUnexpectedBeforeExpression(_ newChild: UnexpectedNodesSyntax?) -> SpecializeExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 0, with: raw, arena: arena)
    return SpecializeExprSyntax(newData)
  }

  public var expression: ExprSyntax {
    get {
      let childData = data.child(at: 1, parent: Syntax(self))
      return ExprSyntax(childData!)
    }
    set(value) {
      self = withExpression(value)
    }
  }

  /// Returns a copy of the receiver with its `expression` replaced.
  /// - param newChild: The new `expression` to replace the node's
  ///                   current `expression`, if present.
  public func withExpression(_ newChild: ExprSyntax?) -> SpecializeExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw ?? RawSyntax.makeEmptyLayout(kind: SyntaxKind.missingExpr, arena: arena)
    let newData = data.replacingChild(at: 1, with: raw, arena: arena)
    return SpecializeExprSyntax(newData)
  }

  public var unexpectedBetweenExpressionAndGenericArgumentClause: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: 2, parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenExpressionAndGenericArgumentClause(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenExpressionAndGenericArgumentClause` replaced.
  /// - param newChild: The new `unexpectedBetweenExpressionAndGenericArgumentClause` to replace the node's
  ///                   current `unexpectedBetweenExpressionAndGenericArgumentClause`, if present.
  public func withUnexpectedBetweenExpressionAndGenericArgumentClause(_ newChild: UnexpectedNodesSyntax?) -> SpecializeExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 2, with: raw, arena: arena)
    return SpecializeExprSyntax(newData)
  }

  public var genericArgumentClause: GenericArgumentClauseSyntax {
    get {
      let childData = data.child(at: 3, parent: Syntax(self))
      return GenericArgumentClauseSyntax(childData!)
    }
    set(value) {
      self = withGenericArgumentClause(value)
    }
  }

  /// Returns a copy of the receiver with its `genericArgumentClause` replaced.
  /// - param newChild: The new `genericArgumentClause` to replace the node's
  ///                   current `genericArgumentClause`, if present.
  public func withGenericArgumentClause(_ newChild: GenericArgumentClauseSyntax?) -> SpecializeExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw ?? RawSyntax.makeEmptyLayout(kind: SyntaxKind.genericArgumentClause, arena: arena)
    let newData = data.replacingChild(at: 3, with: raw, arena: arena)
    return SpecializeExprSyntax(newData)
  }

  public var unexpectedAfterGenericArgumentClause: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: 4, parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedAfterGenericArgumentClause(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedAfterGenericArgumentClause` replaced.
  /// - param newChild: The new `unexpectedAfterGenericArgumentClause` to replace the node's
  ///                   current `unexpectedAfterGenericArgumentClause`, if present.
  public func withUnexpectedAfterGenericArgumentClause(_ newChild: UnexpectedNodesSyntax?) -> SpecializeExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 4, with: raw, arena: arena)
    return SpecializeExprSyntax(newData)
  }

  public static var structure: SyntaxNodeStructure {
    return .layout([
      \Self.unexpectedBeforeExpression,
      \Self.expression,
      \Self.unexpectedBetweenExpressionAndGenericArgumentClause,
      \Self.genericArgumentClause,
      \Self.unexpectedAfterGenericArgumentClause,
    ])
  }

  public func childNameForDiagnostics(_ index: SyntaxChildrenIndex) -> String? {
    switch index.data?.indexInParent {
    case 0:
      return nil
    case 1:
      return nil
    case 2:
      return nil
    case 3:
      return nil
    case 4:
      return nil
    default:
      fatalError("Invalid index")
    }
  }
}

extension SpecializeExprSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeExpression": unexpectedBeforeExpression.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "expression": Syntax(expression).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenExpressionAndGenericArgumentClause": unexpectedBetweenExpressionAndGenericArgumentClause.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "genericArgumentClause": Syntax(genericArgumentClause).asProtocol(SyntaxProtocol.self),
      "unexpectedAfterGenericArgumentClause": unexpectedAfterGenericArgumentClause.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - StringLiteralExprSyntax

public struct StringLiteralExprSyntax: ExprSyntaxProtocol, SyntaxHashable {
  public let _syntaxNode: Syntax

  public init?<S: SyntaxProtocol>(_ node: S) {
    guard node.raw.kind == .stringLiteralExpr else { return nil }
    self._syntaxNode = node._syntaxNode
  }

  /// Creates a `StringLiteralExprSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .stringLiteralExpr)
    self._syntaxNode = Syntax(data)
  }

  public init(
    leadingTrivia: Trivia? = nil,
    _ unexpectedBeforeOpenDelimiter: UnexpectedNodesSyntax? = nil,
    openDelimiter: TokenSyntax? = nil,
    _ unexpectedBetweenOpenDelimiterAndOpenQuote: UnexpectedNodesSyntax? = nil,
    openQuote: TokenSyntax,
    _ unexpectedBetweenOpenQuoteAndSegments: UnexpectedNodesSyntax? = nil,
    segments: StringLiteralSegmentsSyntax,
    _ unexpectedBetweenSegmentsAndCloseQuote: UnexpectedNodesSyntax? = nil,
    closeQuote: TokenSyntax,
    _ unexpectedBetweenCloseQuoteAndCloseDelimiter: UnexpectedNodesSyntax? = nil,
    closeDelimiter: TokenSyntax? = nil,
    _ unexpectedAfterCloseDelimiter: UnexpectedNodesSyntax? = nil,
    trailingTrivia: Trivia? = nil
  ) {
    let layout: [RawSyntax?] = [
      unexpectedBeforeOpenDelimiter?.raw,
      openDelimiter?.raw,
      unexpectedBetweenOpenDelimiterAndOpenQuote?.raw,
      openQuote.raw,
      unexpectedBetweenOpenQuoteAndSegments?.raw,
      segments.raw,
      unexpectedBetweenSegmentsAndCloseQuote?.raw,
      closeQuote.raw,
      unexpectedBetweenCloseQuoteAndCloseDelimiter?.raw,
      closeDelimiter?.raw,
      unexpectedAfterCloseDelimiter?.raw,
    ]
    let data: SyntaxData = withExtendedLifetime(SyntaxArena()) { arena in
      let raw = RawSyntax.makeLayout(
        kind: SyntaxKind.stringLiteralExpr, from: layout, arena: arena,
        leadingTrivia: leadingTrivia, trailingTrivia: trailingTrivia)
      return SyntaxData.forRoot(raw)
    }
    self.init(data)
  }

  public var unexpectedBeforeOpenDelimiter: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: 0, parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBeforeOpenDelimiter(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBeforeOpenDelimiter` replaced.
  /// - param newChild: The new `unexpectedBeforeOpenDelimiter` to replace the node's
  ///                   current `unexpectedBeforeOpenDelimiter`, if present.
  public func withUnexpectedBeforeOpenDelimiter(_ newChild: UnexpectedNodesSyntax?) -> StringLiteralExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 0, with: raw, arena: arena)
    return StringLiteralExprSyntax(newData)
  }

  public var openDelimiter: TokenSyntax? {
    get {
      let childData = data.child(at: 1, parent: Syntax(self))
      if childData == nil { return nil }
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withOpenDelimiter(value)
    }
  }

  /// Returns a copy of the receiver with its `openDelimiter` replaced.
  /// - param newChild: The new `openDelimiter` to replace the node's
  ///                   current `openDelimiter`, if present.
  public func withOpenDelimiter(_ newChild: TokenSyntax?) -> StringLiteralExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 1, with: raw, arena: arena)
    return StringLiteralExprSyntax(newData)
  }

  public var unexpectedBetweenOpenDelimiterAndOpenQuote: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: 2, parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenOpenDelimiterAndOpenQuote(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenOpenDelimiterAndOpenQuote` replaced.
  /// - param newChild: The new `unexpectedBetweenOpenDelimiterAndOpenQuote` to replace the node's
  ///                   current `unexpectedBetweenOpenDelimiterAndOpenQuote`, if present.
  public func withUnexpectedBetweenOpenDelimiterAndOpenQuote(_ newChild: UnexpectedNodesSyntax?) -> StringLiteralExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 2, with: raw, arena: arena)
    return StringLiteralExprSyntax(newData)
  }

  public var openQuote: TokenSyntax {
    get {
      let childData = data.child(at: 3, parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withOpenQuote(value)
    }
  }

  /// Returns a copy of the receiver with its `openQuote` replaced.
  /// - param newChild: The new `openQuote` to replace the node's
  ///                   current `openQuote`, if present.
  public func withOpenQuote(_ newChild: TokenSyntax?) -> StringLiteralExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.stringQuote, arena: arena)
    let newData = data.replacingChild(at: 3, with: raw, arena: arena)
    return StringLiteralExprSyntax(newData)
  }

  public var unexpectedBetweenOpenQuoteAndSegments: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: 4, parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenOpenQuoteAndSegments(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenOpenQuoteAndSegments` replaced.
  /// - param newChild: The new `unexpectedBetweenOpenQuoteAndSegments` to replace the node's
  ///                   current `unexpectedBetweenOpenQuoteAndSegments`, if present.
  public func withUnexpectedBetweenOpenQuoteAndSegments(_ newChild: UnexpectedNodesSyntax?) -> StringLiteralExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 4, with: raw, arena: arena)
    return StringLiteralExprSyntax(newData)
  }

  public var segments: StringLiteralSegmentsSyntax {
    get {
      let childData = data.child(at: 5, parent: Syntax(self))
      return StringLiteralSegmentsSyntax(childData!)
    }
    set(value) {
      self = withSegments(value)
    }
  }

  /// Adds the provided `Segment` to the node's `segments`
  /// collection.
  /// - param element: The new `Segment` to add to the node's
  ///                  `segments` collection.
  /// - returns: A copy of the receiver with the provided `Segment`
  ///            appended to its `segments` collection.
  public func addSegment(_ element: Syntax) -> StringLiteralExprSyntax {
    var collection: RawSyntax
    let arena = SyntaxArena()
    if let col = raw.layoutView!.children[5] {
      collection = col.layoutView!.appending(element.raw, arena: arena)
    } else {
      collection = RawSyntax.makeLayout(kind: SyntaxKind.stringLiteralSegments,
        from: [element.raw], arena: arena)
    }
    let newData = data.replacingChild(at: 5, with: collection, arena: arena)
    return StringLiteralExprSyntax(newData)
  }

  /// Returns a copy of the receiver with its `segments` replaced.
  /// - param newChild: The new `segments` to replace the node's
  ///                   current `segments`, if present.
  public func withSegments(_ newChild: StringLiteralSegmentsSyntax?) -> StringLiteralExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw ?? RawSyntax.makeEmptyLayout(kind: SyntaxKind.stringLiteralSegments, arena: arena)
    let newData = data.replacingChild(at: 5, with: raw, arena: arena)
    return StringLiteralExprSyntax(newData)
  }

  public var unexpectedBetweenSegmentsAndCloseQuote: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: 6, parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenSegmentsAndCloseQuote(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenSegmentsAndCloseQuote` replaced.
  /// - param newChild: The new `unexpectedBetweenSegmentsAndCloseQuote` to replace the node's
  ///                   current `unexpectedBetweenSegmentsAndCloseQuote`, if present.
  public func withUnexpectedBetweenSegmentsAndCloseQuote(_ newChild: UnexpectedNodesSyntax?) -> StringLiteralExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 6, with: raw, arena: arena)
    return StringLiteralExprSyntax(newData)
  }

  public var closeQuote: TokenSyntax {
    get {
      let childData = data.child(at: 7, parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withCloseQuote(value)
    }
  }

  /// Returns a copy of the receiver with its `closeQuote` replaced.
  /// - param newChild: The new `closeQuote` to replace the node's
  ///                   current `closeQuote`, if present.
  public func withCloseQuote(_ newChild: TokenSyntax?) -> StringLiteralExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.stringQuote, arena: arena)
    let newData = data.replacingChild(at: 7, with: raw, arena: arena)
    return StringLiteralExprSyntax(newData)
  }

  public var unexpectedBetweenCloseQuoteAndCloseDelimiter: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: 8, parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenCloseQuoteAndCloseDelimiter(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenCloseQuoteAndCloseDelimiter` replaced.
  /// - param newChild: The new `unexpectedBetweenCloseQuoteAndCloseDelimiter` to replace the node's
  ///                   current `unexpectedBetweenCloseQuoteAndCloseDelimiter`, if present.
  public func withUnexpectedBetweenCloseQuoteAndCloseDelimiter(_ newChild: UnexpectedNodesSyntax?) -> StringLiteralExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 8, with: raw, arena: arena)
    return StringLiteralExprSyntax(newData)
  }

  public var closeDelimiter: TokenSyntax? {
    get {
      let childData = data.child(at: 9, parent: Syntax(self))
      if childData == nil { return nil }
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withCloseDelimiter(value)
    }
  }

  /// Returns a copy of the receiver with its `closeDelimiter` replaced.
  /// - param newChild: The new `closeDelimiter` to replace the node's
  ///                   current `closeDelimiter`, if present.
  public func withCloseDelimiter(_ newChild: TokenSyntax?) -> StringLiteralExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 9, with: raw, arena: arena)
    return StringLiteralExprSyntax(newData)
  }

  public var unexpectedAfterCloseDelimiter: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: 10, parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedAfterCloseDelimiter(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedAfterCloseDelimiter` replaced.
  /// - param newChild: The new `unexpectedAfterCloseDelimiter` to replace the node's
  ///                   current `unexpectedAfterCloseDelimiter`, if present.
  public func withUnexpectedAfterCloseDelimiter(_ newChild: UnexpectedNodesSyntax?) -> StringLiteralExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 10, with: raw, arena: arena)
    return StringLiteralExprSyntax(newData)
  }

  public static var structure: SyntaxNodeStructure {
    return .layout([
      \Self.unexpectedBeforeOpenDelimiter,
      \Self.openDelimiter,
      \Self.unexpectedBetweenOpenDelimiterAndOpenQuote,
      \Self.openQuote,
      \Self.unexpectedBetweenOpenQuoteAndSegments,
      \Self.segments,
      \Self.unexpectedBetweenSegmentsAndCloseQuote,
      \Self.closeQuote,
      \Self.unexpectedBetweenCloseQuoteAndCloseDelimiter,
      \Self.closeDelimiter,
      \Self.unexpectedAfterCloseDelimiter,
    ])
  }

  public func childNameForDiagnostics(_ index: SyntaxChildrenIndex) -> String? {
    switch index.data?.indexInParent {
    case 0:
      return nil
    case 1:
      return nil
    case 2:
      return nil
    case 3:
      return nil
    case 4:
      return nil
    case 5:
      return nil
    case 6:
      return nil
    case 7:
      return nil
    case 8:
      return nil
    case 9:
      return nil
    case 10:
      return nil
    default:
      fatalError("Invalid index")
    }
  }
}

extension StringLiteralExprSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeOpenDelimiter": unexpectedBeforeOpenDelimiter.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "openDelimiter": openDelimiter.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenOpenDelimiterAndOpenQuote": unexpectedBetweenOpenDelimiterAndOpenQuote.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "openQuote": Syntax(openQuote).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenOpenQuoteAndSegments": unexpectedBetweenOpenQuoteAndSegments.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "segments": Syntax(segments).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenSegmentsAndCloseQuote": unexpectedBetweenSegmentsAndCloseQuote.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "closeQuote": Syntax(closeQuote).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenCloseQuoteAndCloseDelimiter": unexpectedBetweenCloseQuoteAndCloseDelimiter.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "closeDelimiter": closeDelimiter.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedAfterCloseDelimiter": unexpectedAfterCloseDelimiter.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - RegexLiteralExprSyntax

public struct RegexLiteralExprSyntax: ExprSyntaxProtocol, SyntaxHashable {
  public let _syntaxNode: Syntax

  public init?<S: SyntaxProtocol>(_ node: S) {
    guard node.raw.kind == .regexLiteralExpr else { return nil }
    self._syntaxNode = node._syntaxNode
  }

  /// Creates a `RegexLiteralExprSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .regexLiteralExpr)
    self._syntaxNode = Syntax(data)
  }

  public init(
    leadingTrivia: Trivia? = nil,
    _ unexpectedBeforeRegex: UnexpectedNodesSyntax? = nil,
    regex: TokenSyntax,
    _ unexpectedAfterRegex: UnexpectedNodesSyntax? = nil,
    trailingTrivia: Trivia? = nil
  ) {
    let layout: [RawSyntax?] = [
      unexpectedBeforeRegex?.raw,
      regex.raw,
      unexpectedAfterRegex?.raw,
    ]
    let data: SyntaxData = withExtendedLifetime(SyntaxArena()) { arena in
      let raw = RawSyntax.makeLayout(
        kind: SyntaxKind.regexLiteralExpr, from: layout, arena: arena,
        leadingTrivia: leadingTrivia, trailingTrivia: trailingTrivia)
      return SyntaxData.forRoot(raw)
    }
    self.init(data)
  }

  public var unexpectedBeforeRegex: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: 0, parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBeforeRegex(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBeforeRegex` replaced.
  /// - param newChild: The new `unexpectedBeforeRegex` to replace the node's
  ///                   current `unexpectedBeforeRegex`, if present.
  public func withUnexpectedBeforeRegex(_ newChild: UnexpectedNodesSyntax?) -> RegexLiteralExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 0, with: raw, arena: arena)
    return RegexLiteralExprSyntax(newData)
  }

  public var regex: TokenSyntax {
    get {
      let childData = data.child(at: 1, parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withRegex(value)
    }
  }

  /// Returns a copy of the receiver with its `regex` replaced.
  /// - param newChild: The new `regex` to replace the node's
  ///                   current `regex`, if present.
  public func withRegex(_ newChild: TokenSyntax?) -> RegexLiteralExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.regexLiteral(""), arena: arena)
    let newData = data.replacingChild(at: 1, with: raw, arena: arena)
    return RegexLiteralExprSyntax(newData)
  }

  public var unexpectedAfterRegex: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: 2, parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedAfterRegex(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedAfterRegex` replaced.
  /// - param newChild: The new `unexpectedAfterRegex` to replace the node's
  ///                   current `unexpectedAfterRegex`, if present.
  public func withUnexpectedAfterRegex(_ newChild: UnexpectedNodesSyntax?) -> RegexLiteralExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 2, with: raw, arena: arena)
    return RegexLiteralExprSyntax(newData)
  }

  public static var structure: SyntaxNodeStructure {
    return .layout([
      \Self.unexpectedBeforeRegex,
      \Self.regex,
      \Self.unexpectedAfterRegex,
    ])
  }

  public func childNameForDiagnostics(_ index: SyntaxChildrenIndex) -> String? {
    switch index.data?.indexInParent {
    case 0:
      return nil
    case 1:
      return nil
    case 2:
      return nil
    default:
      fatalError("Invalid index")
    }
  }
}

extension RegexLiteralExprSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeRegex": unexpectedBeforeRegex.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "regex": Syntax(regex).asProtocol(SyntaxProtocol.self),
      "unexpectedAfterRegex": unexpectedAfterRegex.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - KeyPathExprSyntax

public struct KeyPathExprSyntax: ExprSyntaxProtocol, SyntaxHashable {
  public let _syntaxNode: Syntax

  public init?<S: SyntaxProtocol>(_ node: S) {
    guard node.raw.kind == .keyPathExpr else { return nil }
    self._syntaxNode = node._syntaxNode
  }

  /// Creates a `KeyPathExprSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .keyPathExpr)
    self._syntaxNode = Syntax(data)
  }

  public init<R: TypeSyntaxProtocol>(
    leadingTrivia: Trivia? = nil,
    _ unexpectedBeforeBackslash: UnexpectedNodesSyntax? = nil,
    backslash: TokenSyntax = .backslashToken(),
    _ unexpectedBetweenBackslashAndRoot: UnexpectedNodesSyntax? = nil,
    root: R? = nil,
    _ unexpectedBetweenRootAndComponents: UnexpectedNodesSyntax? = nil,
    components: KeyPathComponentListSyntax,
    _ unexpectedAfterComponents: UnexpectedNodesSyntax? = nil,
    trailingTrivia: Trivia? = nil
  ) {
    let layout: [RawSyntax?] = [
      unexpectedBeforeBackslash?.raw,
      backslash.raw,
      unexpectedBetweenBackslashAndRoot?.raw,
      root?.raw,
      unexpectedBetweenRootAndComponents?.raw,
      components.raw,
      unexpectedAfterComponents?.raw,
    ]
    let data: SyntaxData = withExtendedLifetime(SyntaxArena()) { arena in
      let raw = RawSyntax.makeLayout(
        kind: SyntaxKind.keyPathExpr, from: layout, arena: arena,
        leadingTrivia: leadingTrivia, trailingTrivia: trailingTrivia)
      return SyntaxData.forRoot(raw)
    }
    self.init(data)
  }

  /// This initializer exists solely because Swift 5.6 does not support
  /// `Optional<ConcreteType>.none` as a default value of a generic parameter.
  /// The above initializer thus defaults to `nil` instead, but that means it
  /// is not actually callable when either not passing the defaulted parameter,
  /// or passing `nil`.
  ///
  /// Hack around that limitation using this initializer, which takes a
  /// `Missing*` syntax node instead. `Missing*` is used over the base type as
  /// the base type would allow implicit conversion from a string literal,
  /// which the above initializer doesn't support.
  public init(
    leadingTrivia: Trivia? = nil,
    _ unexpectedBeforeBackslash: UnexpectedNodesSyntax? = nil,
    backslash: TokenSyntax = .backslashToken(),
    _ unexpectedBetweenBackslashAndRoot: UnexpectedNodesSyntax? = nil,
    root: MissingTypeSyntax? = nil,
    _ unexpectedBetweenRootAndComponents: UnexpectedNodesSyntax? = nil,
    components: KeyPathComponentListSyntax,
    _ unexpectedAfterComponents: UnexpectedNodesSyntax? = nil,
    trailingTrivia: Trivia? = nil
  ) {
    self.init(
      leadingTrivia: leadingTrivia,
      unexpectedBeforeBackslash,
      backslash: backslash,
      unexpectedBetweenBackslashAndRoot,
      root: Optional<TypeSyntax>.none,
      unexpectedBetweenRootAndComponents,
      components: components,
      unexpectedAfterComponents,
      trailingTrivia: trailingTrivia
    )
  }

  public var unexpectedBeforeBackslash: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: 0, parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBeforeBackslash(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBeforeBackslash` replaced.
  /// - param newChild: The new `unexpectedBeforeBackslash` to replace the node's
  ///                   current `unexpectedBeforeBackslash`, if present.
  public func withUnexpectedBeforeBackslash(_ newChild: UnexpectedNodesSyntax?) -> KeyPathExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 0, with: raw, arena: arena)
    return KeyPathExprSyntax(newData)
  }

  public var backslash: TokenSyntax {
    get {
      let childData = data.child(at: 1, parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withBackslash(value)
    }
  }

  /// Returns a copy of the receiver with its `backslash` replaced.
  /// - param newChild: The new `backslash` to replace the node's
  ///                   current `backslash`, if present.
  public func withBackslash(_ newChild: TokenSyntax?) -> KeyPathExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.backslash, arena: arena)
    let newData = data.replacingChild(at: 1, with: raw, arena: arena)
    return KeyPathExprSyntax(newData)
  }

  public var unexpectedBetweenBackslashAndRoot: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: 2, parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenBackslashAndRoot(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenBackslashAndRoot` replaced.
  /// - param newChild: The new `unexpectedBetweenBackslashAndRoot` to replace the node's
  ///                   current `unexpectedBetweenBackslashAndRoot`, if present.
  public func withUnexpectedBetweenBackslashAndRoot(_ newChild: UnexpectedNodesSyntax?) -> KeyPathExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 2, with: raw, arena: arena)
    return KeyPathExprSyntax(newData)
  }

  public var root: TypeSyntax? {
    get {
      let childData = data.child(at: 3, parent: Syntax(self))
      if childData == nil { return nil }
      return TypeSyntax(childData!)
    }
    set(value) {
      self = withRoot(value)
    }
  }

  /// Returns a copy of the receiver with its `root` replaced.
  /// - param newChild: The new `root` to replace the node's
  ///                   current `root`, if present.
  public func withRoot(_ newChild: TypeSyntax?) -> KeyPathExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 3, with: raw, arena: arena)
    return KeyPathExprSyntax(newData)
  }

  public var unexpectedBetweenRootAndComponents: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: 4, parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenRootAndComponents(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenRootAndComponents` replaced.
  /// - param newChild: The new `unexpectedBetweenRootAndComponents` to replace the node's
  ///                   current `unexpectedBetweenRootAndComponents`, if present.
  public func withUnexpectedBetweenRootAndComponents(_ newChild: UnexpectedNodesSyntax?) -> KeyPathExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 4, with: raw, arena: arena)
    return KeyPathExprSyntax(newData)
  }

  public var components: KeyPathComponentListSyntax {
    get {
      let childData = data.child(at: 5, parent: Syntax(self))
      return KeyPathComponentListSyntax(childData!)
    }
    set(value) {
      self = withComponents(value)
    }
  }

  /// Adds the provided `KeyPathComponent` to the node's `components`
  /// collection.
  /// - param element: The new `KeyPathComponent` to add to the node's
  ///                  `components` collection.
  /// - returns: A copy of the receiver with the provided `KeyPathComponent`
  ///            appended to its `components` collection.
  public func addKeyPathComponent(_ element: KeyPathComponentSyntax) -> KeyPathExprSyntax {
    var collection: RawSyntax
    let arena = SyntaxArena()
    if let col = raw.layoutView!.children[5] {
      collection = col.layoutView!.appending(element.raw, arena: arena)
    } else {
      collection = RawSyntax.makeLayout(kind: SyntaxKind.keyPathComponentList,
        from: [element.raw], arena: arena)
    }
    let newData = data.replacingChild(at: 5, with: collection, arena: arena)
    return KeyPathExprSyntax(newData)
  }

  /// Returns a copy of the receiver with its `components` replaced.
  /// - param newChild: The new `components` to replace the node's
  ///                   current `components`, if present.
  public func withComponents(_ newChild: KeyPathComponentListSyntax?) -> KeyPathExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw ?? RawSyntax.makeEmptyLayout(kind: SyntaxKind.keyPathComponentList, arena: arena)
    let newData = data.replacingChild(at: 5, with: raw, arena: arena)
    return KeyPathExprSyntax(newData)
  }

  public var unexpectedAfterComponents: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: 6, parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedAfterComponents(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedAfterComponents` replaced.
  /// - param newChild: The new `unexpectedAfterComponents` to replace the node's
  ///                   current `unexpectedAfterComponents`, if present.
  public func withUnexpectedAfterComponents(_ newChild: UnexpectedNodesSyntax?) -> KeyPathExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 6, with: raw, arena: arena)
    return KeyPathExprSyntax(newData)
  }

  public static var structure: SyntaxNodeStructure {
    return .layout([
      \Self.unexpectedBeforeBackslash,
      \Self.backslash,
      \Self.unexpectedBetweenBackslashAndRoot,
      \Self.root,
      \Self.unexpectedBetweenRootAndComponents,
      \Self.components,
      \Self.unexpectedAfterComponents,
    ])
  }

  public func childNameForDiagnostics(_ index: SyntaxChildrenIndex) -> String? {
    switch index.data?.indexInParent {
    case 0:
      return nil
    case 1:
      return nil
    case 2:
      return nil
    case 3:
      return "root"
    case 4:
      return nil
    case 5:
      return nil
    case 6:
      return nil
    default:
      fatalError("Invalid index")
    }
  }
}

extension KeyPathExprSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeBackslash": unexpectedBeforeBackslash.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "backslash": Syntax(backslash).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenBackslashAndRoot": unexpectedBetweenBackslashAndRoot.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "root": root.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenRootAndComponents": unexpectedBetweenRootAndComponents.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "components": Syntax(components).asProtocol(SyntaxProtocol.self),
      "unexpectedAfterComponents": unexpectedAfterComponents.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - MacroExpansionExprSyntax

public struct MacroExpansionExprSyntax: ExprSyntaxProtocol, SyntaxHashable {
  public let _syntaxNode: Syntax

  public init?<S: SyntaxProtocol>(_ node: S) {
    guard node.raw.kind == .macroExpansionExpr else { return nil }
    self._syntaxNode = node._syntaxNode
  }

  /// Creates a `MacroExpansionExprSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .macroExpansionExpr)
    self._syntaxNode = Syntax(data)
  }

  public init(
    leadingTrivia: Trivia? = nil,
    _ unexpectedBeforePoundToken: UnexpectedNodesSyntax? = nil,
    poundToken: TokenSyntax = .poundToken(),
    _ unexpectedBetweenPoundTokenAndMacro: UnexpectedNodesSyntax? = nil,
    macro: TokenSyntax,
    _ unexpectedBetweenMacroAndGenericArguments: UnexpectedNodesSyntax? = nil,
    genericArguments: GenericArgumentClauseSyntax? = nil,
    _ unexpectedBetweenGenericArgumentsAndLeftParen: UnexpectedNodesSyntax? = nil,
    leftParen: TokenSyntax? = nil,
    _ unexpectedBetweenLeftParenAndArgumentList: UnexpectedNodesSyntax? = nil,
    argumentList: TupleExprElementListSyntax,
    _ unexpectedBetweenArgumentListAndRightParen: UnexpectedNodesSyntax? = nil,
    rightParen: TokenSyntax? = nil,
    _ unexpectedBetweenRightParenAndTrailingClosure: UnexpectedNodesSyntax? = nil,
    trailingClosure: ClosureExprSyntax? = nil,
    _ unexpectedBetweenTrailingClosureAndAdditionalTrailingClosures: UnexpectedNodesSyntax? = nil,
    additionalTrailingClosures: MultipleTrailingClosureElementListSyntax? = nil,
    _ unexpectedAfterAdditionalTrailingClosures: UnexpectedNodesSyntax? = nil,
    trailingTrivia: Trivia? = nil
  ) {
    let layout: [RawSyntax?] = [
      unexpectedBeforePoundToken?.raw,
      poundToken.raw,
      unexpectedBetweenPoundTokenAndMacro?.raw,
      macro.raw,
      unexpectedBetweenMacroAndGenericArguments?.raw,
      genericArguments?.raw,
      unexpectedBetweenGenericArgumentsAndLeftParen?.raw,
      leftParen?.raw,
      unexpectedBetweenLeftParenAndArgumentList?.raw,
      argumentList.raw,
      unexpectedBetweenArgumentListAndRightParen?.raw,
      rightParen?.raw,
      unexpectedBetweenRightParenAndTrailingClosure?.raw,
      trailingClosure?.raw,
      unexpectedBetweenTrailingClosureAndAdditionalTrailingClosures?.raw,
      additionalTrailingClosures?.raw,
      unexpectedAfterAdditionalTrailingClosures?.raw,
    ]
    let data: SyntaxData = withExtendedLifetime(SyntaxArena()) { arena in
      let raw = RawSyntax.makeLayout(
        kind: SyntaxKind.macroExpansionExpr, from: layout, arena: arena,
        leadingTrivia: leadingTrivia, trailingTrivia: trailingTrivia)
      return SyntaxData.forRoot(raw)
    }
    self.init(data)
  }

  public var unexpectedBeforePoundToken: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: 0, parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBeforePoundToken(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBeforePoundToken` replaced.
  /// - param newChild: The new `unexpectedBeforePoundToken` to replace the node's
  ///                   current `unexpectedBeforePoundToken`, if present.
  public func withUnexpectedBeforePoundToken(_ newChild: UnexpectedNodesSyntax?) -> MacroExpansionExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 0, with: raw, arena: arena)
    return MacroExpansionExprSyntax(newData)
  }

  /// The `#` sign.
  public var poundToken: TokenSyntax {
    get {
      let childData = data.child(at: 1, parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withPoundToken(value)
    }
  }

  /// Returns a copy of the receiver with its `poundToken` replaced.
  /// - param newChild: The new `poundToken` to replace the node's
  ///                   current `poundToken`, if present.
  public func withPoundToken(_ newChild: TokenSyntax?) -> MacroExpansionExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.pound, arena: arena)
    let newData = data.replacingChild(at: 1, with: raw, arena: arena)
    return MacroExpansionExprSyntax(newData)
  }

  public var unexpectedBetweenPoundTokenAndMacro: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: 2, parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenPoundTokenAndMacro(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenPoundTokenAndMacro` replaced.
  /// - param newChild: The new `unexpectedBetweenPoundTokenAndMacro` to replace the node's
  ///                   current `unexpectedBetweenPoundTokenAndMacro`, if present.
  public func withUnexpectedBetweenPoundTokenAndMacro(_ newChild: UnexpectedNodesSyntax?) -> MacroExpansionExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 2, with: raw, arena: arena)
    return MacroExpansionExprSyntax(newData)
  }

  public var macro: TokenSyntax {
    get {
      let childData = data.child(at: 3, parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withMacro(value)
    }
  }

  /// Returns a copy of the receiver with its `macro` replaced.
  /// - param newChild: The new `macro` to replace the node's
  ///                   current `macro`, if present.
  public func withMacro(_ newChild: TokenSyntax?) -> MacroExpansionExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.identifier(""), arena: arena)
    let newData = data.replacingChild(at: 3, with: raw, arena: arena)
    return MacroExpansionExprSyntax(newData)
  }

  public var unexpectedBetweenMacroAndGenericArguments: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: 4, parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenMacroAndGenericArguments(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenMacroAndGenericArguments` replaced.
  /// - param newChild: The new `unexpectedBetweenMacroAndGenericArguments` to replace the node's
  ///                   current `unexpectedBetweenMacroAndGenericArguments`, if present.
  public func withUnexpectedBetweenMacroAndGenericArguments(_ newChild: UnexpectedNodesSyntax?) -> MacroExpansionExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 4, with: raw, arena: arena)
    return MacroExpansionExprSyntax(newData)
  }

  public var genericArguments: GenericArgumentClauseSyntax? {
    get {
      let childData = data.child(at: 5, parent: Syntax(self))
      if childData == nil { return nil }
      return GenericArgumentClauseSyntax(childData!)
    }
    set(value) {
      self = withGenericArguments(value)
    }
  }

  /// Returns a copy of the receiver with its `genericArguments` replaced.
  /// - param newChild: The new `genericArguments` to replace the node's
  ///                   current `genericArguments`, if present.
  public func withGenericArguments(_ newChild: GenericArgumentClauseSyntax?) -> MacroExpansionExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 5, with: raw, arena: arena)
    return MacroExpansionExprSyntax(newData)
  }

  public var unexpectedBetweenGenericArgumentsAndLeftParen: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: 6, parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenGenericArgumentsAndLeftParen(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenGenericArgumentsAndLeftParen` replaced.
  /// - param newChild: The new `unexpectedBetweenGenericArgumentsAndLeftParen` to replace the node's
  ///                   current `unexpectedBetweenGenericArgumentsAndLeftParen`, if present.
  public func withUnexpectedBetweenGenericArgumentsAndLeftParen(_ newChild: UnexpectedNodesSyntax?) -> MacroExpansionExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 6, with: raw, arena: arena)
    return MacroExpansionExprSyntax(newData)
  }

  public var leftParen: TokenSyntax? {
    get {
      let childData = data.child(at: 7, parent: Syntax(self))
      if childData == nil { return nil }
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withLeftParen(value)
    }
  }

  /// Returns a copy of the receiver with its `leftParen` replaced.
  /// - param newChild: The new `leftParen` to replace the node's
  ///                   current `leftParen`, if present.
  public func withLeftParen(_ newChild: TokenSyntax?) -> MacroExpansionExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 7, with: raw, arena: arena)
    return MacroExpansionExprSyntax(newData)
  }

  public var unexpectedBetweenLeftParenAndArgumentList: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: 8, parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenLeftParenAndArgumentList(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenLeftParenAndArgumentList` replaced.
  /// - param newChild: The new `unexpectedBetweenLeftParenAndArgumentList` to replace the node's
  ///                   current `unexpectedBetweenLeftParenAndArgumentList`, if present.
  public func withUnexpectedBetweenLeftParenAndArgumentList(_ newChild: UnexpectedNodesSyntax?) -> MacroExpansionExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 8, with: raw, arena: arena)
    return MacroExpansionExprSyntax(newData)
  }

  public var argumentList: TupleExprElementListSyntax {
    get {
      let childData = data.child(at: 9, parent: Syntax(self))
      return TupleExprElementListSyntax(childData!)
    }
    set(value) {
      self = withArgumentList(value)
    }
  }

  /// Adds the provided `Argument` to the node's `argumentList`
  /// collection.
  /// - param element: The new `Argument` to add to the node's
  ///                  `argumentList` collection.
  /// - returns: A copy of the receiver with the provided `Argument`
  ///            appended to its `argumentList` collection.
  public func addArgument(_ element: TupleExprElementSyntax) -> MacroExpansionExprSyntax {
    var collection: RawSyntax
    let arena = SyntaxArena()
    if let col = raw.layoutView!.children[9] {
      collection = col.layoutView!.appending(element.raw, arena: arena)
    } else {
      collection = RawSyntax.makeLayout(kind: SyntaxKind.tupleExprElementList,
        from: [element.raw], arena: arena)
    }
    let newData = data.replacingChild(at: 9, with: collection, arena: arena)
    return MacroExpansionExprSyntax(newData)
  }

  /// Returns a copy of the receiver with its `argumentList` replaced.
  /// - param newChild: The new `argumentList` to replace the node's
  ///                   current `argumentList`, if present.
  public func withArgumentList(_ newChild: TupleExprElementListSyntax?) -> MacroExpansionExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw ?? RawSyntax.makeEmptyLayout(kind: SyntaxKind.tupleExprElementList, arena: arena)
    let newData = data.replacingChild(at: 9, with: raw, arena: arena)
    return MacroExpansionExprSyntax(newData)
  }

  public var unexpectedBetweenArgumentListAndRightParen: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: 10, parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenArgumentListAndRightParen(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenArgumentListAndRightParen` replaced.
  /// - param newChild: The new `unexpectedBetweenArgumentListAndRightParen` to replace the node's
  ///                   current `unexpectedBetweenArgumentListAndRightParen`, if present.
  public func withUnexpectedBetweenArgumentListAndRightParen(_ newChild: UnexpectedNodesSyntax?) -> MacroExpansionExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 10, with: raw, arena: arena)
    return MacroExpansionExprSyntax(newData)
  }

  public var rightParen: TokenSyntax? {
    get {
      let childData = data.child(at: 11, parent: Syntax(self))
      if childData == nil { return nil }
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withRightParen(value)
    }
  }

  /// Returns a copy of the receiver with its `rightParen` replaced.
  /// - param newChild: The new `rightParen` to replace the node's
  ///                   current `rightParen`, if present.
  public func withRightParen(_ newChild: TokenSyntax?) -> MacroExpansionExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 11, with: raw, arena: arena)
    return MacroExpansionExprSyntax(newData)
  }

  public var unexpectedBetweenRightParenAndTrailingClosure: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: 12, parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenRightParenAndTrailingClosure(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenRightParenAndTrailingClosure` replaced.
  /// - param newChild: The new `unexpectedBetweenRightParenAndTrailingClosure` to replace the node's
  ///                   current `unexpectedBetweenRightParenAndTrailingClosure`, if present.
  public func withUnexpectedBetweenRightParenAndTrailingClosure(_ newChild: UnexpectedNodesSyntax?) -> MacroExpansionExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 12, with: raw, arena: arena)
    return MacroExpansionExprSyntax(newData)
  }

  public var trailingClosure: ClosureExprSyntax? {
    get {
      let childData = data.child(at: 13, parent: Syntax(self))
      if childData == nil { return nil }
      return ClosureExprSyntax(childData!)
    }
    set(value) {
      self = withTrailingClosure(value)
    }
  }

  /// Returns a copy of the receiver with its `trailingClosure` replaced.
  /// - param newChild: The new `trailingClosure` to replace the node's
  ///                   current `trailingClosure`, if present.
  public func withTrailingClosure(_ newChild: ClosureExprSyntax?) -> MacroExpansionExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 13, with: raw, arena: arena)
    return MacroExpansionExprSyntax(newData)
  }

  public var unexpectedBetweenTrailingClosureAndAdditionalTrailingClosures: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: 14, parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenTrailingClosureAndAdditionalTrailingClosures(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenTrailingClosureAndAdditionalTrailingClosures` replaced.
  /// - param newChild: The new `unexpectedBetweenTrailingClosureAndAdditionalTrailingClosures` to replace the node's
  ///                   current `unexpectedBetweenTrailingClosureAndAdditionalTrailingClosures`, if present.
  public func withUnexpectedBetweenTrailingClosureAndAdditionalTrailingClosures(_ newChild: UnexpectedNodesSyntax?) -> MacroExpansionExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 14, with: raw, arena: arena)
    return MacroExpansionExprSyntax(newData)
  }

  public var additionalTrailingClosures: MultipleTrailingClosureElementListSyntax? {
    get {
      let childData = data.child(at: 15, parent: Syntax(self))
      if childData == nil { return nil }
      return MultipleTrailingClosureElementListSyntax(childData!)
    }
    set(value) {
      self = withAdditionalTrailingClosures(value)
    }
  }

  /// Adds the provided `AdditionalTrailingClosure` to the node's `additionalTrailingClosures`
  /// collection.
  /// - param element: The new `AdditionalTrailingClosure` to add to the node's
  ///                  `additionalTrailingClosures` collection.
  /// - returns: A copy of the receiver with the provided `AdditionalTrailingClosure`
  ///            appended to its `additionalTrailingClosures` collection.
  public func addAdditionalTrailingClosure(_ element: MultipleTrailingClosureElementSyntax) -> MacroExpansionExprSyntax {
    var collection: RawSyntax
    let arena = SyntaxArena()
    if let col = raw.layoutView!.children[15] {
      collection = col.layoutView!.appending(element.raw, arena: arena)
    } else {
      collection = RawSyntax.makeLayout(kind: SyntaxKind.multipleTrailingClosureElementList,
        from: [element.raw], arena: arena)
    }
    let newData = data.replacingChild(at: 15, with: collection, arena: arena)
    return MacroExpansionExprSyntax(newData)
  }

  /// Returns a copy of the receiver with its `additionalTrailingClosures` replaced.
  /// - param newChild: The new `additionalTrailingClosures` to replace the node's
  ///                   current `additionalTrailingClosures`, if present.
  public func withAdditionalTrailingClosures(_ newChild: MultipleTrailingClosureElementListSyntax?) -> MacroExpansionExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 15, with: raw, arena: arena)
    return MacroExpansionExprSyntax(newData)
  }

  public var unexpectedAfterAdditionalTrailingClosures: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: 16, parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedAfterAdditionalTrailingClosures(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedAfterAdditionalTrailingClosures` replaced.
  /// - param newChild: The new `unexpectedAfterAdditionalTrailingClosures` to replace the node's
  ///                   current `unexpectedAfterAdditionalTrailingClosures`, if present.
  public func withUnexpectedAfterAdditionalTrailingClosures(_ newChild: UnexpectedNodesSyntax?) -> MacroExpansionExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 16, with: raw, arena: arena)
    return MacroExpansionExprSyntax(newData)
  }

  public static var structure: SyntaxNodeStructure {
    return .layout([
      \Self.unexpectedBeforePoundToken,
      \Self.poundToken,
      \Self.unexpectedBetweenPoundTokenAndMacro,
      \Self.macro,
      \Self.unexpectedBetweenMacroAndGenericArguments,
      \Self.genericArguments,
      \Self.unexpectedBetweenGenericArgumentsAndLeftParen,
      \Self.leftParen,
      \Self.unexpectedBetweenLeftParenAndArgumentList,
      \Self.argumentList,
      \Self.unexpectedBetweenArgumentListAndRightParen,
      \Self.rightParen,
      \Self.unexpectedBetweenRightParenAndTrailingClosure,
      \Self.trailingClosure,
      \Self.unexpectedBetweenTrailingClosureAndAdditionalTrailingClosures,
      \Self.additionalTrailingClosures,
      \Self.unexpectedAfterAdditionalTrailingClosures,
    ])
  }

  public func childNameForDiagnostics(_ index: SyntaxChildrenIndex) -> String? {
    switch index.data?.indexInParent {
    case 0:
      return nil
    case 1:
      return nil
    case 2:
      return nil
    case 3:
      return nil
    case 4:
      return nil
    case 5:
      return nil
    case 6:
      return nil
    case 7:
      return nil
    case 8:
      return nil
    case 9:
      return nil
    case 10:
      return nil
    case 11:
      return nil
    case 12:
      return nil
    case 13:
      return nil
    case 14:
      return nil
    case 15:
      return nil
    case 16:
      return nil
    default:
      fatalError("Invalid index")
    }
  }
}

extension MacroExpansionExprSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforePoundToken": unexpectedBeforePoundToken.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "poundToken": Syntax(poundToken).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenPoundTokenAndMacro": unexpectedBetweenPoundTokenAndMacro.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "macro": Syntax(macro).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenMacroAndGenericArguments": unexpectedBetweenMacroAndGenericArguments.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "genericArguments": genericArguments.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenGenericArgumentsAndLeftParen": unexpectedBetweenGenericArgumentsAndLeftParen.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "leftParen": leftParen.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenLeftParenAndArgumentList": unexpectedBetweenLeftParenAndArgumentList.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "argumentList": Syntax(argumentList).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenArgumentListAndRightParen": unexpectedBetweenArgumentListAndRightParen.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "rightParen": rightParen.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenRightParenAndTrailingClosure": unexpectedBetweenRightParenAndTrailingClosure.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "trailingClosure": trailingClosure.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenTrailingClosureAndAdditionalTrailingClosures": unexpectedBetweenTrailingClosureAndAdditionalTrailingClosures.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "additionalTrailingClosures": additionalTrailingClosures.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedAfterAdditionalTrailingClosures": unexpectedAfterAdditionalTrailingClosures.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - PostfixIfConfigExprSyntax

public struct PostfixIfConfigExprSyntax: ExprSyntaxProtocol, SyntaxHashable {
  public let _syntaxNode: Syntax

  public init?<S: SyntaxProtocol>(_ node: S) {
    guard node.raw.kind == .postfixIfConfigExpr else { return nil }
    self._syntaxNode = node._syntaxNode
  }

  /// Creates a `PostfixIfConfigExprSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .postfixIfConfigExpr)
    self._syntaxNode = Syntax(data)
  }

  public init<B: ExprSyntaxProtocol>(
    leadingTrivia: Trivia? = nil,
    _ unexpectedBeforeBase: UnexpectedNodesSyntax? = nil,
    base: B? = nil,
    _ unexpectedBetweenBaseAndConfig: UnexpectedNodesSyntax? = nil,
    config: IfConfigDeclSyntax,
    _ unexpectedAfterConfig: UnexpectedNodesSyntax? = nil,
    trailingTrivia: Trivia? = nil
  ) {
    let layout: [RawSyntax?] = [
      unexpectedBeforeBase?.raw,
      base?.raw,
      unexpectedBetweenBaseAndConfig?.raw,
      config.raw,
      unexpectedAfterConfig?.raw,
    ]
    let data: SyntaxData = withExtendedLifetime(SyntaxArena()) { arena in
      let raw = RawSyntax.makeLayout(
        kind: SyntaxKind.postfixIfConfigExpr, from: layout, arena: arena,
        leadingTrivia: leadingTrivia, trailingTrivia: trailingTrivia)
      return SyntaxData.forRoot(raw)
    }
    self.init(data)
  }

  /// This initializer exists solely because Swift 5.6 does not support
  /// `Optional<ConcreteType>.none` as a default value of a generic parameter.
  /// The above initializer thus defaults to `nil` instead, but that means it
  /// is not actually callable when either not passing the defaulted parameter,
  /// or passing `nil`.
  ///
  /// Hack around that limitation using this initializer, which takes a
  /// `Missing*` syntax node instead. `Missing*` is used over the base type as
  /// the base type would allow implicit conversion from a string literal,
  /// which the above initializer doesn't support.
  public init(
    leadingTrivia: Trivia? = nil,
    _ unexpectedBeforeBase: UnexpectedNodesSyntax? = nil,
    base: MissingExprSyntax? = nil,
    _ unexpectedBetweenBaseAndConfig: UnexpectedNodesSyntax? = nil,
    config: IfConfigDeclSyntax,
    _ unexpectedAfterConfig: UnexpectedNodesSyntax? = nil,
    trailingTrivia: Trivia? = nil
  ) {
    self.init(
      leadingTrivia: leadingTrivia,
      unexpectedBeforeBase,
      base: Optional<ExprSyntax>.none,
      unexpectedBetweenBaseAndConfig,
      config: config,
      unexpectedAfterConfig,
      trailingTrivia: trailingTrivia
    )
  }

  public var unexpectedBeforeBase: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: 0, parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBeforeBase(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBeforeBase` replaced.
  /// - param newChild: The new `unexpectedBeforeBase` to replace the node's
  ///                   current `unexpectedBeforeBase`, if present.
  public func withUnexpectedBeforeBase(_ newChild: UnexpectedNodesSyntax?) -> PostfixIfConfigExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 0, with: raw, arena: arena)
    return PostfixIfConfigExprSyntax(newData)
  }

  public var base: ExprSyntax? {
    get {
      let childData = data.child(at: 1, parent: Syntax(self))
      if childData == nil { return nil }
      return ExprSyntax(childData!)
    }
    set(value) {
      self = withBase(value)
    }
  }

  /// Returns a copy of the receiver with its `base` replaced.
  /// - param newChild: The new `base` to replace the node's
  ///                   current `base`, if present.
  public func withBase(_ newChild: ExprSyntax?) -> PostfixIfConfigExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 1, with: raw, arena: arena)
    return PostfixIfConfigExprSyntax(newData)
  }

  public var unexpectedBetweenBaseAndConfig: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: 2, parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBetweenBaseAndConfig(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBetweenBaseAndConfig` replaced.
  /// - param newChild: The new `unexpectedBetweenBaseAndConfig` to replace the node's
  ///                   current `unexpectedBetweenBaseAndConfig`, if present.
  public func withUnexpectedBetweenBaseAndConfig(_ newChild: UnexpectedNodesSyntax?) -> PostfixIfConfigExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 2, with: raw, arena: arena)
    return PostfixIfConfigExprSyntax(newData)
  }

  public var config: IfConfigDeclSyntax {
    get {
      let childData = data.child(at: 3, parent: Syntax(self))
      return IfConfigDeclSyntax(childData!)
    }
    set(value) {
      self = withConfig(value)
    }
  }

  /// Returns a copy of the receiver with its `config` replaced.
  /// - param newChild: The new `config` to replace the node's
  ///                   current `config`, if present.
  public func withConfig(_ newChild: IfConfigDeclSyntax?) -> PostfixIfConfigExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw ?? RawSyntax.makeEmptyLayout(kind: SyntaxKind.ifConfigDecl, arena: arena)
    let newData = data.replacingChild(at: 3, with: raw, arena: arena)
    return PostfixIfConfigExprSyntax(newData)
  }

  public var unexpectedAfterConfig: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: 4, parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedAfterConfig(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedAfterConfig` replaced.
  /// - param newChild: The new `unexpectedAfterConfig` to replace the node's
  ///                   current `unexpectedAfterConfig`, if present.
  public func withUnexpectedAfterConfig(_ newChild: UnexpectedNodesSyntax?) -> PostfixIfConfigExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 4, with: raw, arena: arena)
    return PostfixIfConfigExprSyntax(newData)
  }

  public static var structure: SyntaxNodeStructure {
    return .layout([
      \Self.unexpectedBeforeBase,
      \Self.base,
      \Self.unexpectedBetweenBaseAndConfig,
      \Self.config,
      \Self.unexpectedAfterConfig,
    ])
  }

  public func childNameForDiagnostics(_ index: SyntaxChildrenIndex) -> String? {
    switch index.data?.indexInParent {
    case 0:
      return nil
    case 1:
      return nil
    case 2:
      return nil
    case 3:
      return nil
    case 4:
      return nil
    default:
      fatalError("Invalid index")
    }
  }
}

extension PostfixIfConfigExprSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeBase": unexpectedBeforeBase.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "base": base.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenBaseAndConfig": unexpectedBetweenBaseAndConfig.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "config": Syntax(config).asProtocol(SyntaxProtocol.self),
      "unexpectedAfterConfig": unexpectedAfterConfig.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - EditorPlaceholderExprSyntax

public struct EditorPlaceholderExprSyntax: ExprSyntaxProtocol, SyntaxHashable {
  public let _syntaxNode: Syntax

  public init?<S: SyntaxProtocol>(_ node: S) {
    guard node.raw.kind == .editorPlaceholderExpr else { return nil }
    self._syntaxNode = node._syntaxNode
  }

  /// Creates a `EditorPlaceholderExprSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .editorPlaceholderExpr)
    self._syntaxNode = Syntax(data)
  }

  public init(
    leadingTrivia: Trivia? = nil,
    _ unexpectedBeforeIdentifier: UnexpectedNodesSyntax? = nil,
    identifier: TokenSyntax,
    _ unexpectedAfterIdentifier: UnexpectedNodesSyntax? = nil,
    trailingTrivia: Trivia? = nil
  ) {
    let layout: [RawSyntax?] = [
      unexpectedBeforeIdentifier?.raw,
      identifier.raw,
      unexpectedAfterIdentifier?.raw,
    ]
    let data: SyntaxData = withExtendedLifetime(SyntaxArena()) { arena in
      let raw = RawSyntax.makeLayout(
        kind: SyntaxKind.editorPlaceholderExpr, from: layout, arena: arena,
        leadingTrivia: leadingTrivia, trailingTrivia: trailingTrivia)
      return SyntaxData.forRoot(raw)
    }
    self.init(data)
  }

  public var unexpectedBeforeIdentifier: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: 0, parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedBeforeIdentifier(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedBeforeIdentifier` replaced.
  /// - param newChild: The new `unexpectedBeforeIdentifier` to replace the node's
  ///                   current `unexpectedBeforeIdentifier`, if present.
  public func withUnexpectedBeforeIdentifier(_ newChild: UnexpectedNodesSyntax?) -> EditorPlaceholderExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 0, with: raw, arena: arena)
    return EditorPlaceholderExprSyntax(newData)
  }

  public var identifier: TokenSyntax {
    get {
      let childData = data.child(at: 1, parent: Syntax(self))
      return TokenSyntax(childData!)
    }
    set(value) {
      self = withIdentifier(value)
    }
  }

  /// Returns a copy of the receiver with its `identifier` replaced.
  /// - param newChild: The new `identifier` to replace the node's
  ///                   current `identifier`, if present.
  public func withIdentifier(_ newChild: TokenSyntax?) -> EditorPlaceholderExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw ?? RawSyntax.makeMissingToken(kind: TokenKind.identifier(""), arena: arena)
    let newData = data.replacingChild(at: 1, with: raw, arena: arena)
    return EditorPlaceholderExprSyntax(newData)
  }

  public var unexpectedAfterIdentifier: UnexpectedNodesSyntax? {
    get {
      let childData = data.child(at: 2, parent: Syntax(self))
      if childData == nil { return nil }
      return UnexpectedNodesSyntax(childData!)
    }
    set(value) {
      self = withUnexpectedAfterIdentifier(value)
    }
  }

  /// Returns a copy of the receiver with its `unexpectedAfterIdentifier` replaced.
  /// - param newChild: The new `unexpectedAfterIdentifier` to replace the node's
  ///                   current `unexpectedAfterIdentifier`, if present.
  public func withUnexpectedAfterIdentifier(_ newChild: UnexpectedNodesSyntax?) -> EditorPlaceholderExprSyntax {
    let arena = SyntaxArena()
    let raw = newChild?.raw
    let newData = data.replacingChild(at: 2, with: raw, arena: arena)
    return EditorPlaceholderExprSyntax(newData)
  }

  public static var structure: SyntaxNodeStructure {
    return .layout([
      \Self.unexpectedBeforeIdentifier,
      \Self.identifier,
      \Self.unexpectedAfterIdentifier,
    ])
  }

  public func childNameForDiagnostics(_ index: SyntaxChildrenIndex) -> String? {
    switch index.data?.indexInParent {
    case 0:
      return nil
    case 1:
      return nil
    case 2:
      return nil
    default:
      fatalError("Invalid index")
    }
  }
}

extension EditorPlaceholderExprSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeIdentifier": unexpectedBeforeIdentifier.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "identifier": Syntax(identifier).asProtocol(SyntaxProtocol.self),
      "unexpectedAfterIdentifier": unexpectedAfterIdentifier.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

