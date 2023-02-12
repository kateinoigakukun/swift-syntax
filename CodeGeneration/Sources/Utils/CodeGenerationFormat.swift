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

import SwiftBasicFormat
import SwiftSyntax

/// A format style for files generated by CodeGeneration.
public class CodeGenerationFormat: BasicFormat {
  public override var indentation: TriviaPiece { .spaces(indentationLevel * 2) }

  public override func visit(_ node: ArrayElementListSyntax) -> ArrayElementListSyntax {
    let children = node.children(viewMode: .all)
    // Short array literals are presented on one line, list each element on a different line.
    if children.count > 3 {
      return ArrayElementListSyntax(formatChildrenSeparatedByNewline(children: children, elementType: ArrayElementSyntax.self))
    } else {
      return super.visit(node)
    }
  }

  public override func visit(_ node: MemberDeclBlockSyntax) -> MemberDeclBlockSyntax {
    if node.members.count == 0 {
      return node.with(\.leftBrace, .leftBraceToken())
    } else {
      return super.visit(node)
    }
  }

  public override func visit(_ node: CodeBlockItemSyntax) -> CodeBlockItemSyntax {
    if node.parent?.parent?.is(SourceFileSyntax.self) == true, !node.item.is(ImportDeclSyntax.self) {
      let formatted = super.visit(node)
      return ensuringTwoLeadingNewlines(node: formatted)
    } else {
      return super.visit(node)
    }
  }

  public override func visit(_ node: DictionaryElementListSyntax) -> DictionaryElementListSyntax {
    let children = node.children(viewMode: .all)
    // Short dictionary literals are presented on one line, list each element on a different line.
    if children.count > 3 {
      return DictionaryElementListSyntax(formatChildrenSeparatedByNewline(children: children, elementType: DictionaryElementSyntax.self))
    } else {
      return super.visit(node)
    }
  }

  public override func visit(_ node: FunctionParameterListSyntax) -> FunctionParameterListSyntax {
    let children = node.children(viewMode: .all)
    // Short function parameter literals are presented on one line, list each element on a different line.
    if children.count > 3 {
      return FunctionParameterListSyntax(formatChildrenSeparatedByNewline(children: children, elementType: FunctionParameterSyntax.self))
    } else {
      return super.visit(node)
    }
  }

  public override func visit(_ node: MemberDeclListItemSyntax) -> MemberDeclListItemSyntax {
    let formatted = super.visit(node)
    if node.indexInParent != 0 {
      return ensuringTwoLeadingNewlines(node: formatted)
    } else {
      return formatted
    }
  }

  public override func visit(_ node: TupleExprElementListSyntax) -> TupleExprElementListSyntax {
    let children = node.children(viewMode: .all)
    // Short tuple element list literals are presented on one line, list each element on a different line.
    if children.count > 3 {
      return TupleExprElementListSyntax(formatChildrenSeparatedByNewline(children: children, elementType: TupleExprElementSyntax.self))
    } else {
      return super.visit(node)
    }
  }

  // MARK: - Private

  private func ensuringTwoLeadingNewlines<NodeType: SyntaxProtocol>(node: NodeType) -> NodeType {
    if node.leadingTrivia?.first?.isNewline ?? false {
      return node.with(\.leadingTrivia, indentedNewline + (node.leadingTrivia ?? []))
    } else {
      return node.with(\.leadingTrivia, indentedNewline + indentedNewline + (node.leadingTrivia ?? []))
    }
  }

  private func formatChildrenSeparatedByNewline<SyntaxType: SyntaxProtocol>(children: SyntaxChildren, elementType: SyntaxType.Type) -> [SyntaxType] {
    indentationLevel += 1
    var formattedChildren = children.map {
      self.visit($0).as(SyntaxType.self)!
    }
    formattedChildren = formattedChildren.map {
      if $0.leadingTrivia?.first?.isNewline == true {
        return $0
      } else {
        return $0.with(\.leadingTrivia, indentedNewline + ($0.leadingTrivia ?? []))
      }
    }
    indentationLevel -= 1
    if !formattedChildren.isEmpty {
      formattedChildren[formattedChildren.count - 1] = formattedChildren[formattedChildren.count - 1].with(\.trailingTrivia, indentedNewline)
    }
    return formattedChildren
  }
}
