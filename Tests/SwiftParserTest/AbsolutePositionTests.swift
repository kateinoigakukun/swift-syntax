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

import XCTest
import SwiftSyntax
import SwiftParser
import _SwiftSyntaxTestSupport

public class AbsolutePositionTests: XCTestCase {
  public func testTokenAt() {
    let source =
      """
      func f(a: Int) { }
      """

    let parsed = Parser.parse(source: source)
    for expectedToken in parsed.tokens(viewMode: .sourceAccurate) {
      let tokenStart = expectedToken.position.utf8Offset
      let tokenEnd = expectedToken.endPosition.utf8Offset
      for offset in tokenStart..<tokenEnd {
        let token = parsed.token(at: AbsolutePosition(utf8Offset: offset))
        XCTAssertEqual(token, expectedToken)
      }
    }
  }
}
