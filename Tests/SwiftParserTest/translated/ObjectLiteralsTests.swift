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

// This test file has been translated from swift/test/Parse/object_literals.swift

import XCTest

final class ObjectLiteralsTests: XCTestCase {
  func testObjectLiterals1a() {
    assertParse(
      """
      let _ = [#Color(colorLiteralRed: red, green: green, blue: blue, alpha: alpha)#1️⃣]
      """,
      diagnostics: [
        DiagnosticSpec(locationMarker: "1️⃣", message: "expected identifier in macro expansion")
      ]
    )
  }

  func testObjectLiterals1b() {
    assertParse(
      """
      let _ = [#Image(imageLiteral: localResourceNameAsString)#1️⃣]
      """,
      diagnostics: [
        DiagnosticSpec(locationMarker: "1️⃣", message: "expected identifier in macro expansion")
      ]
    )
  }

  func testObjectLiterals1c() {
    assertParse(
      """
      let _ = [#FileReference(fileReferenceLiteral: localResourceNameAsString)#1️⃣]
      """,
      diagnostics: [
        DiagnosticSpec(locationMarker: "1️⃣", message: "expected identifier in macro expansion")
      ]
    )
  }

  func testObjectLiterals2a() {
    assertParse(
      """
      let _ = #Color(colorLiteralRed: red, green: green, blue: blue, alpha: alpha)
      """
    )
  }

  func testObjectLiterals2b() {
    assertParse(
      """
      let _ = #Image(imageLiteral: localResourceNameAsString)
      """
    )
  }

  func testObjectLiterals2c() {
    assertParse(
      """
      let _ = #FileReference(fileReferenceLiteral: localResourceNameAsString)
      """
    )
  }

  func testObjectLiterals3a() {
    assertParse(
      """
      let _ = #notAPound
      """
    )
  }

  func testObjectLiterals3b() {
    assertParse(
      """
      let _ = #notAPound(1, 2)
      """
    )
  }

  func testObjectLiterals3c() {
    assertParse(
      """
      let _ = #Color
      """
    )
  }

  func testObjectLiterals4() {
    assertParse(
      """
      let _ = [#1️⃣#2️⃣]
      """,
      diagnostics: [
        DiagnosticSpec(locationMarker: "1️⃣", message: "expected identifier in macro expansion"),
        DiagnosticSpec(locationMarker: "2️⃣", message: "expected identifier in macro expansion"),
      ]
    )
  }

  func testObjectLiterals5() {
    assertParse(
      """
      let _ = [#Color(_: 1, green: 1, 2)2️⃣
      """,
      diagnostics: [
        DiagnosticSpec(locationMarker: "2️⃣", message: "expected ']' to end array")
      ]
    )
  }

  func testObjectLiterals6() {
    assertParse(
      """
      let _ = [1️⃣#Color(red: 1, green: 1, blue: 1)#2️⃣3️⃣
      """,
      diagnostics: [
        DiagnosticSpec(locationMarker: "2️⃣", message: "expected identifier in macro expansion"),
        DiagnosticSpec(locationMarker: "3️⃣", message: "expected ']' to end array"),
      ]
    )
  }

  func testObjectLiterals7() {
    assertParse(
      """
      let _ = [#Color(withRed: 1, green: 1, whatever: 2)#1️⃣]
      """,
      diagnostics: [
        DiagnosticSpec(locationMarker: "1️⃣", message: "expected identifier in macro expansion")
      ]
    )
  }

  func testObjectLiterals8() {
    assertParse(
      """
      let _ = #Color(_: 1, green: 1)
      """
    )
  }
}
