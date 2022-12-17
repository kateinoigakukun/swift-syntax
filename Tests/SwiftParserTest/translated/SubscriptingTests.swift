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

// This test file has been translated from swift/test/Parse/subscripting.swift

import XCTest

final class SubscriptingTests: XCTestCase {
  func testSubscripting1() {
    AssertParse(
      """
      struct X { }
      """
    )
  }

  func testSubscripting2() {
    AssertParse(
      """
      // Simple examples
      struct X1 {
        var stored: Int
        subscript(i: Int) -> Int {
          get {
            return stored
          }
          mutating
          set {
            stored = newValue
          }
        }
      }
      """
    )
  }

  func testSubscripting3() {
    AssertParse(
      """
      struct X2 {
        var stored: Int
        subscript(i: Int) -> Int {
          get {
            return stored + i
          }
          set(v) {
            stored = v - i
          }
        }
      }
      """
    )
  }

  func testSubscripting4() {
    AssertParse(
      """
      struct X3 {
        var stored: Int
        subscript(_: Int) -> Int {
          get {
            return stored
          }
          set(v) {
            stored = v
          }
        }
      }
      """
    )
  }

  func testSubscripting5() {
    AssertParse(
      """
      struct X4 {
        var stored: Int
        subscript(i: Int, j: Int) -> Int {
          get {
            return stored + i + j
          }
          mutating
          set(v) {
            stored = v + i - j
          }
        }
      }
      """
    )
  }

  func testSubscripting6() {
    AssertParse(
      """
      struct X5 {
        static var stored: Int = 1
        static subscript(i: Int) -> Int {
          get {
            return stored + i
          }
          set {
            stored = newValue - i
          }
        }
      }
      """
    )
  }

  func testSubscripting7() {
    AssertParse(
      """
      class X6 {
        static var stored: Int = 1
        class subscript(i: Int) -> Int {
          get {
            return stored + i
          }
          set {
            stored = newValue - i
          }
        }
      }
      """
    )
  }

  func testSubscripting8() {
    AssertParse(
      """
      struct Y1 {
        var stored: Int
        subscript(_: i, j: Int) -> Int { 
          get {
            return stored + j
          }
          set {
            stored = j
          }
        }
      }
      """
    )
  }

  func testSubscripting9() {
    AssertParse(
      """
      // Mutating getters on constants
      // https://github.com/apple/swift/issues/43457
      """
    )
  }

  func testSubscripting10() {
    AssertParse(
      """
      struct Y2 {
        subscript(_: Int) -> Int {
          mutating get { return 0 }
        }
      }
      """
    )
  }

  func testSubscripting11() {
    AssertParse(
      """
      // FIXME: This test case does not belong in Parse/
      let y2 = Y2() 
      _ = y2[0]
      """
    )
  }

  func testSubscripting12a() {
    AssertParse(
      """
      struct A0 {
        subscript 1️⃣
          i : 2️⃣Int3️⃣
           -> Int 4️⃣{
          get {
            return stored
          }
          set {
            stored = value
          }
        }
      }
      """,
      diagnostics: [
        DiagnosticSpec(locationMarker: "1️⃣", message: "expected '(' to start parameter clause"),
        DiagnosticSpec(locationMarker: "2️⃣", message: "expected '(' to start function type"),
        DiagnosticSpec(locationMarker: "3️⃣", message: "expected ')' in function type"),
        DiagnosticSpec(locationMarker: "4️⃣", message: "expected ')' to end parameter clause"),
        DiagnosticSpec(locationMarker: "4️⃣", message: "expected '->' and return type in subscript"),
      ],
      fixedSource: """
        struct A0 {
          subscript(
            i : (Int)
             -> Int)  -> <#type#>{
            get {
              return stored
            }
            set {
              stored = value
            }
          }
        }
        """
    )
  }

  func testSubscripting12b() {
    AssertParse(
      """
      // Parsing errors
      struct A0 {
        subscript 1️⃣-> Int {
          return 1
        }
      }
      """,
      diagnostics: [
        DiagnosticSpec(message: "expected parameter clause in subscript")
      ]
    )
  }

  func testSubscripting13() {
    AssertParse(
      """
      struct A1 {
        subscript (i : Int) 1️⃣
           Int {
          get {
            return stored 
          }
          set {
            stored = newValue
          }
        }
      }
      """,
      diagnostics: [
        DiagnosticSpec(locationMarker: "1️⃣", message: "expected '->' in subscript")
      ]
    )
  }

