

//// Automatically Generated by generate-swiftsyntax
//// Do Not Edit Directly!
//===----------------------------------------------------------------------===//
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

// MARK: - DeclSyntax

/// Protocol to which all `DeclSyntax` nodes conform. Extension point to add
/// common methods to all `DeclSyntax` nodes.
/// DO NOT CONFORM TO THIS PROTOCOL YOURSELF!
public protocol DeclSyntaxProtocol: SyntaxProtocol {
}

public extension Syntax {
  /// Check whether the non-type erased version of this syntax node conforms to
  /// DeclSyntaxProtocol.
  /// Note that this will incur an existential conversion.
  func isProtocol(_: DeclSyntaxProtocol.Protocol) -> Bool {
    return self.asProtocol(DeclSyntaxProtocol.self) != nil
  }
  
  /// Return the non-type erased version of this syntax node if it conforms to
  /// DeclSyntaxProtocol. Otherwise return nil.
  /// Note that this will incur an existential conversion.
  func asProtocol(_: DeclSyntaxProtocol.Protocol) -> DeclSyntaxProtocol? {
    return self.asProtocol(SyntaxProtocol.self) as? DeclSyntaxProtocol
  }
}

public struct DeclSyntax: DeclSyntaxProtocol, SyntaxHashable {
  public let _syntaxNode: Syntax
  
  /// Create a `DeclSyntax` node from a specialized syntax node.
  public init <S: DeclSyntaxProtocol>(_ syntax: S) {
    // We know this cast is going to succeed. Go through init(_: SyntaxData)
    // to do a sanity check and verify the kind matches in debug builds and get
    // maximum performance in release builds.
    self.init(syntax._syntaxNode.data)
  }
  
  /// Create a `DeclSyntax` node from a specialized optional syntax node.
  public init?<S: DeclSyntaxProtocol>(_ syntax: S?) {
    guard let syntax = syntax else { 
      return nil 
    }
    self.init(syntax)
  }
  
  public init(fromProtocol syntax: DeclSyntaxProtocol) {
    // We know this cast is going to succeed. Go through init(_: SyntaxData)
    // to do a sanity check and verify the kind matches in debug builds and get
    // maximum performance in release builds.
    self.init(syntax._syntaxNode.data)
  }
  
  /// Create a `DeclSyntax` node from a specialized optional syntax node.
  public init?(fromProtocol syntax: DeclSyntaxProtocol?) {
    guard let syntax = syntax else { 
      return nil 
    }
    self.init(fromProtocol: syntax)
  }
  
  public init?<S: SyntaxProtocol>(_ node: S) {
    switch node.raw.kind {
    case .accessorDecl, .actorDecl, .associatedtypeDecl, .classDecl, .deinitializerDecl, .editorPlaceholderDecl, .enumCaseDecl, .enumDecl, .extensionDecl, .functionDecl, .ifConfigDecl, .importDecl, .initializerDecl, .macroDecl, .macroExpansionDecl, .missingDecl, .operatorDecl, .poundErrorDecl, .poundSourceLocation, .poundWarningDecl, .precedenceGroupDecl, .protocolDecl, .structDecl, .subscriptDecl, .typealiasDecl, .variableDecl: 
      self._syntaxNode = node._syntaxNode
    default: 
      return nil
    }
  }
  
