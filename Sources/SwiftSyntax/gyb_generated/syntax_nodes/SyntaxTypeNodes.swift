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


// MARK: - MissingTypeSyntax

public struct MissingTypeSyntax: TypeSyntaxProtocol, SyntaxHashable {
  public let _syntaxNode: Syntax

  public init?<S: SyntaxProtocol>(_ node: S) {
    guard node.raw.kind == .missingType else { return nil }
    self._syntaxNode = node._syntaxNode
  }

  /// Creates a `MissingTypeSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .missingType)
    self._syntaxNode = Syntax(data)
  }

  public init() {
    // Extend the lifetime of all parameters so their arenas don't get destroyed 
    // before they can be added as children of the new arena.
    let data: SyntaxData = withExtendedLifetime((SyntaxArena(), ())) { (arena, _) in
      let raw = RawSyntax.makeEmptyLayout(kind: SyntaxKind.missingType, arena: arena)
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

extension MissingTypeSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
    ])
  }
}

// MARK: - SimpleTypeIdentifierSyntax

public struct SimpleTypeIdentifierSyntax: TypeSyntaxProtocol, SyntaxHashable {
  public let _syntaxNode: Syntax

  public init?<S: SyntaxProtocol>(_ node: S) {
    guard node.raw.kind == .simpleTypeIdentifier else { return nil }
    self._syntaxNode = node._syntaxNode
  }

  /// Creates a `SimpleTypeIdentifierSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .simpleTypeIdentifier)
    self._syntaxNode = Syntax(data)
  }

  public init(
    leadingTrivia: Trivia? = nil,
    _ unexpectedBeforeName: UnexpectedNodesSyntax? = nil,
    name: TokenSyntax,
    _ unexpectedBetweenNameAndGenericArgumentClause: UnexpectedNodesSyntax? = nil,
    genericArgumentClause: GenericArgumentClauseSyntax? = nil,
    _ unexpectedAfterGenericArgumentClause: UnexpectedNodesSyntax? = nil,
    trailingTrivia: Trivia? = nil
  ) {
    // Extend the lifetime of all parameters so their arenas don't get destroyed 
    // before they can be added as children of the new arena.
    let data: SyntaxData = withExtendedLifetime((SyntaxArena(), (unexpectedBeforeName, name, unexpectedBetweenNameAndGenericArgumentClause, genericArgumentClause, unexpectedAfterGenericArgumentClause))) { (arena, _) in
      let layout: [RawSyntax?] = [
        unexpectedBeforeName?.raw,
        name.raw,
        unexpectedBetweenNameAndGenericArgumentClause?.raw,
        genericArgumentClause?.raw,
        unexpectedAfterGenericArgumentClause?.raw,
      ]
      let raw = RawSyntax.makeLayout(
        kind: SyntaxKind.simpleTypeIdentifier, from: layout, arena: arena,
        leadingTrivia: leadingTrivia, trailingTrivia: trailingTrivia)
      return SyntaxData.forRoot(raw)
    }
    self.init(data)
  }

  public var unexpectedBeforeName: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 0, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = SimpleTypeIdentifierSyntax(data.replacingChild(at: 0, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var name: TokenSyntax {
    get {
      return TokenSyntax(data.child(at: 1, parent: Syntax(self))!)
    }
    set(value) {
      self = SimpleTypeIdentifierSyntax(data.replacingChild(at: 1, with: value.raw, arena: SyntaxArena()))
    }
  }

  public var unexpectedBetweenNameAndGenericArgumentClause: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 2, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = SimpleTypeIdentifierSyntax(data.replacingChild(at: 2, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var genericArgumentClause: GenericArgumentClauseSyntax? {
    get {
      return data.child(at: 3, parent: Syntax(self)).map(GenericArgumentClauseSyntax.init)
    }
    set(value) {
      self = SimpleTypeIdentifierSyntax(data.replacingChild(at: 3, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var unexpectedAfterGenericArgumentClause: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 4, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = SimpleTypeIdentifierSyntax(data.replacingChild(at: 4, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public static var structure: SyntaxNodeStructure {
    return .layout([
      \Self.unexpectedBeforeName,
      \Self.name,
      \Self.unexpectedBetweenNameAndGenericArgumentClause,
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

extension SimpleTypeIdentifierSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeName": unexpectedBeforeName.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "name": Syntax(name).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenNameAndGenericArgumentClause": unexpectedBetweenNameAndGenericArgumentClause.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "genericArgumentClause": genericArgumentClause.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedAfterGenericArgumentClause": unexpectedAfterGenericArgumentClause.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - MemberTypeIdentifierSyntax

public struct MemberTypeIdentifierSyntax: TypeSyntaxProtocol, SyntaxHashable {
  public let _syntaxNode: Syntax

  public init?<S: SyntaxProtocol>(_ node: S) {
    guard node.raw.kind == .memberTypeIdentifier else { return nil }
    self._syntaxNode = node._syntaxNode
  }

  /// Creates a `MemberTypeIdentifierSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .memberTypeIdentifier)
    self._syntaxNode = Syntax(data)
  }

  public init<B: TypeSyntaxProtocol>(
    leadingTrivia: Trivia? = nil,
    _ unexpectedBeforeBaseType: UnexpectedNodesSyntax? = nil,
    baseType: B,
    _ unexpectedBetweenBaseTypeAndPeriod: UnexpectedNodesSyntax? = nil,
    period: TokenSyntax = .periodToken(),
    _ unexpectedBetweenPeriodAndName: UnexpectedNodesSyntax? = nil,
    name: TokenSyntax,
    _ unexpectedBetweenNameAndGenericArgumentClause: UnexpectedNodesSyntax? = nil,
    genericArgumentClause: GenericArgumentClauseSyntax? = nil,
    _ unexpectedAfterGenericArgumentClause: UnexpectedNodesSyntax? = nil,
    trailingTrivia: Trivia? = nil
  ) {
    // Extend the lifetime of all parameters so their arenas don't get destroyed 
    // before they can be added as children of the new arena.
    let data: SyntaxData = withExtendedLifetime((SyntaxArena(), (unexpectedBeforeBaseType, baseType, unexpectedBetweenBaseTypeAndPeriod, period, unexpectedBetweenPeriodAndName, name, unexpectedBetweenNameAndGenericArgumentClause, genericArgumentClause, unexpectedAfterGenericArgumentClause))) { (arena, _) in
      let layout: [RawSyntax?] = [
        unexpectedBeforeBaseType?.raw,
        baseType.raw,
        unexpectedBetweenBaseTypeAndPeriod?.raw,
        period.raw,
        unexpectedBetweenPeriodAndName?.raw,
        name.raw,
        unexpectedBetweenNameAndGenericArgumentClause?.raw,
        genericArgumentClause?.raw,
        unexpectedAfterGenericArgumentClause?.raw,
      ]
      let raw = RawSyntax.makeLayout(
        kind: SyntaxKind.memberTypeIdentifier, from: layout, arena: arena,
        leadingTrivia: leadingTrivia, trailingTrivia: trailingTrivia)
      return SyntaxData.forRoot(raw)
    }
    self.init(data)
  }

  public var unexpectedBeforeBaseType: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 0, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = MemberTypeIdentifierSyntax(data.replacingChild(at: 0, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var baseType: TypeSyntax {
    get {
      return TypeSyntax(data.child(at: 1, parent: Syntax(self))!)
    }
    set(value) {
      self = MemberTypeIdentifierSyntax(data.replacingChild(at: 1, with: value.raw, arena: SyntaxArena()))
    }
  }

  public var unexpectedBetweenBaseTypeAndPeriod: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 2, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = MemberTypeIdentifierSyntax(data.replacingChild(at: 2, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var period: TokenSyntax {
    get {
      return TokenSyntax(data.child(at: 3, parent: Syntax(self))!)
    }
    set(value) {
      self = MemberTypeIdentifierSyntax(data.replacingChild(at: 3, with: value.raw, arena: SyntaxArena()))
    }
  }

  public var unexpectedBetweenPeriodAndName: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 4, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = MemberTypeIdentifierSyntax(data.replacingChild(at: 4, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var name: TokenSyntax {
    get {
      return TokenSyntax(data.child(at: 5, parent: Syntax(self))!)
    }
    set(value) {
      self = MemberTypeIdentifierSyntax(data.replacingChild(at: 5, with: value.raw, arena: SyntaxArena()))
    }
  }

  public var unexpectedBetweenNameAndGenericArgumentClause: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 6, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = MemberTypeIdentifierSyntax(data.replacingChild(at: 6, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var genericArgumentClause: GenericArgumentClauseSyntax? {
    get {
      return data.child(at: 7, parent: Syntax(self)).map(GenericArgumentClauseSyntax.init)
    }
    set(value) {
      self = MemberTypeIdentifierSyntax(data.replacingChild(at: 7, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var unexpectedAfterGenericArgumentClause: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 8, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = MemberTypeIdentifierSyntax(data.replacingChild(at: 8, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public static var structure: SyntaxNodeStructure {
    return .layout([
      \Self.unexpectedBeforeBaseType,
      \Self.baseType,
      \Self.unexpectedBetweenBaseTypeAndPeriod,
      \Self.period,
      \Self.unexpectedBetweenPeriodAndName,
      \Self.name,
      \Self.unexpectedBetweenNameAndGenericArgumentClause,
      \Self.genericArgumentClause,
      \Self.unexpectedAfterGenericArgumentClause,
    ])
  }

  public func childNameForDiagnostics(_ index: SyntaxChildrenIndex) -> String? {
    switch index.data?.indexInParent {
    case 0:
      return nil
    case 1:
      return "base type"
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

extension MemberTypeIdentifierSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeBaseType": unexpectedBeforeBaseType.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "baseType": Syntax(baseType).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenBaseTypeAndPeriod": unexpectedBetweenBaseTypeAndPeriod.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "period": Syntax(period).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenPeriodAndName": unexpectedBetweenPeriodAndName.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "name": Syntax(name).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenNameAndGenericArgumentClause": unexpectedBetweenNameAndGenericArgumentClause.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "genericArgumentClause": genericArgumentClause.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedAfterGenericArgumentClause": unexpectedAfterGenericArgumentClause.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - ClassRestrictionTypeSyntax

public struct ClassRestrictionTypeSyntax: TypeSyntaxProtocol, SyntaxHashable {
  public let _syntaxNode: Syntax

  public init?<S: SyntaxProtocol>(_ node: S) {
    guard node.raw.kind == .classRestrictionType else { return nil }
    self._syntaxNode = node._syntaxNode
  }

  /// Creates a `ClassRestrictionTypeSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .classRestrictionType)
    self._syntaxNode = Syntax(data)
  }

  public init(
    leadingTrivia: Trivia? = nil,
    _ unexpectedBeforeClassKeyword: UnexpectedNodesSyntax? = nil,
    classKeyword: TokenSyntax = .keyword(.class),
    _ unexpectedAfterClassKeyword: UnexpectedNodesSyntax? = nil,
    trailingTrivia: Trivia? = nil
  ) {
    // Extend the lifetime of all parameters so their arenas don't get destroyed 
    // before they can be added as children of the new arena.
    let data: SyntaxData = withExtendedLifetime((SyntaxArena(), (unexpectedBeforeClassKeyword, classKeyword, unexpectedAfterClassKeyword))) { (arena, _) in
      let layout: [RawSyntax?] = [
        unexpectedBeforeClassKeyword?.raw,
        classKeyword.raw,
        unexpectedAfterClassKeyword?.raw,
      ]
      let raw = RawSyntax.makeLayout(
        kind: SyntaxKind.classRestrictionType, from: layout, arena: arena,
        leadingTrivia: leadingTrivia, trailingTrivia: trailingTrivia)
      return SyntaxData.forRoot(raw)
    }
    self.init(data)
  }

  public var unexpectedBeforeClassKeyword: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 0, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = ClassRestrictionTypeSyntax(data.replacingChild(at: 0, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var classKeyword: TokenSyntax {
    get {
      return TokenSyntax(data.child(at: 1, parent: Syntax(self))!)
    }
    set(value) {
      self = ClassRestrictionTypeSyntax(data.replacingChild(at: 1, with: value.raw, arena: SyntaxArena()))
    }
  }

  public var unexpectedAfterClassKeyword: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 2, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = ClassRestrictionTypeSyntax(data.replacingChild(at: 2, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public static var structure: SyntaxNodeStructure {
    return .layout([
      \Self.unexpectedBeforeClassKeyword,
      \Self.classKeyword,
      \Self.unexpectedAfterClassKeyword,
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

extension ClassRestrictionTypeSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeClassKeyword": unexpectedBeforeClassKeyword.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "classKeyword": Syntax(classKeyword).asProtocol(SyntaxProtocol.self),
      "unexpectedAfterClassKeyword": unexpectedAfterClassKeyword.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - ArrayTypeSyntax

public struct ArrayTypeSyntax: TypeSyntaxProtocol, SyntaxHashable {
  public let _syntaxNode: Syntax

  public init?<S: SyntaxProtocol>(_ node: S) {
    guard node.raw.kind == .arrayType else { return nil }
    self._syntaxNode = node._syntaxNode
  }

  /// Creates a `ArrayTypeSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .arrayType)
    self._syntaxNode = Syntax(data)
  }

  public init<E: TypeSyntaxProtocol>(
    leadingTrivia: Trivia? = nil,
    _ unexpectedBeforeLeftSquareBracket: UnexpectedNodesSyntax? = nil,
    leftSquareBracket: TokenSyntax = .leftSquareBracketToken(),
    _ unexpectedBetweenLeftSquareBracketAndElementType: UnexpectedNodesSyntax? = nil,
    elementType: E,
    _ unexpectedBetweenElementTypeAndRightSquareBracket: UnexpectedNodesSyntax? = nil,
    rightSquareBracket: TokenSyntax = .rightSquareBracketToken(),
    _ unexpectedAfterRightSquareBracket: UnexpectedNodesSyntax? = nil,
    trailingTrivia: Trivia? = nil
  ) {
    // Extend the lifetime of all parameters so their arenas don't get destroyed 
    // before they can be added as children of the new arena.
    let data: SyntaxData = withExtendedLifetime((SyntaxArena(), (unexpectedBeforeLeftSquareBracket, leftSquareBracket, unexpectedBetweenLeftSquareBracketAndElementType, elementType, unexpectedBetweenElementTypeAndRightSquareBracket, rightSquareBracket, unexpectedAfterRightSquareBracket))) { (arena, _) in
      let layout: [RawSyntax?] = [
        unexpectedBeforeLeftSquareBracket?.raw,
        leftSquareBracket.raw,
        unexpectedBetweenLeftSquareBracketAndElementType?.raw,
        elementType.raw,
        unexpectedBetweenElementTypeAndRightSquareBracket?.raw,
        rightSquareBracket.raw,
        unexpectedAfterRightSquareBracket?.raw,
      ]
      let raw = RawSyntax.makeLayout(
        kind: SyntaxKind.arrayType, from: layout, arena: arena,
        leadingTrivia: leadingTrivia, trailingTrivia: trailingTrivia)
      return SyntaxData.forRoot(raw)
    }
    self.init(data)
  }

  public var unexpectedBeforeLeftSquareBracket: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 0, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = ArrayTypeSyntax(data.replacingChild(at: 0, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var leftSquareBracket: TokenSyntax {
    get {
      return TokenSyntax(data.child(at: 1, parent: Syntax(self))!)
    }
    set(value) {
      self = ArrayTypeSyntax(data.replacingChild(at: 1, with: value.raw, arena: SyntaxArena()))
    }
  }

  public var unexpectedBetweenLeftSquareBracketAndElementType: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 2, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = ArrayTypeSyntax(data.replacingChild(at: 2, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var elementType: TypeSyntax {
    get {
      return TypeSyntax(data.child(at: 3, parent: Syntax(self))!)
    }
    set(value) {
      self = ArrayTypeSyntax(data.replacingChild(at: 3, with: value.raw, arena: SyntaxArena()))
    }
  }

  public var unexpectedBetweenElementTypeAndRightSquareBracket: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 4, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = ArrayTypeSyntax(data.replacingChild(at: 4, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var rightSquareBracket: TokenSyntax {
    get {
      return TokenSyntax(data.child(at: 5, parent: Syntax(self))!)
    }
    set(value) {
      self = ArrayTypeSyntax(data.replacingChild(at: 5, with: value.raw, arena: SyntaxArena()))
    }
  }

  public var unexpectedAfterRightSquareBracket: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 6, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = ArrayTypeSyntax(data.replacingChild(at: 6, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public static var structure: SyntaxNodeStructure {
    return .layout([
      \Self.unexpectedBeforeLeftSquareBracket,
      \Self.leftSquareBracket,
      \Self.unexpectedBetweenLeftSquareBracketAndElementType,
      \Self.elementType,
      \Self.unexpectedBetweenElementTypeAndRightSquareBracket,
      \Self.rightSquareBracket,
      \Self.unexpectedAfterRightSquareBracket,
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

extension ArrayTypeSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeLeftSquareBracket": unexpectedBeforeLeftSquareBracket.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "leftSquareBracket": Syntax(leftSquareBracket).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenLeftSquareBracketAndElementType": unexpectedBetweenLeftSquareBracketAndElementType.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "elementType": Syntax(elementType).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenElementTypeAndRightSquareBracket": unexpectedBetweenElementTypeAndRightSquareBracket.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "rightSquareBracket": Syntax(rightSquareBracket).asProtocol(SyntaxProtocol.self),
      "unexpectedAfterRightSquareBracket": unexpectedAfterRightSquareBracket.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - DictionaryTypeSyntax

public struct DictionaryTypeSyntax: TypeSyntaxProtocol, SyntaxHashable {
  public let _syntaxNode: Syntax

  public init?<S: SyntaxProtocol>(_ node: S) {
    guard node.raw.kind == .dictionaryType else { return nil }
    self._syntaxNode = node._syntaxNode
  }

  /// Creates a `DictionaryTypeSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .dictionaryType)
    self._syntaxNode = Syntax(data)
  }

  public init<K: TypeSyntaxProtocol, V: TypeSyntaxProtocol>(
    leadingTrivia: Trivia? = nil,
    _ unexpectedBeforeLeftSquareBracket: UnexpectedNodesSyntax? = nil,
    leftSquareBracket: TokenSyntax = .leftSquareBracketToken(),
    _ unexpectedBetweenLeftSquareBracketAndKeyType: UnexpectedNodesSyntax? = nil,
    keyType: K,
    _ unexpectedBetweenKeyTypeAndColon: UnexpectedNodesSyntax? = nil,
    colon: TokenSyntax = .colonToken(),
    _ unexpectedBetweenColonAndValueType: UnexpectedNodesSyntax? = nil,
    valueType: V,
    _ unexpectedBetweenValueTypeAndRightSquareBracket: UnexpectedNodesSyntax? = nil,
    rightSquareBracket: TokenSyntax = .rightSquareBracketToken(),
    _ unexpectedAfterRightSquareBracket: UnexpectedNodesSyntax? = nil,
    trailingTrivia: Trivia? = nil
  ) {
    // Extend the lifetime of all parameters so their arenas don't get destroyed 
    // before they can be added as children of the new arena.
    let data: SyntaxData = withExtendedLifetime((SyntaxArena(), (unexpectedBeforeLeftSquareBracket, leftSquareBracket, unexpectedBetweenLeftSquareBracketAndKeyType, keyType, unexpectedBetweenKeyTypeAndColon, colon, unexpectedBetweenColonAndValueType, valueType, unexpectedBetweenValueTypeAndRightSquareBracket, rightSquareBracket, unexpectedAfterRightSquareBracket))) { (arena, _) in
      let layout: [RawSyntax?] = [
        unexpectedBeforeLeftSquareBracket?.raw,
        leftSquareBracket.raw,
        unexpectedBetweenLeftSquareBracketAndKeyType?.raw,
        keyType.raw,
        unexpectedBetweenKeyTypeAndColon?.raw,
        colon.raw,
        unexpectedBetweenColonAndValueType?.raw,
        valueType.raw,
        unexpectedBetweenValueTypeAndRightSquareBracket?.raw,
        rightSquareBracket.raw,
        unexpectedAfterRightSquareBracket?.raw,
      ]
      let raw = RawSyntax.makeLayout(
        kind: SyntaxKind.dictionaryType, from: layout, arena: arena,
        leadingTrivia: leadingTrivia, trailingTrivia: trailingTrivia)
      return SyntaxData.forRoot(raw)
    }
    self.init(data)
  }

  public var unexpectedBeforeLeftSquareBracket: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 0, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = DictionaryTypeSyntax(data.replacingChild(at: 0, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var leftSquareBracket: TokenSyntax {
    get {
      return TokenSyntax(data.child(at: 1, parent: Syntax(self))!)
    }
    set(value) {
      self = DictionaryTypeSyntax(data.replacingChild(at: 1, with: value.raw, arena: SyntaxArena()))
    }
  }

  public var unexpectedBetweenLeftSquareBracketAndKeyType: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 2, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = DictionaryTypeSyntax(data.replacingChild(at: 2, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var keyType: TypeSyntax {
    get {
      return TypeSyntax(data.child(at: 3, parent: Syntax(self))!)
    }
    set(value) {
      self = DictionaryTypeSyntax(data.replacingChild(at: 3, with: value.raw, arena: SyntaxArena()))
    }
  }

  public var unexpectedBetweenKeyTypeAndColon: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 4, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = DictionaryTypeSyntax(data.replacingChild(at: 4, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var colon: TokenSyntax {
    get {
      return TokenSyntax(data.child(at: 5, parent: Syntax(self))!)
    }
    set(value) {
      self = DictionaryTypeSyntax(data.replacingChild(at: 5, with: value.raw, arena: SyntaxArena()))
    }
  }

  public var unexpectedBetweenColonAndValueType: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 6, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = DictionaryTypeSyntax(data.replacingChild(at: 6, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var valueType: TypeSyntax {
    get {
      return TypeSyntax(data.child(at: 7, parent: Syntax(self))!)
    }
    set(value) {
      self = DictionaryTypeSyntax(data.replacingChild(at: 7, with: value.raw, arena: SyntaxArena()))
    }
  }

  public var unexpectedBetweenValueTypeAndRightSquareBracket: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 8, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = DictionaryTypeSyntax(data.replacingChild(at: 8, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var rightSquareBracket: TokenSyntax {
    get {
      return TokenSyntax(data.child(at: 9, parent: Syntax(self))!)
    }
    set(value) {
      self = DictionaryTypeSyntax(data.replacingChild(at: 9, with: value.raw, arena: SyntaxArena()))
    }
  }

  public var unexpectedAfterRightSquareBracket: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 10, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = DictionaryTypeSyntax(data.replacingChild(at: 10, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public static var structure: SyntaxNodeStructure {
    return .layout([
      \Self.unexpectedBeforeLeftSquareBracket,
      \Self.leftSquareBracket,
      \Self.unexpectedBetweenLeftSquareBracketAndKeyType,
      \Self.keyType,
      \Self.unexpectedBetweenKeyTypeAndColon,
      \Self.colon,
      \Self.unexpectedBetweenColonAndValueType,
      \Self.valueType,
      \Self.unexpectedBetweenValueTypeAndRightSquareBracket,
      \Self.rightSquareBracket,
      \Self.unexpectedAfterRightSquareBracket,
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
      return "key type"
    case 4:
      return nil
    case 5:
      return nil
    case 6:
      return nil
    case 7:
      return "value type"
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

extension DictionaryTypeSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeLeftSquareBracket": unexpectedBeforeLeftSquareBracket.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "leftSquareBracket": Syntax(leftSquareBracket).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenLeftSquareBracketAndKeyType": unexpectedBetweenLeftSquareBracketAndKeyType.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "keyType": Syntax(keyType).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenKeyTypeAndColon": unexpectedBetweenKeyTypeAndColon.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "colon": Syntax(colon).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenColonAndValueType": unexpectedBetweenColonAndValueType.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "valueType": Syntax(valueType).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenValueTypeAndRightSquareBracket": unexpectedBetweenValueTypeAndRightSquareBracket.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "rightSquareBracket": Syntax(rightSquareBracket).asProtocol(SyntaxProtocol.self),
      "unexpectedAfterRightSquareBracket": unexpectedAfterRightSquareBracket.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - MetatypeTypeSyntax

public struct MetatypeTypeSyntax: TypeSyntaxProtocol, SyntaxHashable {
  public let _syntaxNode: Syntax

  public init?<S: SyntaxProtocol>(_ node: S) {
    guard node.raw.kind == .metatypeType else { return nil }
    self._syntaxNode = node._syntaxNode
  }

  /// Creates a `MetatypeTypeSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .metatypeType)
    self._syntaxNode = Syntax(data)
  }

  public init<B: TypeSyntaxProtocol>(
    leadingTrivia: Trivia? = nil,
    _ unexpectedBeforeBaseType: UnexpectedNodesSyntax? = nil,
    baseType: B,
    _ unexpectedBetweenBaseTypeAndPeriod: UnexpectedNodesSyntax? = nil,
    period: TokenSyntax = .periodToken(),
    _ unexpectedBetweenPeriodAndTypeOrProtocol: UnexpectedNodesSyntax? = nil,
    typeOrProtocol: TokenSyntax,
    _ unexpectedAfterTypeOrProtocol: UnexpectedNodesSyntax? = nil,
    trailingTrivia: Trivia? = nil
  ) {
    // Extend the lifetime of all parameters so their arenas don't get destroyed 
    // before they can be added as children of the new arena.
    let data: SyntaxData = withExtendedLifetime((SyntaxArena(), (unexpectedBeforeBaseType, baseType, unexpectedBetweenBaseTypeAndPeriod, period, unexpectedBetweenPeriodAndTypeOrProtocol, typeOrProtocol, unexpectedAfterTypeOrProtocol))) { (arena, _) in
      let layout: [RawSyntax?] = [
        unexpectedBeforeBaseType?.raw,
        baseType.raw,
        unexpectedBetweenBaseTypeAndPeriod?.raw,
        period.raw,
        unexpectedBetweenPeriodAndTypeOrProtocol?.raw,
        typeOrProtocol.raw,
        unexpectedAfterTypeOrProtocol?.raw,
      ]
      let raw = RawSyntax.makeLayout(
        kind: SyntaxKind.metatypeType, from: layout, arena: arena,
        leadingTrivia: leadingTrivia, trailingTrivia: trailingTrivia)
      return SyntaxData.forRoot(raw)
    }
    self.init(data)
  }

  public var unexpectedBeforeBaseType: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 0, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = MetatypeTypeSyntax(data.replacingChild(at: 0, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var baseType: TypeSyntax {
    get {
      return TypeSyntax(data.child(at: 1, parent: Syntax(self))!)
    }
    set(value) {
      self = MetatypeTypeSyntax(data.replacingChild(at: 1, with: value.raw, arena: SyntaxArena()))
    }
  }

  public var unexpectedBetweenBaseTypeAndPeriod: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 2, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = MetatypeTypeSyntax(data.replacingChild(at: 2, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var period: TokenSyntax {
    get {
      return TokenSyntax(data.child(at: 3, parent: Syntax(self))!)
    }
    set(value) {
      self = MetatypeTypeSyntax(data.replacingChild(at: 3, with: value.raw, arena: SyntaxArena()))
    }
  }

  public var unexpectedBetweenPeriodAndTypeOrProtocol: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 4, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = MetatypeTypeSyntax(data.replacingChild(at: 4, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var typeOrProtocol: TokenSyntax {
    get {
      return TokenSyntax(data.child(at: 5, parent: Syntax(self))!)
    }
    set(value) {
      self = MetatypeTypeSyntax(data.replacingChild(at: 5, with: value.raw, arena: SyntaxArena()))
    }
  }

  public var unexpectedAfterTypeOrProtocol: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 6, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = MetatypeTypeSyntax(data.replacingChild(at: 6, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public static var structure: SyntaxNodeStructure {
    return .layout([
      \Self.unexpectedBeforeBaseType,
      \Self.baseType,
      \Self.unexpectedBetweenBaseTypeAndPeriod,
      \Self.period,
      \Self.unexpectedBetweenPeriodAndTypeOrProtocol,
      \Self.typeOrProtocol,
      \Self.unexpectedAfterTypeOrProtocol,
    ])
  }

  public func childNameForDiagnostics(_ index: SyntaxChildrenIndex) -> String? {
    switch index.data?.indexInParent {
    case 0:
      return nil
    case 1:
      return "base type"
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

extension MetatypeTypeSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeBaseType": unexpectedBeforeBaseType.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "baseType": Syntax(baseType).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenBaseTypeAndPeriod": unexpectedBetweenBaseTypeAndPeriod.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "period": Syntax(period).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenPeriodAndTypeOrProtocol": unexpectedBetweenPeriodAndTypeOrProtocol.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "typeOrProtocol": Syntax(typeOrProtocol).asProtocol(SyntaxProtocol.self),
      "unexpectedAfterTypeOrProtocol": unexpectedAfterTypeOrProtocol.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - OptionalTypeSyntax

public struct OptionalTypeSyntax: TypeSyntaxProtocol, SyntaxHashable {
  public let _syntaxNode: Syntax

  public init?<S: SyntaxProtocol>(_ node: S) {
    guard node.raw.kind == .optionalType else { return nil }
    self._syntaxNode = node._syntaxNode
  }

  /// Creates a `OptionalTypeSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .optionalType)
    self._syntaxNode = Syntax(data)
  }

  public init<W: TypeSyntaxProtocol>(
    leadingTrivia: Trivia? = nil,
    _ unexpectedBeforeWrappedType: UnexpectedNodesSyntax? = nil,
    wrappedType: W,
    _ unexpectedBetweenWrappedTypeAndQuestionMark: UnexpectedNodesSyntax? = nil,
    questionMark: TokenSyntax = .postfixQuestionMarkToken(),
    _ unexpectedAfterQuestionMark: UnexpectedNodesSyntax? = nil,
    trailingTrivia: Trivia? = nil
  ) {
    // Extend the lifetime of all parameters so their arenas don't get destroyed 
    // before they can be added as children of the new arena.
    let data: SyntaxData = withExtendedLifetime((SyntaxArena(), (unexpectedBeforeWrappedType, wrappedType, unexpectedBetweenWrappedTypeAndQuestionMark, questionMark, unexpectedAfterQuestionMark))) { (arena, _) in
      let layout: [RawSyntax?] = [
        unexpectedBeforeWrappedType?.raw,
        wrappedType.raw,
        unexpectedBetweenWrappedTypeAndQuestionMark?.raw,
        questionMark.raw,
        unexpectedAfterQuestionMark?.raw,
      ]
      let raw = RawSyntax.makeLayout(
        kind: SyntaxKind.optionalType, from: layout, arena: arena,
        leadingTrivia: leadingTrivia, trailingTrivia: trailingTrivia)
      return SyntaxData.forRoot(raw)
    }
    self.init(data)
  }

  public var unexpectedBeforeWrappedType: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 0, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = OptionalTypeSyntax(data.replacingChild(at: 0, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var wrappedType: TypeSyntax {
    get {
      return TypeSyntax(data.child(at: 1, parent: Syntax(self))!)
    }
    set(value) {
      self = OptionalTypeSyntax(data.replacingChild(at: 1, with: value.raw, arena: SyntaxArena()))
    }
  }

  public var unexpectedBetweenWrappedTypeAndQuestionMark: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 2, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = OptionalTypeSyntax(data.replacingChild(at: 2, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var questionMark: TokenSyntax {
    get {
      return TokenSyntax(data.child(at: 3, parent: Syntax(self))!)
    }
    set(value) {
      self = OptionalTypeSyntax(data.replacingChild(at: 3, with: value.raw, arena: SyntaxArena()))
    }
  }

  public var unexpectedAfterQuestionMark: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 4, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = OptionalTypeSyntax(data.replacingChild(at: 4, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public static var structure: SyntaxNodeStructure {
    return .layout([
      \Self.unexpectedBeforeWrappedType,
      \Self.wrappedType,
      \Self.unexpectedBetweenWrappedTypeAndQuestionMark,
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

extension OptionalTypeSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeWrappedType": unexpectedBeforeWrappedType.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "wrappedType": Syntax(wrappedType).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenWrappedTypeAndQuestionMark": unexpectedBetweenWrappedTypeAndQuestionMark.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "questionMark": Syntax(questionMark).asProtocol(SyntaxProtocol.self),
      "unexpectedAfterQuestionMark": unexpectedAfterQuestionMark.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - ConstrainedSugarTypeSyntax

public struct ConstrainedSugarTypeSyntax: TypeSyntaxProtocol, SyntaxHashable {
  public let _syntaxNode: Syntax

  public init?<S: SyntaxProtocol>(_ node: S) {
    guard node.raw.kind == .constrainedSugarType else { return nil }
    self._syntaxNode = node._syntaxNode
  }

  /// Creates a `ConstrainedSugarTypeSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .constrainedSugarType)
    self._syntaxNode = Syntax(data)
  }

  public init<B: TypeSyntaxProtocol>(
    leadingTrivia: Trivia? = nil,
    _ unexpectedBeforeSomeOrAnySpecifier: UnexpectedNodesSyntax? = nil,
    someOrAnySpecifier: TokenSyntax,
    _ unexpectedBetweenSomeOrAnySpecifierAndBaseType: UnexpectedNodesSyntax? = nil,
    baseType: B,
    _ unexpectedAfterBaseType: UnexpectedNodesSyntax? = nil,
    trailingTrivia: Trivia? = nil
  ) {
    // Extend the lifetime of all parameters so their arenas don't get destroyed 
    // before they can be added as children of the new arena.
    let data: SyntaxData = withExtendedLifetime((SyntaxArena(), (unexpectedBeforeSomeOrAnySpecifier, someOrAnySpecifier, unexpectedBetweenSomeOrAnySpecifierAndBaseType, baseType, unexpectedAfterBaseType))) { (arena, _) in
      let layout: [RawSyntax?] = [
        unexpectedBeforeSomeOrAnySpecifier?.raw,
        someOrAnySpecifier.raw,
        unexpectedBetweenSomeOrAnySpecifierAndBaseType?.raw,
        baseType.raw,
        unexpectedAfterBaseType?.raw,
      ]
      let raw = RawSyntax.makeLayout(
        kind: SyntaxKind.constrainedSugarType, from: layout, arena: arena,
        leadingTrivia: leadingTrivia, trailingTrivia: trailingTrivia)
      return SyntaxData.forRoot(raw)
    }
    self.init(data)
  }

  public var unexpectedBeforeSomeOrAnySpecifier: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 0, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = ConstrainedSugarTypeSyntax(data.replacingChild(at: 0, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var someOrAnySpecifier: TokenSyntax {
    get {
      return TokenSyntax(data.child(at: 1, parent: Syntax(self))!)
    }
    set(value) {
      self = ConstrainedSugarTypeSyntax(data.replacingChild(at: 1, with: value.raw, arena: SyntaxArena()))
    }
  }

  public var unexpectedBetweenSomeOrAnySpecifierAndBaseType: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 2, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = ConstrainedSugarTypeSyntax(data.replacingChild(at: 2, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var baseType: TypeSyntax {
    get {
      return TypeSyntax(data.child(at: 3, parent: Syntax(self))!)
    }
    set(value) {
      self = ConstrainedSugarTypeSyntax(data.replacingChild(at: 3, with: value.raw, arena: SyntaxArena()))
    }
  }

  public var unexpectedAfterBaseType: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 4, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = ConstrainedSugarTypeSyntax(data.replacingChild(at: 4, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public static var structure: SyntaxNodeStructure {
    return .layout([
      \Self.unexpectedBeforeSomeOrAnySpecifier,
      \Self.someOrAnySpecifier,
      \Self.unexpectedBetweenSomeOrAnySpecifierAndBaseType,
      \Self.baseType,
      \Self.unexpectedAfterBaseType,
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

extension ConstrainedSugarTypeSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeSomeOrAnySpecifier": unexpectedBeforeSomeOrAnySpecifier.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "someOrAnySpecifier": Syntax(someOrAnySpecifier).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenSomeOrAnySpecifierAndBaseType": unexpectedBetweenSomeOrAnySpecifierAndBaseType.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "baseType": Syntax(baseType).asProtocol(SyntaxProtocol.self),
      "unexpectedAfterBaseType": unexpectedAfterBaseType.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - ImplicitlyUnwrappedOptionalTypeSyntax

public struct ImplicitlyUnwrappedOptionalTypeSyntax: TypeSyntaxProtocol, SyntaxHashable {
  public let _syntaxNode: Syntax

  public init?<S: SyntaxProtocol>(_ node: S) {
    guard node.raw.kind == .implicitlyUnwrappedOptionalType else { return nil }
    self._syntaxNode = node._syntaxNode
  }

  /// Creates a `ImplicitlyUnwrappedOptionalTypeSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .implicitlyUnwrappedOptionalType)
    self._syntaxNode = Syntax(data)
  }

  public init<W: TypeSyntaxProtocol>(
    leadingTrivia: Trivia? = nil,
    _ unexpectedBeforeWrappedType: UnexpectedNodesSyntax? = nil,
    wrappedType: W,
    _ unexpectedBetweenWrappedTypeAndExclamationMark: UnexpectedNodesSyntax? = nil,
    exclamationMark: TokenSyntax = .exclamationMarkToken(),
    _ unexpectedAfterExclamationMark: UnexpectedNodesSyntax? = nil,
    trailingTrivia: Trivia? = nil
  ) {
    // Extend the lifetime of all parameters so their arenas don't get destroyed 
    // before they can be added as children of the new arena.
    let data: SyntaxData = withExtendedLifetime((SyntaxArena(), (unexpectedBeforeWrappedType, wrappedType, unexpectedBetweenWrappedTypeAndExclamationMark, exclamationMark, unexpectedAfterExclamationMark))) { (arena, _) in
      let layout: [RawSyntax?] = [
        unexpectedBeforeWrappedType?.raw,
        wrappedType.raw,
        unexpectedBetweenWrappedTypeAndExclamationMark?.raw,
        exclamationMark.raw,
        unexpectedAfterExclamationMark?.raw,
      ]
      let raw = RawSyntax.makeLayout(
        kind: SyntaxKind.implicitlyUnwrappedOptionalType, from: layout, arena: arena,
        leadingTrivia: leadingTrivia, trailingTrivia: trailingTrivia)
      return SyntaxData.forRoot(raw)
    }
    self.init(data)
  }

  public var unexpectedBeforeWrappedType: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 0, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = ImplicitlyUnwrappedOptionalTypeSyntax(data.replacingChild(at: 0, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var wrappedType: TypeSyntax {
    get {
      return TypeSyntax(data.child(at: 1, parent: Syntax(self))!)
    }
    set(value) {
      self = ImplicitlyUnwrappedOptionalTypeSyntax(data.replacingChild(at: 1, with: value.raw, arena: SyntaxArena()))
    }
  }

  public var unexpectedBetweenWrappedTypeAndExclamationMark: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 2, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = ImplicitlyUnwrappedOptionalTypeSyntax(data.replacingChild(at: 2, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var exclamationMark: TokenSyntax {
    get {
      return TokenSyntax(data.child(at: 3, parent: Syntax(self))!)
    }
    set(value) {
      self = ImplicitlyUnwrappedOptionalTypeSyntax(data.replacingChild(at: 3, with: value.raw, arena: SyntaxArena()))
    }
  }

  public var unexpectedAfterExclamationMark: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 4, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = ImplicitlyUnwrappedOptionalTypeSyntax(data.replacingChild(at: 4, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public static var structure: SyntaxNodeStructure {
    return .layout([
      \Self.unexpectedBeforeWrappedType,
      \Self.wrappedType,
      \Self.unexpectedBetweenWrappedTypeAndExclamationMark,
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

extension ImplicitlyUnwrappedOptionalTypeSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeWrappedType": unexpectedBeforeWrappedType.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "wrappedType": Syntax(wrappedType).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenWrappedTypeAndExclamationMark": unexpectedBetweenWrappedTypeAndExclamationMark.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "exclamationMark": Syntax(exclamationMark).asProtocol(SyntaxProtocol.self),
      "unexpectedAfterExclamationMark": unexpectedAfterExclamationMark.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - CompositionTypeSyntax

public struct CompositionTypeSyntax: TypeSyntaxProtocol, SyntaxHashable {
  public let _syntaxNode: Syntax

  public init?<S: SyntaxProtocol>(_ node: S) {
    guard node.raw.kind == .compositionType else { return nil }
    self._syntaxNode = node._syntaxNode
  }

  /// Creates a `CompositionTypeSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .compositionType)
    self._syntaxNode = Syntax(data)
  }

  public init(
    leadingTrivia: Trivia? = nil,
    _ unexpectedBeforeElements: UnexpectedNodesSyntax? = nil,
    elements: CompositionTypeElementListSyntax,
    _ unexpectedAfterElements: UnexpectedNodesSyntax? = nil,
    trailingTrivia: Trivia? = nil
  ) {
    // Extend the lifetime of all parameters so their arenas don't get destroyed 
    // before they can be added as children of the new arena.
    let data: SyntaxData = withExtendedLifetime((SyntaxArena(), (unexpectedBeforeElements, elements, unexpectedAfterElements))) { (arena, _) in
      let layout: [RawSyntax?] = [
        unexpectedBeforeElements?.raw,
        elements.raw,
        unexpectedAfterElements?.raw,
      ]
      let raw = RawSyntax.makeLayout(
        kind: SyntaxKind.compositionType, from: layout, arena: arena,
        leadingTrivia: leadingTrivia, trailingTrivia: trailingTrivia)
      return SyntaxData.forRoot(raw)
    }
    self.init(data)
  }

  public var unexpectedBeforeElements: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 0, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = CompositionTypeSyntax(data.replacingChild(at: 0, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var elements: CompositionTypeElementListSyntax {
    get {
      return CompositionTypeElementListSyntax(data.child(at: 1, parent: Syntax(self))!)
    }
    set(value) {
      self = CompositionTypeSyntax(data.replacingChild(at: 1, with: value.raw, arena: SyntaxArena()))
    }
  }

  /// Adds the provided `Element` to the node's `elements`
  /// collection.
  /// - param element: The new `Element` to add to the node's
  ///                  `elements` collection.
  /// - returns: A copy of the receiver with the provided `Element`
  ///            appended to its `elements` collection.
  public func addElement(_ element: CompositionTypeElementSyntax) -> CompositionTypeSyntax {
    var collection: RawSyntax
    let arena = SyntaxArena()
    if let col = raw.layoutView!.children[1] {
      collection = col.layoutView!.appending(element.raw, arena: arena)
    } else {
      collection = RawSyntax.makeLayout(kind: SyntaxKind.compositionTypeElementList,
        from: [element.raw], arena: arena)
    }
    let newData = data.replacingChild(at: 1, with: collection, arena: arena)
    return CompositionTypeSyntax(newData)
  }

  public var unexpectedAfterElements: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 2, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = CompositionTypeSyntax(data.replacingChild(at: 2, with: value?.raw, arena: SyntaxArena()))
    }
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

extension CompositionTypeSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeElements": unexpectedBeforeElements.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "elements": Syntax(elements).asProtocol(SyntaxProtocol.self),
      "unexpectedAfterElements": unexpectedAfterElements.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - PackExpansionTypeSyntax

public struct PackExpansionTypeSyntax: TypeSyntaxProtocol, SyntaxHashable {
  public let _syntaxNode: Syntax

  public init?<S: SyntaxProtocol>(_ node: S) {
    guard node.raw.kind == .packExpansionType else { return nil }
    self._syntaxNode = node._syntaxNode
  }

  /// Creates a `PackExpansionTypeSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .packExpansionType)
    self._syntaxNode = Syntax(data)
  }

  public init<P: TypeSyntaxProtocol>(
    leadingTrivia: Trivia? = nil,
    _ unexpectedBeforeRepeatKeyword: UnexpectedNodesSyntax? = nil,
    repeatKeyword: TokenSyntax = .keyword(.repeat),
    _ unexpectedBetweenRepeatKeywordAndPatternType: UnexpectedNodesSyntax? = nil,
    patternType: P,
    _ unexpectedAfterPatternType: UnexpectedNodesSyntax? = nil,
    trailingTrivia: Trivia? = nil
  ) {
    // Extend the lifetime of all parameters so their arenas don't get destroyed 
    // before they can be added as children of the new arena.
    let data: SyntaxData = withExtendedLifetime((SyntaxArena(), (unexpectedBeforeRepeatKeyword, repeatKeyword, unexpectedBetweenRepeatKeywordAndPatternType, patternType, unexpectedAfterPatternType))) { (arena, _) in
      let layout: [RawSyntax?] = [
        unexpectedBeforeRepeatKeyword?.raw,
        repeatKeyword.raw,
        unexpectedBetweenRepeatKeywordAndPatternType?.raw,
        patternType.raw,
        unexpectedAfterPatternType?.raw,
      ]
      let raw = RawSyntax.makeLayout(
        kind: SyntaxKind.packExpansionType, from: layout, arena: arena,
        leadingTrivia: leadingTrivia, trailingTrivia: trailingTrivia)
      return SyntaxData.forRoot(raw)
    }
    self.init(data)
  }

  public var unexpectedBeforeRepeatKeyword: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 0, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = PackExpansionTypeSyntax(data.replacingChild(at: 0, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var repeatKeyword: TokenSyntax {
    get {
      return TokenSyntax(data.child(at: 1, parent: Syntax(self))!)
    }
    set(value) {
      self = PackExpansionTypeSyntax(data.replacingChild(at: 1, with: value.raw, arena: SyntaxArena()))
    }
  }

  public var unexpectedBetweenRepeatKeywordAndPatternType: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 2, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = PackExpansionTypeSyntax(data.replacingChild(at: 2, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var patternType: TypeSyntax {
    get {
      return TypeSyntax(data.child(at: 3, parent: Syntax(self))!)
    }
    set(value) {
      self = PackExpansionTypeSyntax(data.replacingChild(at: 3, with: value.raw, arena: SyntaxArena()))
    }
  }

  public var unexpectedAfterPatternType: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 4, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = PackExpansionTypeSyntax(data.replacingChild(at: 4, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public static var structure: SyntaxNodeStructure {
    return .layout([
      \Self.unexpectedBeforeRepeatKeyword,
      \Self.repeatKeyword,
      \Self.unexpectedBetweenRepeatKeywordAndPatternType,
      \Self.patternType,
      \Self.unexpectedAfterPatternType,
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

extension PackExpansionTypeSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeRepeatKeyword": unexpectedBeforeRepeatKeyword.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "repeatKeyword": Syntax(repeatKeyword).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenRepeatKeywordAndPatternType": unexpectedBetweenRepeatKeywordAndPatternType.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "patternType": Syntax(patternType).asProtocol(SyntaxProtocol.self),
      "unexpectedAfterPatternType": unexpectedAfterPatternType.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - PackReferenceTypeSyntax

public struct PackReferenceTypeSyntax: TypeSyntaxProtocol, SyntaxHashable {
  public let _syntaxNode: Syntax

  public init?<S: SyntaxProtocol>(_ node: S) {
    guard node.raw.kind == .packReferenceType else { return nil }
    self._syntaxNode = node._syntaxNode
  }

  /// Creates a `PackReferenceTypeSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .packReferenceType)
    self._syntaxNode = Syntax(data)
  }

  public init<P: TypeSyntaxProtocol>(
    leadingTrivia: Trivia? = nil,
    _ unexpectedBeforeEachKeyword: UnexpectedNodesSyntax? = nil,
    eachKeyword: TokenSyntax,
    _ unexpectedBetweenEachKeywordAndPackType: UnexpectedNodesSyntax? = nil,
    packType: P,
    _ unexpectedAfterPackType: UnexpectedNodesSyntax? = nil,
    trailingTrivia: Trivia? = nil
  ) {
    // Extend the lifetime of all parameters so their arenas don't get destroyed 
    // before they can be added as children of the new arena.
    let data: SyntaxData = withExtendedLifetime((SyntaxArena(), (unexpectedBeforeEachKeyword, eachKeyword, unexpectedBetweenEachKeywordAndPackType, packType, unexpectedAfterPackType))) { (arena, _) in
      let layout: [RawSyntax?] = [
        unexpectedBeforeEachKeyword?.raw,
        eachKeyword.raw,
        unexpectedBetweenEachKeywordAndPackType?.raw,
        packType.raw,
        unexpectedAfterPackType?.raw,
      ]
      let raw = RawSyntax.makeLayout(
        kind: SyntaxKind.packReferenceType, from: layout, arena: arena,
        leadingTrivia: leadingTrivia, trailingTrivia: trailingTrivia)
      return SyntaxData.forRoot(raw)
    }
    self.init(data)
  }

  public var unexpectedBeforeEachKeyword: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 0, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = PackReferenceTypeSyntax(data.replacingChild(at: 0, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var eachKeyword: TokenSyntax {
    get {
      return TokenSyntax(data.child(at: 1, parent: Syntax(self))!)
    }
    set(value) {
      self = PackReferenceTypeSyntax(data.replacingChild(at: 1, with: value.raw, arena: SyntaxArena()))
    }
  }

  public var unexpectedBetweenEachKeywordAndPackType: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 2, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = PackReferenceTypeSyntax(data.replacingChild(at: 2, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var packType: TypeSyntax {
    get {
      return TypeSyntax(data.child(at: 3, parent: Syntax(self))!)
    }
    set(value) {
      self = PackReferenceTypeSyntax(data.replacingChild(at: 3, with: value.raw, arena: SyntaxArena()))
    }
  }

  public var unexpectedAfterPackType: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 4, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = PackReferenceTypeSyntax(data.replacingChild(at: 4, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public static var structure: SyntaxNodeStructure {
    return .layout([
      \Self.unexpectedBeforeEachKeyword,
      \Self.eachKeyword,
      \Self.unexpectedBetweenEachKeywordAndPackType,
      \Self.packType,
      \Self.unexpectedAfterPackType,
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

extension PackReferenceTypeSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeEachKeyword": unexpectedBeforeEachKeyword.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "eachKeyword": Syntax(eachKeyword).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenEachKeywordAndPackType": unexpectedBetweenEachKeywordAndPackType.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "packType": Syntax(packType).asProtocol(SyntaxProtocol.self),
      "unexpectedAfterPackType": unexpectedAfterPackType.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - TupleTypeSyntax

public struct TupleTypeSyntax: TypeSyntaxProtocol, SyntaxHashable {
  public let _syntaxNode: Syntax

  public init?<S: SyntaxProtocol>(_ node: S) {
    guard node.raw.kind == .tupleType else { return nil }
    self._syntaxNode = node._syntaxNode
  }

  /// Creates a `TupleTypeSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .tupleType)
    self._syntaxNode = Syntax(data)
  }

  public init(
    leadingTrivia: Trivia? = nil,
    _ unexpectedBeforeLeftParen: UnexpectedNodesSyntax? = nil,
    leftParen: TokenSyntax = .leftParenToken(),
    _ unexpectedBetweenLeftParenAndElements: UnexpectedNodesSyntax? = nil,
    elements: TupleTypeElementListSyntax,
    _ unexpectedBetweenElementsAndRightParen: UnexpectedNodesSyntax? = nil,
    rightParen: TokenSyntax = .rightParenToken(),
    _ unexpectedAfterRightParen: UnexpectedNodesSyntax? = nil,
    trailingTrivia: Trivia? = nil
  ) {
    // Extend the lifetime of all parameters so their arenas don't get destroyed 
    // before they can be added as children of the new arena.
    let data: SyntaxData = withExtendedLifetime((SyntaxArena(), (unexpectedBeforeLeftParen, leftParen, unexpectedBetweenLeftParenAndElements, elements, unexpectedBetweenElementsAndRightParen, rightParen, unexpectedAfterRightParen))) { (arena, _) in
      let layout: [RawSyntax?] = [
        unexpectedBeforeLeftParen?.raw,
        leftParen.raw,
        unexpectedBetweenLeftParenAndElements?.raw,
        elements.raw,
        unexpectedBetweenElementsAndRightParen?.raw,
        rightParen.raw,
        unexpectedAfterRightParen?.raw,
      ]
      let raw = RawSyntax.makeLayout(
        kind: SyntaxKind.tupleType, from: layout, arena: arena,
        leadingTrivia: leadingTrivia, trailingTrivia: trailingTrivia)
      return SyntaxData.forRoot(raw)
    }
    self.init(data)
  }

  public var unexpectedBeforeLeftParen: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 0, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = TupleTypeSyntax(data.replacingChild(at: 0, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var leftParen: TokenSyntax {
    get {
      return TokenSyntax(data.child(at: 1, parent: Syntax(self))!)
    }
    set(value) {
      self = TupleTypeSyntax(data.replacingChild(at: 1, with: value.raw, arena: SyntaxArena()))
    }
  }

  public var unexpectedBetweenLeftParenAndElements: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 2, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = TupleTypeSyntax(data.replacingChild(at: 2, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var elements: TupleTypeElementListSyntax {
    get {
      return TupleTypeElementListSyntax(data.child(at: 3, parent: Syntax(self))!)
    }
    set(value) {
      self = TupleTypeSyntax(data.replacingChild(at: 3, with: value.raw, arena: SyntaxArena()))
    }
  }

  /// Adds the provided `Element` to the node's `elements`
  /// collection.
  /// - param element: The new `Element` to add to the node's
  ///                  `elements` collection.
  /// - returns: A copy of the receiver with the provided `Element`
  ///            appended to its `elements` collection.
  public func addElement(_ element: TupleTypeElementSyntax) -> TupleTypeSyntax {
    var collection: RawSyntax
    let arena = SyntaxArena()
    if let col = raw.layoutView!.children[3] {
      collection = col.layoutView!.appending(element.raw, arena: arena)
    } else {
      collection = RawSyntax.makeLayout(kind: SyntaxKind.tupleTypeElementList,
        from: [element.raw], arena: arena)
    }
    let newData = data.replacingChild(at: 3, with: collection, arena: arena)
    return TupleTypeSyntax(newData)
  }

  public var unexpectedBetweenElementsAndRightParen: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 4, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = TupleTypeSyntax(data.replacingChild(at: 4, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var rightParen: TokenSyntax {
    get {
      return TokenSyntax(data.child(at: 5, parent: Syntax(self))!)
    }
    set(value) {
      self = TupleTypeSyntax(data.replacingChild(at: 5, with: value.raw, arena: SyntaxArena()))
    }
  }

  public var unexpectedAfterRightParen: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 6, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = TupleTypeSyntax(data.replacingChild(at: 6, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public static var structure: SyntaxNodeStructure {
    return .layout([
      \Self.unexpectedBeforeLeftParen,
      \Self.leftParen,
      \Self.unexpectedBetweenLeftParenAndElements,
      \Self.elements,
      \Self.unexpectedBetweenElementsAndRightParen,
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

extension TupleTypeSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeLeftParen": unexpectedBeforeLeftParen.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "leftParen": Syntax(leftParen).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenLeftParenAndElements": unexpectedBetweenLeftParenAndElements.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "elements": Syntax(elements).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenElementsAndRightParen": unexpectedBetweenElementsAndRightParen.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "rightParen": Syntax(rightParen).asProtocol(SyntaxProtocol.self),
      "unexpectedAfterRightParen": unexpectedAfterRightParen.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - FunctionTypeSyntax

public struct FunctionTypeSyntax: TypeSyntaxProtocol, SyntaxHashable {
  public let _syntaxNode: Syntax

  public init?<S: SyntaxProtocol>(_ node: S) {
    guard node.raw.kind == .functionType else { return nil }
    self._syntaxNode = node._syntaxNode
  }

  /// Creates a `FunctionTypeSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .functionType)
    self._syntaxNode = Syntax(data)
  }

  public init(
    leadingTrivia: Trivia? = nil,
    _ unexpectedBeforeLeftParen: UnexpectedNodesSyntax? = nil,
    leftParen: TokenSyntax = .leftParenToken(),
    _ unexpectedBetweenLeftParenAndArguments: UnexpectedNodesSyntax? = nil,
    arguments: TupleTypeElementListSyntax,
    _ unexpectedBetweenArgumentsAndRightParen: UnexpectedNodesSyntax? = nil,
    rightParen: TokenSyntax = .rightParenToken(),
    _ unexpectedBetweenRightParenAndEffectSpecifiers: UnexpectedNodesSyntax? = nil,
    effectSpecifiers: TypeEffectSpecifiersSyntax? = nil,
    _ unexpectedBetweenEffectSpecifiersAndOutput: UnexpectedNodesSyntax? = nil,
    output: ReturnClauseSyntax,
    _ unexpectedAfterOutput: UnexpectedNodesSyntax? = nil,
    trailingTrivia: Trivia? = nil
  ) {
    // Extend the lifetime of all parameters so their arenas don't get destroyed 
    // before they can be added as children of the new arena.
    let data: SyntaxData = withExtendedLifetime((SyntaxArena(), (unexpectedBeforeLeftParen, leftParen, unexpectedBetweenLeftParenAndArguments, arguments, unexpectedBetweenArgumentsAndRightParen, rightParen, unexpectedBetweenRightParenAndEffectSpecifiers, effectSpecifiers, unexpectedBetweenEffectSpecifiersAndOutput, output, unexpectedAfterOutput))) { (arena, _) in
      let layout: [RawSyntax?] = [
        unexpectedBeforeLeftParen?.raw,
        leftParen.raw,
        unexpectedBetweenLeftParenAndArguments?.raw,
        arguments.raw,
        unexpectedBetweenArgumentsAndRightParen?.raw,
        rightParen.raw,
        unexpectedBetweenRightParenAndEffectSpecifiers?.raw,
        effectSpecifiers?.raw,
        unexpectedBetweenEffectSpecifiersAndOutput?.raw,
        output.raw,
        unexpectedAfterOutput?.raw,
      ]
      let raw = RawSyntax.makeLayout(
        kind: SyntaxKind.functionType, from: layout, arena: arena,
        leadingTrivia: leadingTrivia, trailingTrivia: trailingTrivia)
      return SyntaxData.forRoot(raw)
    }
    self.init(data)
  }

  public var unexpectedBeforeLeftParen: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 0, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = FunctionTypeSyntax(data.replacingChild(at: 0, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var leftParen: TokenSyntax {
    get {
      return TokenSyntax(data.child(at: 1, parent: Syntax(self))!)
    }
    set(value) {
      self = FunctionTypeSyntax(data.replacingChild(at: 1, with: value.raw, arena: SyntaxArena()))
    }
  }

  public var unexpectedBetweenLeftParenAndArguments: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 2, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = FunctionTypeSyntax(data.replacingChild(at: 2, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var arguments: TupleTypeElementListSyntax {
    get {
      return TupleTypeElementListSyntax(data.child(at: 3, parent: Syntax(self))!)
    }
    set(value) {
      self = FunctionTypeSyntax(data.replacingChild(at: 3, with: value.raw, arena: SyntaxArena()))
    }
  }

  /// Adds the provided `Argument` to the node's `arguments`
  /// collection.
  /// - param element: The new `Argument` to add to the node's
  ///                  `arguments` collection.
  /// - returns: A copy of the receiver with the provided `Argument`
  ///            appended to its `arguments` collection.
  public func addArgument(_ element: TupleTypeElementSyntax) -> FunctionTypeSyntax {
    var collection: RawSyntax
    let arena = SyntaxArena()
    if let col = raw.layoutView!.children[3] {
      collection = col.layoutView!.appending(element.raw, arena: arena)
    } else {
      collection = RawSyntax.makeLayout(kind: SyntaxKind.tupleTypeElementList,
        from: [element.raw], arena: arena)
    }
    let newData = data.replacingChild(at: 3, with: collection, arena: arena)
    return FunctionTypeSyntax(newData)
  }

  public var unexpectedBetweenArgumentsAndRightParen: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 4, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = FunctionTypeSyntax(data.replacingChild(at: 4, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var rightParen: TokenSyntax {
    get {
      return TokenSyntax(data.child(at: 5, parent: Syntax(self))!)
    }
    set(value) {
      self = FunctionTypeSyntax(data.replacingChild(at: 5, with: value.raw, arena: SyntaxArena()))
    }
  }

  public var unexpectedBetweenRightParenAndEffectSpecifiers: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 6, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = FunctionTypeSyntax(data.replacingChild(at: 6, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var effectSpecifiers: TypeEffectSpecifiersSyntax? {
    get {
      return data.child(at: 7, parent: Syntax(self)).map(TypeEffectSpecifiersSyntax.init)
    }
    set(value) {
      self = FunctionTypeSyntax(data.replacingChild(at: 7, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var unexpectedBetweenEffectSpecifiersAndOutput: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 8, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = FunctionTypeSyntax(data.replacingChild(at: 8, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var output: ReturnClauseSyntax {
    get {
      return ReturnClauseSyntax(data.child(at: 9, parent: Syntax(self))!)
    }
    set(value) {
      self = FunctionTypeSyntax(data.replacingChild(at: 9, with: value.raw, arena: SyntaxArena()))
    }
  }

  public var unexpectedAfterOutput: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 10, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = FunctionTypeSyntax(data.replacingChild(at: 10, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public static var structure: SyntaxNodeStructure {
    return .layout([
      \Self.unexpectedBeforeLeftParen,
      \Self.leftParen,
      \Self.unexpectedBetweenLeftParenAndArguments,
      \Self.arguments,
      \Self.unexpectedBetweenArgumentsAndRightParen,
      \Self.rightParen,
      \Self.unexpectedBetweenRightParenAndEffectSpecifiers,
      \Self.effectSpecifiers,
      \Self.unexpectedBetweenEffectSpecifiersAndOutput,
      \Self.output,
      \Self.unexpectedAfterOutput,
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

extension FunctionTypeSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeLeftParen": unexpectedBeforeLeftParen.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "leftParen": Syntax(leftParen).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenLeftParenAndArguments": unexpectedBetweenLeftParenAndArguments.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "arguments": Syntax(arguments).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenArgumentsAndRightParen": unexpectedBetweenArgumentsAndRightParen.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "rightParen": Syntax(rightParen).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenRightParenAndEffectSpecifiers": unexpectedBetweenRightParenAndEffectSpecifiers.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "effectSpecifiers": effectSpecifiers.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenEffectSpecifiersAndOutput": unexpectedBetweenEffectSpecifiersAndOutput.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "output": Syntax(output).asProtocol(SyntaxProtocol.self),
      "unexpectedAfterOutput": unexpectedAfterOutput.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - AttributedTypeSyntax

public struct AttributedTypeSyntax: TypeSyntaxProtocol, SyntaxHashable {
  public let _syntaxNode: Syntax

  public init?<S: SyntaxProtocol>(_ node: S) {
    guard node.raw.kind == .attributedType else { return nil }
    self._syntaxNode = node._syntaxNode
  }

  /// Creates a `AttributedTypeSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .attributedType)
    self._syntaxNode = Syntax(data)
  }

  public init<B: TypeSyntaxProtocol>(
    leadingTrivia: Trivia? = nil,
    _ unexpectedBeforeSpecifier: UnexpectedNodesSyntax? = nil,
    specifier: TokenSyntax? = nil,
    _ unexpectedBetweenSpecifierAndAttributes: UnexpectedNodesSyntax? = nil,
    attributes: AttributeListSyntax? = nil,
    _ unexpectedBetweenAttributesAndBaseType: UnexpectedNodesSyntax? = nil,
    baseType: B,
    _ unexpectedAfterBaseType: UnexpectedNodesSyntax? = nil,
    trailingTrivia: Trivia? = nil
  ) {
    // Extend the lifetime of all parameters so their arenas don't get destroyed 
    // before they can be added as children of the new arena.
    let data: SyntaxData = withExtendedLifetime((SyntaxArena(), (unexpectedBeforeSpecifier, specifier, unexpectedBetweenSpecifierAndAttributes, attributes, unexpectedBetweenAttributesAndBaseType, baseType, unexpectedAfterBaseType))) { (arena, _) in
      let layout: [RawSyntax?] = [
        unexpectedBeforeSpecifier?.raw,
        specifier?.raw,
        unexpectedBetweenSpecifierAndAttributes?.raw,
        attributes?.raw,
        unexpectedBetweenAttributesAndBaseType?.raw,
        baseType.raw,
        unexpectedAfterBaseType?.raw,
      ]
      let raw = RawSyntax.makeLayout(
        kind: SyntaxKind.attributedType, from: layout, arena: arena,
        leadingTrivia: leadingTrivia, trailingTrivia: trailingTrivia)
      return SyntaxData.forRoot(raw)
    }
    self.init(data)
  }

  public var unexpectedBeforeSpecifier: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 0, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = AttributedTypeSyntax(data.replacingChild(at: 0, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var specifier: TokenSyntax? {
    get {
      return data.child(at: 1, parent: Syntax(self)).map(TokenSyntax.init)
    }
    set(value) {
      self = AttributedTypeSyntax(data.replacingChild(at: 1, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var unexpectedBetweenSpecifierAndAttributes: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 2, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = AttributedTypeSyntax(data.replacingChild(at: 2, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var attributes: AttributeListSyntax? {
    get {
      return data.child(at: 3, parent: Syntax(self)).map(AttributeListSyntax.init)
    }
    set(value) {
      self = AttributedTypeSyntax(data.replacingChild(at: 3, with: value?.raw, arena: SyntaxArena()))
    }
  }

  /// Adds the provided `Attribute` to the node's `attributes`
  /// collection.
  /// - param element: The new `Attribute` to add to the node's
  ///                  `attributes` collection.
  /// - returns: A copy of the receiver with the provided `Attribute`
  ///            appended to its `attributes` collection.
  public func addAttribute(_ element: Syntax) -> AttributedTypeSyntax {
    var collection: RawSyntax
    let arena = SyntaxArena()
    if let col = raw.layoutView!.children[3] {
      collection = col.layoutView!.appending(element.raw, arena: arena)
    } else {
      collection = RawSyntax.makeLayout(kind: SyntaxKind.attributeList,
        from: [element.raw], arena: arena)
    }
    let newData = data.replacingChild(at: 3, with: collection, arena: arena)
    return AttributedTypeSyntax(newData)
  }

  public var unexpectedBetweenAttributesAndBaseType: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 4, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = AttributedTypeSyntax(data.replacingChild(at: 4, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var baseType: TypeSyntax {
    get {
      return TypeSyntax(data.child(at: 5, parent: Syntax(self))!)
    }
    set(value) {
      self = AttributedTypeSyntax(data.replacingChild(at: 5, with: value.raw, arena: SyntaxArena()))
    }
  }

  public var unexpectedAfterBaseType: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 6, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = AttributedTypeSyntax(data.replacingChild(at: 6, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public static var structure: SyntaxNodeStructure {
    return .layout([
      \Self.unexpectedBeforeSpecifier,
      \Self.specifier,
      \Self.unexpectedBetweenSpecifierAndAttributes,
      \Self.attributes,
      \Self.unexpectedBetweenAttributesAndBaseType,
      \Self.baseType,
      \Self.unexpectedAfterBaseType,
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

extension AttributedTypeSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeSpecifier": unexpectedBeforeSpecifier.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "specifier": specifier.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenSpecifierAndAttributes": unexpectedBetweenSpecifierAndAttributes.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "attributes": attributes.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenAttributesAndBaseType": unexpectedBetweenAttributesAndBaseType.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "baseType": Syntax(baseType).asProtocol(SyntaxProtocol.self),
      "unexpectedAfterBaseType": unexpectedAfterBaseType.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - NamedOpaqueReturnTypeSyntax

public struct NamedOpaqueReturnTypeSyntax: TypeSyntaxProtocol, SyntaxHashable {
  public let _syntaxNode: Syntax

  public init?<S: SyntaxProtocol>(_ node: S) {
    guard node.raw.kind == .namedOpaqueReturnType else { return nil }
    self._syntaxNode = node._syntaxNode
  }

  /// Creates a `NamedOpaqueReturnTypeSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .namedOpaqueReturnType)
    self._syntaxNode = Syntax(data)
  }

  public init<B: TypeSyntaxProtocol>(
    leadingTrivia: Trivia? = nil,
    _ unexpectedBeforeGenericParameters: UnexpectedNodesSyntax? = nil,
    genericParameters: GenericParameterClauseSyntax,
    _ unexpectedBetweenGenericParametersAndBaseType: UnexpectedNodesSyntax? = nil,
    baseType: B,
    _ unexpectedAfterBaseType: UnexpectedNodesSyntax? = nil,
    trailingTrivia: Trivia? = nil
  ) {
    // Extend the lifetime of all parameters so their arenas don't get destroyed 
    // before they can be added as children of the new arena.
    let data: SyntaxData = withExtendedLifetime((SyntaxArena(), (unexpectedBeforeGenericParameters, genericParameters, unexpectedBetweenGenericParametersAndBaseType, baseType, unexpectedAfterBaseType))) { (arena, _) in
      let layout: [RawSyntax?] = [
        unexpectedBeforeGenericParameters?.raw,
        genericParameters.raw,
        unexpectedBetweenGenericParametersAndBaseType?.raw,
        baseType.raw,
        unexpectedAfterBaseType?.raw,
      ]
      let raw = RawSyntax.makeLayout(
        kind: SyntaxKind.namedOpaqueReturnType, from: layout, arena: arena,
        leadingTrivia: leadingTrivia, trailingTrivia: trailingTrivia)
      return SyntaxData.forRoot(raw)
    }
    self.init(data)
  }

  public var unexpectedBeforeGenericParameters: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 0, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = NamedOpaqueReturnTypeSyntax(data.replacingChild(at: 0, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var genericParameters: GenericParameterClauseSyntax {
    get {
      return GenericParameterClauseSyntax(data.child(at: 1, parent: Syntax(self))!)
    }
    set(value) {
      self = NamedOpaqueReturnTypeSyntax(data.replacingChild(at: 1, with: value.raw, arena: SyntaxArena()))
    }
  }

  public var unexpectedBetweenGenericParametersAndBaseType: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 2, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = NamedOpaqueReturnTypeSyntax(data.replacingChild(at: 2, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var baseType: TypeSyntax {
    get {
      return TypeSyntax(data.child(at: 3, parent: Syntax(self))!)
    }
    set(value) {
      self = NamedOpaqueReturnTypeSyntax(data.replacingChild(at: 3, with: value.raw, arena: SyntaxArena()))
    }
  }

  public var unexpectedAfterBaseType: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 4, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = NamedOpaqueReturnTypeSyntax(data.replacingChild(at: 4, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public static var structure: SyntaxNodeStructure {
    return .layout([
      \Self.unexpectedBeforeGenericParameters,
      \Self.genericParameters,
      \Self.unexpectedBetweenGenericParametersAndBaseType,
      \Self.baseType,
      \Self.unexpectedAfterBaseType,
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

extension NamedOpaqueReturnTypeSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeGenericParameters": unexpectedBeforeGenericParameters.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "genericParameters": Syntax(genericParameters).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenGenericParametersAndBaseType": unexpectedBetweenGenericParametersAndBaseType.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "baseType": Syntax(baseType).asProtocol(SyntaxProtocol.self),
      "unexpectedAfterBaseType": unexpectedAfterBaseType.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