  func testSubscripting14() {
    AssertParse(
      """
      struct A2 {
        subscript (i : Int) -> 1️⃣
           {
          get {
            return stored
          }
          set {
            stored = newValue 
          }
        }
      }
      """,
      diagnostics: [
        DiagnosticSpec(message: "expected return type in subscript")
      ]
    )
  }

  func testSubscripting15() {
    AssertParse(
      """
      struct A3 {
        subscript(i : Int) 1️⃣
        {
          get {
            return i
          }
        }
      }
      """,
      diagnostics: [
        DiagnosticSpec(message: "expected '->' and return type in subscript")
      ]
    )
  }

  func testSubscripting16() {
    AssertParse(
      """
      struct A4 {
        subscript(i : Int) 1️⃣{ 
          get {
            return i
          }
        }
      }
      """,
      diagnostics: [
        DiagnosticSpec(message: "expected '->' and return type in subscript")
      ]
    )
  }

  func testSubscripting17() {
    AssertParse(
      """
      struct A5 {
        subscript(i : Int) -> Int 
      }
      """
    )
  }

  func testSubscripting18() {
    AssertParse(
      """
      struct A6 {
        subscript(i: Int)1️⃣(j: Int) -> Int { 
          get {
            return i + j 
          }
        }
      }
      """,
      diagnostics: [
        DiagnosticSpec(message: "unexpected code '(j: Int)' in subscript")
      ]
    )
  }

  func testSubscripting19() {
    AssertParse(
      """
      struct A7 {
        class subscript(a: Float) -> Int { 
          get {
            return 42
          }
        }
      }
      """
    )
  }

  func testSubscripting20() {
    AssertParse(
      """
      class A7b {
        class static subscript(a: Float) -> Int { 
          get {
            return 42
          }
        }
      }
      """
    )
  }

  func testSubscripting21() {
    AssertParse(
      """
      struct A8 {
        subscript(i : Int) -> Int1️⃣
          get {
            return stored
          }
          set {
            stored = value
          }
        }2️⃣
      """,
      diagnostics: [
        DiagnosticSpec(locationMarker: "1️⃣", message: "expected '{' in subscript"),
        DiagnosticSpec(locationMarker: "2️⃣", message: "expected '}' to end struct"),
      ]
    )
  }

  func testSubscripting22() {
    AssertParse(
      """
      struct A9 {
        subscript 1️⃣x() -> Int { 
          return 0
        }
      }
      """,
      diagnostics: [
        // TODO: Old parser expected error on line 2: subscripts cannot have a name, Fix-It replacements: 13 - 14 = ''
        DiagnosticSpec(message: "subscripts cannot have a name", fixIts: ["remove 'x'"])
      ],
      fixedSource: """
        struct A9 {
          subscript () -> Int {
            return 0
          }
        }
        """
    )
  }

  func testSubscripting23() {
    AssertParse(
      """
      struct A10 {
        subscript 1️⃣x(i: Int) -> Int { 
          return 0
        }
        subscript 2️⃣x<T>(i: T) -> Int { 
          return 0
        }
      }
      """,
      diagnostics: [
        DiagnosticSpec(locationMarker: "1️⃣", message: "subscripts cannot have a name", fixIts: ["remove 'x'"]),
        DiagnosticSpec(locationMarker: "2️⃣", message: "subscripts cannot have a name", fixIts: ["remove 'x'"]),
      ],
      fixedSource: """
        struct A10 {
          subscript (i: Int) -> Int {
            return 0
          }
          subscript <T>(i: T) -> Int {
            return 0
          }
        }
        """
    )
  }

  func testSubscripting24() {
    AssertParse(
      """
      struct A11 {
        subscript 1️⃣x y : 2️⃣Int 3️⃣-> Int 4️⃣{
          return 0
        }
      }
      """,
      diagnostics: [
        DiagnosticSpec(locationMarker: "1️⃣", message: "expected '(' to start parameter clause"),
        DiagnosticSpec(locationMarker: "2️⃣", message: "expected '(' to start function type"),
        DiagnosticSpec(locationMarker: "3️⃣", message: "expected ')' in function type"),
        DiagnosticSpec(locationMarker: "4️⃣", message: "expected ')' to end parameter clause"),
        DiagnosticSpec(locationMarker: "4️⃣", message: "expected '->' and return type in subscript"),
      ],
      fixedSource: """
        struct A11 {
          subscript( x y : (Int) -> Int)  -> <#type#>{
            return 0
          }
        }
        """
    )
  }
}