  /// Creates a `DeclSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    #if DEBUG
    switch data.raw.kind {
    case .accessorDecl, .actorDecl, .associatedtypeDecl, .classDecl, .deinitializerDecl, .editorPlaceholderDecl, .enumCaseDecl, .enumDecl, .extensionDecl, .functionDecl, .ifConfigDecl, .importDecl, .initializerDecl, .macroDecl, .macroExpansionDecl, .missingDecl, .operatorDecl, .poundErrorDecl, .poundSourceLocation, .poundWarningDecl, .precedenceGroupDecl, .protocolDecl, .structDecl, .subscriptDecl, .typealiasDecl, .variableDecl: 
      break 
    default: 
      fatalError("Unable to create DeclSyntax from \(data.raw.kind)")
    }#endif 
    self._syntaxNode = Syntax(data)
  }
  
  public func `is`<S: DeclSyntaxProtocol>(_ syntaxType: S.Type) -> Bool {
    return self.as(syntaxType) != nil
  }
  
  public func `as`<S: DeclSyntaxProtocol>(_ syntaxType: S.Type) -> S? {
    return S.init(self)
  }
  
  public func cast<S: DeclSyntaxProtocol>(_ syntaxType: S.Type) -> S {
    return self.as(S.self)!
  }
  
  /// Syntax nodes always conform to `DeclSyntaxProtocol`. This API is just
  /// added for consistency.
  /// Note that this will incur an existential conversion.
  @available(*, deprecated, message: "Expression always evaluates to true")
  public func isProtocol(_: DeclSyntaxProtocol.Protocol) -> Bool {
    return true
  }
  
  /// Return the non-type erased version of this syntax node.
  /// Note that this will incur an existential conversion.
  public func asProtocol(_: DeclSyntaxProtocol.Protocol) -> DeclSyntaxProtocol {
    return Syntax(self).asProtocol(DeclSyntaxProtocol.self)!
  }
  
  public static var structure: SyntaxNodeStructure {
    return .choices([
        .node(AccessorDeclSyntax.self), 
        .node(ActorDeclSyntax.self), 
        .node(AssociatedtypeDeclSyntax.self), 
        .node(ClassDeclSyntax.self), 
        .node(DeinitializerDeclSyntax.self), 
        .node(EditorPlaceholderDeclSyntax.self), 
        .node(EnumCaseDeclSyntax.self), 
        .node(EnumDeclSyntax.self), 
        .node(ExtensionDeclSyntax.self), 
        .node(FunctionDeclSyntax.self), 
        .node(IfConfigDeclSyntax.self), 
        .node(ImportDeclSyntax.self), 
        .node(InitializerDeclSyntax.self), 
        .node(MacroDeclSyntax.self), 
        .node(MacroExpansionDeclSyntax.self), 
        .node(MissingDeclSyntax.self), 
        .node(OperatorDeclSyntax.self), 
        .node(PoundErrorDeclSyntax.self), 
        .node(PoundSourceLocationSyntax.self), 
        .node(PoundWarningDeclSyntax.self), 
        .node(PrecedenceGroupDeclSyntax.self), 
        .node(ProtocolDeclSyntax.self), 
        .node(StructDeclSyntax.self), 
        .node(SubscriptDeclSyntax.self), 
        .node(TypealiasDeclSyntax.self), 
        .node(VariableDeclSyntax.self)])
  }
  
  public func childNameForDiagnostics(_ index: SyntaxChildrenIndex) -> String? {
    return Syntax(self).childNameForDiagnostics(index)
  }
}

extension DeclSyntax: CustomReflectable {
  /// Reconstructs the real syntax type for this type from the node's kind and
  /// provides a mirror that reflects this type.
  public var customMirror: Mirror {
    return Mirror(reflecting: Syntax(self).asProtocol(SyntaxProtocol.self))
  }
}

// MARK: - ExprSyntax

/// Protocol to which all `ExprSyntax` nodes conform. Extension point to add
/// common methods to all `ExprSyntax` nodes.
/// DO NOT CONFORM TO THIS PROTOCOL YOURSELF!
public protocol ExprSyntaxProtocol: SyntaxProtocol {
}

public extension Syntax {
  /// Check whether the non-type erased version of this syntax node conforms to
  /// ExprSyntaxProtocol.
  /// Note that this will incur an existential conversion.
  func isProtocol(_: ExprSyntaxProtocol.Protocol) -> Bool {
    return self.asProtocol(ExprSyntaxProtocol.self) != nil
  }
  
  /// Return the non-type erased version of this syntax node if it conforms to
  /// ExprSyntaxProtocol. Otherwise return nil.
  /// Note that this will incur an existential conversion.
  func asProtocol(_: ExprSyntaxProtocol.Protocol) -> ExprSyntaxProtocol? {
    return self.asProtocol(SyntaxProtocol.self) as? ExprSyntaxProtocol
  }
}

public struct ExprSyntax: ExprSyntaxProtocol, SyntaxHashable {
  public let _syntaxNode: Syntax
  
