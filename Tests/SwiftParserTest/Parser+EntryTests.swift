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

import SwiftSyntax
import SwiftParser
import XCTest

public class EntryTests: XCTestCase {
  func testTopLevelStringParse() throws {
    assertParse("func test() {}", { Parser.parse(source: $0) })
  }

  func testTopLevelBufferParse() throws {
    assertParse(
      "func test() {}",
      { (source: String) -> SourceFileSyntax in
        var source = source
        source.makeContiguousUTF8()
        return source.withUTF8 { Parser.parse(source: $0) }
      }
    )
  }

  func testSyntaxParse() throws {
    assertParse(
      "func test() {}",
      { DeclSyntax.parse(from: &$0) }
    )
  }

  func testRemainderUnexpected() throws {
    assertParse(
      "func test() {} 1️⃣other tokens",
      { DeclSyntax.parse(from: &$0) },
      diagnostics: [DiagnosticSpec(message: "unexpected code 'other tokens' in function")]
    )
  }

  func testRemainderUnexpectedDoesntOverrideExistingUnexpected() throws {
    assertParse(
      "operator 1️⃣test 2️⃣{} other tokens",
      { DeclSyntax.parse(from: &$0) },
      substructure: Syntax(
        UnexpectedNodesSyntax([
          TokenSyntax.leftBraceToken(),
          PrecedenceGroupAttributeListSyntax([]),
          TokenSyntax.rightBraceToken(),
          TokenSyntax.identifier("other"),
          TokenSyntax.identifier("tokens"),
        ])
      ),
      substructureAfterMarker: "2️⃣",
      diagnostics: [
        DiagnosticSpec(locationMarker: "1️⃣", message: "'test' is considered an identifier and must not appear within an operator name"),
        DiagnosticSpec(locationMarker: "2️⃣", message: "operator should not be declared with body"),
      ]
    )
  }
}