  /// Create a `ExprSyntax` node from a specialized syntax node.
  public init <S: ExprSyntaxProtocol>(_ syntax: S) {
    // We know this cast is going to succeed. Go through init(_: SyntaxData)
    // to do a sanity check and verify the kind matches in debug builds and get
    // maximum performance in release builds.
    self.init(syntax._syntaxNode.data)
  }
  
  /// Create a `ExprSyntax` node from a specialized optional syntax node.
  public init?<S: ExprSyntaxProtocol>(_ syntax: S?) {
    guard let syntax = syntax else { 
      return nil 
    }
    self.init(syntax)
  }
  
  public init(fromProtocol syntax: ExprSyntaxProtocol) {
    // We know this cast is going to succeed. Go through init(_: SyntaxData)
    // to do a sanity check and verify the kind matches in debug builds and get
    // maximum performance in release builds.
    self.init(syntax._syntaxNode.data)
  }
  
  /// Create a `ExprSyntax` node from a specialized optional syntax node.
  public init?(fromProtocol syntax: ExprSyntaxProtocol?) {
    guard let syntax = syntax else { 
      return nil 
    }
    self.init(fromProtocol: syntax)
  }
  
  public init?<S: SyntaxProtocol>(_ node: S) {
    switch node.raw.kind {
    case .arrayExpr, .arrowExpr, .asExpr, .assignmentExpr, .awaitExpr, .binaryOperatorExpr, .booleanLiteralExpr, .borrowExpr, .closureExpr, .dictionaryExpr, .discardAssignmentExpr, .editorPlaceholderExpr, .floatLiteralExpr, .forcedValueExpr, .functionCallExpr, .identifierExpr, .inOutExpr, .infixOperatorExpr, .integerLiteralExpr, .isExpr, .keyPathExpr, .macroExpansionExpr, .memberAccessExpr, .missingExpr, .moveExpr, .nilLiteralExpr, .optionalChainingExpr, .packElementExpr, .packExpansionExpr, .postfixIfConfigExpr, .postfixUnaryExpr, .prefixOperatorExpr, .regexLiteralExpr, .sequenceExpr, .specializeExpr, .stringLiteralExpr, .subscriptExpr, .superRefExpr, .ternaryExpr, .tryExpr, .tupleExpr, .typeExpr, .unresolvedAsExpr, .unresolvedIsExpr, .unresolvedPatternExpr, .unresolvedTernaryExpr: 
      self._syntaxNode = node._syntaxNode
    default: 
      return nil
    }
  }
  
  /// Creates a `ExprSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    #if DEBUG
    switch data.raw.kind {
    case .arrayExpr, .arrowExpr, .asExpr, .assignmentExpr, .awaitExpr, .binaryOperatorExpr, .booleanLiteralExpr, .borrowExpr, .closureExpr, .dictionaryExpr, .discardAssignmentExpr, .editorPlaceholderExpr, .floatLiteralExpr, .forcedValueExpr, .functionCallExpr, .identifierExpr, .inOutExpr, .infixOperatorExpr, .integerLiteralExpr, .isExpr, .keyPathExpr, .macroExpansionExpr, .memberAccessExpr, .missingExpr, .moveExpr, .nilLiteralExpr, .optionalChainingExpr, .packElementExpr, .packExpansionExpr, .postfixIfConfigExpr, .postfixUnaryExpr, .prefixOperatorExpr, .regexLiteralExpr, .sequenceExpr, .specializeExpr, .stringLiteralExpr, .subscriptExpr, .superRefExpr, .ternaryExpr, .tryExpr, .tupleExpr, .typeExpr, .unresolvedAsExpr, .unresolvedIsExpr, .unresolvedPatternExpr, .unresolvedTernaryExpr: 
      break 
    default: 
      fatalError("Unable to create ExprSyntax from \(data.raw.kind)")
    }#endif 
    self._syntaxNode = Syntax(data)
  }
  
  public func `is`<S: ExprSyntaxProtocol>(_ syntaxType: S.Type) -> Bool {
    return self.as(syntaxType) != nil
  }
  
  public func `as`<S: ExprSyntaxProtocol>(_ syntaxType: S.Type) -> S? {
    return S.init(self)
  }
  
  public func cast<S: ExprSyntaxProtocol>(_ syntaxType: S.Type) -> S {
    return self.as(S.self)!
  }
  
  /// Syntax nodes always conform to `ExprSyntaxProtocol`. This API is just
  /// added for consistency.
  /// Note that this will incur an existential conversion.
  @available(*, deprecated, message: "Expression always evaluates to true")
  public func isProtocol(_: ExprSyntaxProtocol.Protocol) -> Bool {
    return true
  }
  
  /// Return the non-type erased version of this syntax node.
  /// Note that this will incur an existential conversion.
  public func asProtocol(_: ExprSyntaxProtocol.Protocol) -> ExprSyntaxProtocol {
    return Syntax(self).asProtocol(ExprSyntaxProtocol.self)!
  }
  
  public static var structure: SyntaxNodeStructure {
    return .choices([
        .node(ArrayExprSyntax.self), 
        .node(ArrowExprSyntax.self), 
        .node(AsExprSyntax.self), 
        .node(AssignmentExprSyntax.self), 
        .node(AwaitExprSyntax.self), 
        .node(BinaryOperatorExprSyntax.self), 
        .node(BooleanLiteralExprSyntax.self), 
        .node(BorrowExprSyntax.self), 
        .node(ClosureExprSyntax.self), 
        .node(DictionaryExprSyntax.self), 
        .node(DiscardAssignmentExprSyntax.self), 
        .node(EditorPlaceholderExprSyntax.self), 
        .node(FloatLiteralExprSyntax.self), 
        .node(ForcedValueExprSyntax.self), 
        .node(FunctionCallExprSyntax.self), 
        .node(IdentifierExprSyntax.self), 
        .node(InOutExprSyntax.self), 
        .node(InfixOperatorExprSyntax.self), 
        .node(IntegerLiteralExprSyntax.self), 
        .node(IsExprSyntax.self), 
        .node(KeyPathExprSyntax.self), 
        .node(MacroExpansionExprSyntax.self), 
        .node(MemberAccessExprSyntax.self), 
        .node(MissingExprSyntax.self), 
        .node(MoveExprSyntax.self), 
        .node(NilLiteralExprSyntax.self), 
        .node(OptionalChainingExprSyntax.self), 
        .node(PackElementExprSyntax.self), 
        .node(PackExpansionExprSyntax.self), 
        .node(PostfixIfConfigExprSyntax.self), 
        .node(PostfixUnaryExprSyntax.self), 
        .node(PrefixOperatorExprSyntax.self), 
        .node(RegexLiteralExprSyntax.self), 
        .node(SequenceExprSyntax.self), 
        .node(SpecializeExprSyntax.self), 
        .node(StringLiteralExprSyntax.self), 
        .node(SubscriptExprSyntax.self), 
        .node(SuperRefExprSyntax.self), 
        .node(TernaryExprSyntax.self), 
        .node(TryExprSyntax.self), 
        .node(TupleExprSyntax.self), 
        .node(TypeExprSyntax.self), 
        .node(UnresolvedAsExprSyntax.self), 
        .node(UnresolvedIsExprSyntax.self), 
        .node(UnresolvedPatternExprSyntax.self), 
        .node(UnresolvedTernaryExprSyntax.self)])
  }
  
  public func childNameForDiagnostics(_ index: SyntaxChildrenIndex) -> String? {
    return Syntax(self).childNameForDiagnostics(index)
  }
}

extension ExprSyntax: CustomReflectable {
  /// Reconstructs the real syntax type for this type from the node's kind and
  /// provides a mirror that reflects this type.
  public var customMirror: Mirror {
    return Mirror(reflecting: Syntax(self).asProtocol(SyntaxProtocol.self))
  }
}

// MARK: - PatternSyntax

/// Protocol to which all `PatternSyntax` nodes conform. Extension point to add
/// common methods to all `PatternSyntax` nodes.
/// DO NOT CONFORM TO THIS PROTOCOL YOURSELF!
public protocol PatternSyntaxProtocol: SyntaxProtocol {
}

public extension Syntax {
  /// Check whether the non-type erased version of this syntax node conforms to
  /// PatternSyntaxProtocol.
  /// Note that this will incur an existential conversion.
  func isProtocol(_: PatternSyntaxProtocol.Protocol) -> Bool {
    return self.asProtocol(PatternSyntaxProtocol.self) != nil
  }
  
  /// Return the non-type erased version of this syntax node if it conforms to
  /// PatternSyntaxProtocol. Otherwise return nil.
  /// Note that this will incur an existential conversion.
  func asProtocol(_: PatternSyntaxProtocol.Protocol) -> PatternSyntaxProtocol? {
    return self.asProtocol(SyntaxProtocol.self) as? PatternSyntaxProtocol
  }
}

public struct PatternSyntax: PatternSyntaxProtocol, SyntaxHashable {
  public let _syntaxNode: Syntax
  
  /// Create a `PatternSyntax` node from a specialized syntax node.
  public init <S: PatternSyntaxProtocol>(_ syntax: S) {
    // We know this cast is going to succeed. Go through init(_: SyntaxData)
    // to do a sanity check and verify the kind matches in debug builds and get
    // maximum performance in release builds.
    self.init(syntax._syntaxNode.data)
  }
  
  /// Create a `PatternSyntax` node from a specialized optional syntax node.
  public init?<S: PatternSyntaxProtocol>(_ syntax: S?) {
    guard let syntax = syntax else { 
      return nil 
    }
    self.init(syntax)
  }
  
  public init(fromProtocol syntax: PatternSyntaxProtocol) {
    // We know this cast is going to succeed. Go through init(_: SyntaxData)
    // to do a sanity check and verify the kind matches in debug builds and get
    // maximum performance in release builds.
    self.init(syntax._syntaxNode.data)
  }
  
  /// Create a `PatternSyntax` node from a specialized optional syntax node.
  public init?(fromProtocol syntax: PatternSyntaxProtocol?) {
    guard let syntax = syntax else { 
      return nil 
    }
    self.init(fromProtocol: syntax)
  }
  
  public init?<S: SyntaxProtocol>(_ node: S) {
    switch node.raw.kind {
    case .expressionPattern, .identifierPattern, .isTypePattern, .missingPattern, .tuplePattern, .valueBindingPattern, .wildcardPattern: 
      self._syntaxNode = node._syntaxNode
    default: 
      return nil
    }
  }
  
  /// Creates a `PatternSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    #if DEBUG
    switch data.raw.kind {
    case .expressionPattern, .identifierPattern, .isTypePattern, .missingPattern, .tuplePattern, .valueBindingPattern, .wildcardPattern: 
      break 
    default: 
      fatalError("Unable to create PatternSyntax from \(data.raw.kind)")
    }#endif 
    self._syntaxNode = Syntax(data)
  }
  
  public func `is`<S: PatternSyntaxProtocol>(_ syntaxType: S.Type) -> Bool {
    return self.as(syntaxType) != nil
  }
  
  public func `as`<S: PatternSyntaxProtocol>(_ syntaxType: S.Type) -> S? {
    return S.init(self)
  }
  
  public func cast<S: PatternSyntaxProtocol>(_ syntaxType: S.Type) -> S {
    return self.as(S.self)!
  }
  
  /// Syntax nodes always conform to `PatternSyntaxProtocol`. This API is just
  /// added for consistency.
  /// Note that this will incur an existential conversion.
  @available(*, deprecated, message: "Expression always evaluates to true")
  public func isProtocol(_: PatternSyntaxProtocol.Protocol) -> Bool {
    return true
  }
  
  /// Return the non-type erased version of this syntax node.
  /// Note that this will incur an existential conversion.
  public func asProtocol(_: PatternSyntaxProtocol.Protocol) -> PatternSyntaxProtocol {
    return Syntax(self).asProtocol(PatternSyntaxProtocol.self)!
  }
  
  public static var structure: SyntaxNodeStructure {
    return .choices([
        .node(ExpressionPatternSyntax.self), 
        .node(IdentifierPatternSyntax.self), 
        .node(IsTypePatternSyntax.self), 
        .node(MissingPatternSyntax.self), 
        .node(TuplePatternSyntax.self), 
        .node(ValueBindingPatternSyntax.self), 
        .node(WildcardPatternSyntax.self)])
  }
  
  public func childNameForDiagnostics(_ index: SyntaxChildrenIndex) -> String? {
    return Syntax(self).childNameForDiagnostics(index)
  }
}

extension PatternSyntax: CustomReflectable {
  /// Reconstructs the real syntax type for this type from the node's kind and
  /// provides a mirror that reflects this type.
  public var customMirror: Mirror {
    return Mirror(reflecting: Syntax(self).asProtocol(SyntaxProtocol.self))
  }
}

// MARK: - StmtSyntax

/// Protocol to which all `StmtSyntax` nodes conform. Extension point to add
/// common methods to all `StmtSyntax` nodes.
/// DO NOT CONFORM TO THIS PROTOCOL YOURSELF!
public protocol StmtSyntaxProtocol: SyntaxProtocol {
}

public extension Syntax {
  /// Check whether the non-type erased version of this syntax node conforms to
  /// StmtSyntaxProtocol.
  /// Note that this will incur an existential conversion.
  func isProtocol(_: StmtSyntaxProtocol.Protocol) -> Bool {
    return self.asProtocol(StmtSyntaxProtocol.self) != nil
  }
  
  /// Return the non-type erased version of this syntax node if it conforms to
  /// StmtSyntaxProtocol. Otherwise return nil.
  /// Note that this will incur an existential conversion.
  func asProtocol(_: StmtSyntaxProtocol.Protocol) -> StmtSyntaxProtocol? {
    return self.asProtocol(SyntaxProtocol.self) as? StmtSyntaxProtocol
  }
}

public struct StmtSyntax: StmtSyntaxProtocol, SyntaxHashable {
  public let _syntaxNode: Syntax
  
  /// Create a `StmtSyntax` node from a specialized syntax node.
  public init <S: StmtSyntaxProtocol>(_ syntax: S) {
    // We know this cast is going to succeed. Go through init(_: SyntaxData)
    // to do a sanity check and verify the kind matches in debug builds and get
    // maximum performance in release builds.
    self.init(syntax._syntaxNode.data)
  }
  
  /// Create a `StmtSyntax` node from a specialized optional syntax node.
  public init?<S: StmtSyntaxProtocol>(_ syntax: S?) {
    guard let syntax = syntax else { 
      return nil 
    }
    self.init(syntax)
  }
  
  public init(fromProtocol syntax: StmtSyntaxProtocol) {
    // We know this cast is going to succeed. Go through init(_: SyntaxData)
    // to do a sanity check and verify the kind matches in debug builds and get
    // maximum performance in release builds.
    self.init(syntax._syntaxNode.data)
  }
  
  /// Create a `StmtSyntax` node from a specialized optional syntax node.
  public init?(fromProtocol syntax: StmtSyntaxProtocol?) {
    guard let syntax = syntax else { 
      return nil 
    }
    self.init(fromProtocol: syntax)
  }
  
  public init?<S: SyntaxProtocol>(_ node: S) {
    switch node.raw.kind {
    case .breakStmt, .continueStmt, .deferStmt, .doStmt, .fallthroughStmt, .forInStmt, .guardStmt, .ifStmt, .labeledStmt, .missingStmt, .poundAssertStmt, .repeatWhileStmt, .returnStmt, .switchStmt, .throwStmt, .whileStmt, .yieldStmt: 
      self._syntaxNode = node._syntaxNode
    default: 
      return nil
    }
  }
  
  /// Creates a `StmtSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    #if DEBUG
    switch data.raw.kind {
    case .breakStmt, .continueStmt, .deferStmt, .doStmt, .fallthroughStmt, .forInStmt, .guardStmt, .ifStmt, .labeledStmt, .missingStmt, .poundAssertStmt, .repeatWhileStmt, .returnStmt, .switchStmt, .throwStmt, .whileStmt, .yieldStmt: 
      break 
    default: 
      fatalError("Unable to create StmtSyntax from \(data.raw.kind)")
    }#endif 
    self._syntaxNode = Syntax(data)
  }
  
  public func `is`<S: StmtSyntaxProtocol>(_ syntaxType: S.Type) -> Bool {
    return self.as(syntaxType) != nil
  }
  
  public func `as`<S: StmtSyntaxProtocol>(_ syntaxType: S.Type) -> S? {
    return S.init(self)
  }
  
  public func cast<S: StmtSyntaxProtocol>(_ syntaxType: S.Type) -> S {
    return self.as(S.self)!
  }
  
  /// Syntax nodes always conform to `StmtSyntaxProtocol`. This API is just
  /// added for consistency.
  /// Note that this will incur an existential conversion.
  @available(*, deprecated, message: "Expression always evaluates to true")
  public func isProtocol(_: StmtSyntaxProtocol.Protocol) -> Bool {
    return true
  }
  
  /// Return the non-type erased version of this syntax node.
  /// Note that this will incur an existential conversion.
  public func asProtocol(_: StmtSyntaxProtocol.Protocol) -> StmtSyntaxProtocol {
    return Syntax(self).asProtocol(StmtSyntaxProtocol.self)!
  }
  
  public static var structure: SyntaxNodeStructure {
    return .choices([
        .node(BreakStmtSyntax.self), 
        .node(ContinueStmtSyntax.self), 
        .node(DeferStmtSyntax.self), 
        .node(DoStmtSyntax.self), 
        .node(FallthroughStmtSyntax.self), 
        .node(ForInStmtSyntax.self), 
        .node(GuardStmtSyntax.self), 
        .node(IfStmtSyntax.self), 
        .node(LabeledStmtSyntax.self), 
        .node(MissingStmtSyntax.self), 
        .node(PoundAssertStmtSyntax.self), 
        .node(RepeatWhileStmtSyntax.self), 
        .node(ReturnStmtSyntax.self), 
        .node(SwitchStmtSyntax.self), 
        .node(ThrowStmtSyntax.self), 
        .node(WhileStmtSyntax.self), 
        .node(YieldStmtSyntax.self)])
  }
  
  public func childNameForDiagnostics(_ index: SyntaxChildrenIndex) -> String? {
    return Syntax(self).childNameForDiagnostics(index)
  }
}

extension StmtSyntax: CustomReflectable {
  /// Reconstructs the real syntax type for this type from the node's kind and
  /// provides a mirror that reflects this type.
  public var customMirror: Mirror {
    return Mirror(reflecting: Syntax(self).asProtocol(SyntaxProtocol.self))
  }
}

// MARK: - TypeSyntax

/// Protocol to which all `TypeSyntax` nodes conform. Extension point to add
/// common methods to all `TypeSyntax` nodes.
/// DO NOT CONFORM TO THIS PROTOCOL YOURSELF!
public protocol TypeSyntaxProtocol: SyntaxProtocol {
}

public extension Syntax {
  /// Check whether the non-type erased version of this syntax node conforms to
  /// TypeSyntaxProtocol.
  /// Note that this will incur an existential conversion.
  func isProtocol(_: TypeSyntaxProtocol.Protocol) -> Bool {
    return self.asProtocol(TypeSyntaxProtocol.self) != nil
  }
  
  /// Return the non-type erased version of this syntax node if it conforms to
  /// TypeSyntaxProtocol. Otherwise return nil.
  /// Note that this will incur an existential conversion.
  func asProtocol(_: TypeSyntaxProtocol.Protocol) -> TypeSyntaxProtocol? {
    return self.asProtocol(SyntaxProtocol.self) as? TypeSyntaxProtocol
  }
}

public struct TypeSyntax: TypeSyntaxProtocol, SyntaxHashable {
  public let _syntaxNode: Syntax
  
  /// Create a `TypeSyntax` node from a specialized syntax node.
  public init <S: TypeSyntaxProtocol>(_ syntax: S) {
    // We know this cast is going to succeed. Go through init(_: SyntaxData)
    // to do a sanity check and verify the kind matches in debug builds and get
    // maximum performance in release builds.
    self.init(syntax._syntaxNode.data)
  }
  
  /// Create a `TypeSyntax` node from a specialized optional syntax node.
  public init?<S: TypeSyntaxProtocol>(_ syntax: S?) {
    guard let syntax = syntax else { 
      return nil 
    }
    self.init(syntax)
  }
  
  public init(fromProtocol syntax: TypeSyntaxProtocol) {
    // We know this cast is going to succeed. Go through init(_: SyntaxData)
    // to do a sanity check and verify the kind matches in debug builds and get
    // maximum performance in release builds.
    self.init(syntax._syntaxNode.data)
  }
  
  /// Create a `TypeSyntax` node from a specialized optional syntax node.
  public init?(fromProtocol syntax: TypeSyntaxProtocol?) {
    guard let syntax = syntax else { 
      return nil 
    }
    self.init(fromProtocol: syntax)
  }
  
  public init?<S: SyntaxProtocol>(_ node: S) {
    switch node.raw.kind {
    case .arrayType, .attributedType, .classRestrictionType, .compositionType, .constrainedSugarType, .dictionaryType, .functionType, .implicitlyUnwrappedOptionalType, .memberTypeIdentifier, .metatypeType, .missingType, .namedOpaqueReturnType, .optionalType, .packExpansionType, .packReferenceType, .simpleTypeIdentifier, .tupleType: 
      self._syntaxNode = node._syntaxNode
    default: 
      return nil
    }
  }
  
  /// Creates a `TypeSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    #if DEBUG
    switch data.raw.kind {
    case .arrayType, .attributedType, .classRestrictionType, .compositionType, .constrainedSugarType, .dictionaryType, .functionType, .implicitlyUnwrappedOptionalType, .memberTypeIdentifier, .metatypeType, .missingType, .namedOpaqueReturnType, .optionalType, .packExpansionType, .packReferenceType, .simpleTypeIdentifier, .tupleType: 
      break 
    default: 
      fatalError("Unable to create TypeSyntax from \(data.raw.kind)")
    }#endif 
    self._syntaxNode = Syntax(data)
  }
  
  public func `is`<S: TypeSyntaxProtocol>(_ syntaxType: S.Type) -> Bool {
    return self.as(syntaxType) != nil
  }
  
  public func `as`<S: TypeSyntaxProtocol>(_ syntaxType: S.Type) -> S? {
    return S.init(self)
  }
  
  public func cast<S: TypeSyntaxProtocol>(_ syntaxType: S.Type) -> S {
    return self.as(S.self)!
  }
  
  /// Syntax nodes always conform to `TypeSyntaxProtocol`. This API is just
  /// added for consistency.
  /// Note that this will incur an existential conversion.
  @available(*, deprecated, message: "Expression always evaluates to true")
  public func isProtocol(_: TypeSyntaxProtocol.Protocol) -> Bool {
    return true
  }
  
  /// Return the non-type erased version of this syntax node.
  /// Note that this will incur an existential conversion.
  public func asProtocol(_: TypeSyntaxProtocol.Protocol) -> TypeSyntaxProtocol {
    return Syntax(self).asProtocol(TypeSyntaxProtocol.self)!
  }
  
  public static var structure: SyntaxNodeStructure {
    return .choices([
        .node(ArrayTypeSyntax.self), 
        .node(AttributedTypeSyntax.self), 
        .node(ClassRestrictionTypeSyntax.self), 
        .node(CompositionTypeSyntax.self), 
        .node(ConstrainedSugarTypeSyntax.self), 
        .node(DictionaryTypeSyntax.self), 
        .node(FunctionTypeSyntax.self), 
        .node(ImplicitlyUnwrappedOptionalTypeSyntax.self), 
        .node(MemberTypeIdentifierSyntax.self), 
        .node(MetatypeTypeSyntax.self), 
        .node(MissingTypeSyntax.self), 
        .node(NamedOpaqueReturnTypeSyntax.self), 
        .node(OptionalTypeSyntax.self), 
        .node(PackExpansionTypeSyntax.self), 
        .node(PackReferenceTypeSyntax.self), 
        .node(SimpleTypeIdentifierSyntax.self), 
        .node(TupleTypeSyntax.self)])
  }
  
  public func childNameForDiagnostics(_ index: SyntaxChildrenIndex) -> String? {
    return Syntax(self).childNameForDiagnostics(index)
  }
}

extension TypeSyntax: CustomReflectable {
  /// Reconstructs the real syntax type for this type from the node's kind and
  /// provides a mirror that reflects this type.
  public var customMirror: Mirror {
    return Mirror(reflecting: Syntax(self).asProtocol(SyntaxProtocol.self))
  }
}
