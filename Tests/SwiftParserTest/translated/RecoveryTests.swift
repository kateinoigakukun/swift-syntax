// This test file has been translated from swift/test/Parse/recovery.swift

import XCTest

final class RecoveryTests: XCTestCase {
  func testRecovery1() {
    assertParse(
      """
      //===--- Helper types used in this file.
      """
    )
  }

  func testRecovery2() {
    assertParse(
      """
      protocol FooProtocol {}
      """
    )
  }

  func testRecovery3() {
    assertParse(
      """
      //===--- Tests.
      """
    )
  }

  func testRecovery4() {
    assertParse(
      #"""
      func garbage() -> () {
        var a : Int
        1️⃣) this line is invalid, but we will stop at the keyword below...
        return a + "a"
      }
      """#,
      diagnostics: [
        DiagnosticSpec(message: "unexpected code ') this line is invalid, but we will stop at the keyword below...' before 'return' statement")
      ]
    )
  }

  func testRecovery5() {
    assertParse(
      #"""
      func moreGarbage() -> () {
        1️⃣) this line is invalid, but we will stop at the declaration...
        func a() -> Int { return 4 }
        return a() + "a"
      }
      """#,
      diagnostics: [
        DiagnosticSpec(message: "unexpected code ') this line is invalid, but we will stop at the declaration...' before function")
      ]
    )
  }

  func testRecovery6() {
    assertParse(
      """
      class Container<T> {
        func exists() -> Bool { return true }
      }
      """
    )
  }

  func testRecovery7() {
    assertParse(
      """
      func useContainer() -> () {
        var a : Container<not 1️⃣a2️⃣ type [skip 3️⃣this greater: >] >4️⃣, b : Int
        b = 5 // no-warning
        a.exists()
      }
      """,
      diagnostics: [
        DiagnosticSpec(locationMarker: "1️⃣", message: "expected '>' to end generic argument clause"),
        DiagnosticSpec(locationMarker: "2️⃣", message: "consecutive statements on a line must be separated by ';'"),
        DiagnosticSpec(locationMarker: "3️⃣", message: "unexpected code 'this greater: >' in subscript"),
        DiagnosticSpec(locationMarker: "4️⃣", message: "expected expression after operator"),
        DiagnosticSpec(locationMarker: "4️⃣", message: "unexpected code in function"),
      ]
    )
  }

  func testRecovery8() {
    assertParse(
      """
      @xyz class BadAttributes {
        func exists() -> Bool { return true }
      }
      """
    )
  }

  func testRecovery9() {
    assertParse(
      """
      func test(a: BadAttributes) -> () {
        _ = a.exists() // no-warning
      }
      """
    )
  }

  func testRecovery10() {
    assertParse(
      """
      // Here is an extra random close-brace!
      1️⃣}
      //===--- Recovery for braced blocks.
      func braceStmt1() {
        { braceStmt1(); }2️⃣a
      }
      """,
      diagnostics: [
        DiagnosticSpec(locationMarker: "1️⃣", message: "unexpected brace before function"),
        DiagnosticSpec(locationMarker: "2️⃣", message: "consecutive statements on a line must be separated by ';'"),
      ]
    )
  }

  func testRecovery11() {
    assertParse(
      """
      func braceStmt2() {
        { () in braceStmt2(); }
      }
      """
    )
  }

  func testRecovery12() {
    assertParse(
      """
      func braceStmt3() {
        {
          undefinedIdentifier {}
        }
      }
      """
    )
  }

  func testRecovery13() {
    assertParse(
      """
      //===--- Recovery for misplaced 'static'.
      static func toplevelStaticFunc() {}
      static struct StaticStruct {}
      static class StaticClass {}
      static protocol StaticProtocol {}
      static typealias StaticTypealias = Int
      class ClassWithStaticDecls {
        class var a = 42
      }
      """
    )
  }

  func testRecovery13b() {
    assertParse(
      """
        if1️⃣
      """,
      diagnostics: [
        DiagnosticSpec(message: "expected expression and body in 'if' statement")
      ]
    )
  }

  func testRecovery14() {
    assertParse(
      """
      if 1️⃣{
        }
      """,
      diagnostics: [
        DiagnosticSpec(message: "missing condition in 'if' statement")
      ]
    )
  }

  func testRecovery15() {
    assertParse(
      """
      if 1️⃣
        {
        }
      """,
      diagnostics: [
        DiagnosticSpec(message: "missing condition in 'if' statement")
      ]
    )
  }

  func testRecovery16() {
    assertParse(
      """
      if true {
        } else if 1️⃣{
        }
      """,
      diagnostics: [
        DiagnosticSpec(message: "missing condition in 'if' statement")
      ]
    )
  }

  func testRecovery17() {
    // It is debatable if we should do recovery here and parse { true } as the
    // body, but the error message should be sensible.
    assertParse(
      """
      if 1️⃣{ true } {
      }
      """,
      diagnostics: [
        DiagnosticSpec(message: "missing condition in 'if' statement")
        // TODO: Old parser expected error on line 3: consecutive statements on a line must be separated by ';', Fix-It replacements: 14 - 14 = ';'
        // TODO: Old parser expected error on line 3: closure expression is unused
        // TODO: Old parser expected note on line 3: did you mean to use a 'do' statement?, Fix-It replacements: 15 - 15 = 'do '
        // TODO: Old parser expected warning on line 3: boolean literal is unused
      ]
    )
  }

  func testRecovery18() {
    assertParse(
      """
      if 1️⃣{ true }() {
        }
      """,
      diagnostics: [
        DiagnosticSpec(message: "missing condition in 'if' statement")
      ]
    )
  }

  func testRecovery19() {
    assertParse(
      """
      // <rdar://problem/18940198>
        if 1️⃣{ { } }
      """,
      diagnostics: [
        DiagnosticSpec(message: "missing condition in 'if' statement")
        // TODO: Old parser expected error on line 2: closure expression is unused
        // TODO: Old parser expected note on line 2: did you mean to use a 'do' statement?, Fix-It replacements: 8 - 8 = 'do '
      ]
    )
  }

  func testRecovery20() {
    assertParse(
      """
      while1️⃣
      """,
      diagnostics: [
        DiagnosticSpec(message: "expected expression and code block in 'while' statement")
      ]
    )
  }

  func testRecovery21() {
    assertParse(
      """
      while 1️⃣{
        }
      """,
      diagnostics: [
        DiagnosticSpec(message: "missing condition in 'while' statement")
      ]
    )
  }

  func testRecovery22() {
    assertParse(
      """
      while 1️⃣
        {
        }
      """,
      diagnostics: [
        DiagnosticSpec(message: "missing condition in 'while' statement")
      ]
    )
  }

  func testRecovery23() {
    assertParse(
      """
      // It is debatable if we should do recovery here and parse { true } as the
      // body, but the error message should be sensible.
      while 1️⃣{ true } {
      }
      """,
      diagnostics: [
        DiagnosticSpec(message: "missing condition in 'while' statement")
        // TODO: Old parser expected error on line 3: consecutive statements on a line must be separated by ';', Fix-It replacements: 17 - 17 = ';'
        // TODO: Old parser expected error on line 3: closure expression is unused
        // TODO: Old parser expected note on line 3: did you mean to use a 'do' statement?, Fix-It replacements: 18 - 18 = 'do '
        // TODO: Old parser expected warning on line 3: boolean literal is unused
      ]
    )
  }

  func testRecovery24() {
    assertParse(
      """
      while 1️⃣{ true }() {
      }
      """,
      diagnostics: [
        DiagnosticSpec(message: "missing condition in 'while' statement")
      ]
    )
  }

  func testRecovery25() {
    assertParse(
      """
      // <rdar://problem/18940198>
      while 1️⃣{ { } }
      """,
      diagnostics: [
        DiagnosticSpec(message: "missing condition in 'while' statement")
        // TODO: Old parser expected error on line 2: closure expression is unused
        // TODO: Old parser expected note on line 2: did you mean to use a 'do' statement?, Fix-It replacements: 11 - 11 = 'do '
      ]
    )
  }

  func testRecovery26() {
    assertParse(
      """
      repeat {
      } while1️⃣
      """,
      diagnostics: [
        DiagnosticSpec(message: "expected condition in 'repeat' statement")
      ]
    )
  }

  func testRecovery27() {
    assertParse(
      """
      {
        missingControllingExprInRepeatWhile();
      }
      """
    )
  }

  func testRecovery28() {
    assertParse(
      """
      repeat {
      } while { true }()
      """,
      diagnostics: [
        // TODO: Old parser expected error on line 2: missing condition in 'while' statement
        // TODO: Old parser expected error on line 2: consecutive statements on a line must be separated by ';', Fix-It replacements: 10 - 10 = ';'
        // TODO: Old parser expected warning on line 2: result of call to closure returning 'Bool' is unused
      ]
    )
  }

  func testRecovery29() {
    // https://github.com/apple/swift/issues/42787
    assertParse(
      """
      repeat {
      }1️⃣
      """,
      diagnostics: [
        DiagnosticSpec(message: "expected 'while' and condition in 'repeat' statement")
      ]
    )
  }

  func testRecovery30() {
    assertParse(
      """
      for 1️⃣; {
      }
      """,
      diagnostics: [
        DiagnosticSpec(message: "expected pattern, 'in', and expression in 'for' statement"),
        DiagnosticSpec(message: "unexpected ';' separator"),
      ]
    )
  }

  func testRecovery31() {
    assertParse(
      """
      for 1️⃣;
        {
        }
      """,
      diagnostics: [
        DiagnosticSpec(message: "expected pattern, 'in', and expression in 'for' statement"),
        DiagnosticSpec(message: "unexpected ';' separator"),
      ]
    )
  }

  func testRecovery32() {
    assertParse(
      """
      for 1️⃣; true {
      }
      """,
      diagnostics: [
        DiagnosticSpec(message: "expected pattern, 'in', and expression in 'for' statement"),
        DiagnosticSpec(message: "unexpected code '; true' in 'for' statement"),
      ]
    )
  }

  func testRecovery33() {
    assertParse(
      """
      for var i 1️⃣= 0; true {
        i += 1
      }
      """,
      diagnostics: [
        DiagnosticSpec(message: "expected 'in' and expression in 'for' statement"),
        DiagnosticSpec(message: "unexpected code '= 0; true' in 'for' statement"),
      ]
    )
  }

  func testRecovery34() {
    assertParse(
      """
      for1️⃣
      """,
      diagnostics: [
        DiagnosticSpec(message: "expected pattern, 'in', expression, and body in 'for' statement")
      ]
    )
  }

  func testRecovery35() {
    assertParse(
      """
      for 1️⃣{
      }
      """,
      diagnostics: [
        DiagnosticSpec(locationMarker: "1️⃣", message: "expected pattern, 'in', and expression in 'for' statement")
      ]
    )
  }

  func testRecovery36() {
    assertParse(
      """
      for1️⃣
      {
      }
      """,
      diagnostics: [
        DiagnosticSpec(locationMarker: "1️⃣", message: "expected pattern, 'in', and expression in 'for' statement")
      ]
    )
  }

  func testRecovery37() {
    assertParse(
      """
      for i 1️⃣{
      }
      """,
      diagnostics: [
        DiagnosticSpec(locationMarker: "1️⃣", message: "expected 'in' and expression in 'for' statement")
      ]
    )
  }

  func testRecovery38() {
    assertParse(
      """
      for var i 1️⃣{
      }
      """,
      diagnostics: [
        DiagnosticSpec(locationMarker: "1️⃣", message: "expected 'in' and expression in 'for' statement")
      ]
    )
  }

  func testRecovery39() {
    assertParse(
      """
      for 1️⃣in 2️⃣{
      }
      """,
      diagnostics: [
        DiagnosticSpec(locationMarker: "1️⃣", message: "keyword 'in' cannot be used as an identifier here"),
        DiagnosticSpec(locationMarker: "2️⃣", message: "expected 'in' and expression in 'for' statement"),
      ]
    )
  }

  func testRecovery40() {
    assertParse(
      """
      for 1️⃣0..<12 {
      }
      """,
      diagnostics: [
        DiagnosticSpec(message: "expected pattern and 'in' in 'for' statement")
      ]
    )
  }

  func testRecovery41() {
    assertParse(
      """
      for 1️⃣for in 2️⃣{
      }
      """,
      diagnostics: [
        DiagnosticSpec(locationMarker: "1️⃣", message: "keyword 'for' cannot be used as an identifier here"),
        DiagnosticSpec(locationMarker: "2️⃣", message: "expected Sequence expression for for-each loop"),
      ]
    )
  }

  func testRecovery42() {
    assertParse(
      """
      for i in 1️⃣{
      }
      """,
      diagnostics: [
        DiagnosticSpec(message: "expected Sequence expression for for-each loop")
      ]
    )
  }

  func testRecovery43() {
    assertParse(
      """
      // https://github.com/apple/swift/issues/48502
      struct User { let name: String? }
      """
    )
  }

  func testRecovery44() {
    assertParse(
      #"""
      let users = [User]()
      for user in users 1️⃣whe {
        if let name = user.name {
          let key = "\(name)"
        }
      }
      """#,
      diagnostics: [
        DiagnosticSpec(message: "unexpected code 'whe' in 'for' statement")
      ]
    )
  }

  func testRecovery45a() {
    assertParse(
      """
      for 1️⃣
        2️⃣;
      }
      """,
      diagnostics: [
        DiagnosticSpec(locationMarker: "1️⃣", message: "expected pattern, 'in', and expression in 'for' statement"),
        DiagnosticSpec(locationMarker: "1️⃣", message: "expected '{' in 'for' statement"),
        DiagnosticSpec(locationMarker: "2️⃣", message: "standalone ';' statements are not allowed"),
      ]
    )
  }

  func testRecovery45b() {
    assertParse(
      """
      switch1️⃣
      """,
      diagnostics: [
        DiagnosticSpec(message: "expected expression and '{}' to end 'switch' statement")
      ]
    )
  }

  func testRecovery46() {
    assertParse(
      """
      switch 1️⃣{
      }
      """,
      diagnostics: [
        DiagnosticSpec(locationMarker: "1️⃣", message: "expected expression in 'switch' statement")
      ]
    )
  }

  func testRecovery47() {
    assertParse(
      """
      switch 1️⃣
      {
      }
      """,
      diagnostics: [
        DiagnosticSpec(locationMarker: "1️⃣", message: "expected expression in 'switch' statement")
      ]
    )
  }

  func testRecovery48() {
    assertParse(
      """
      switch 1️⃣{
        2️⃣case _: return
      }
      """,
      diagnostics: [
        DiagnosticSpec(locationMarker: "1️⃣", message: "expected expression in 'switch' statement")
      ]
    )
  }

  func testRecovery49() {
    assertParse(
      """
      switch 1️⃣{
        case Int: return
        case _: return
      }
      """,
      diagnostics: [
        DiagnosticSpec(locationMarker: "1️⃣", message: "expected expression in 'switch' statement")
        // TODO: Old parser expected error on line 2: 'is' keyword required to pattern match against type name, Fix-It replacements: 10 - 10 = 'is '
      ]
    )
  }

  func testRecovery50() {
    assertParse(
      """
      switch 1️⃣{ 2️⃣42 } {
        3️⃣case _: return
      }
      """,
      diagnostics: [
        DiagnosticSpec(locationMarker: "1️⃣", message: "expected expression in 'switch' statement"),
        DiagnosticSpec(locationMarker: "2️⃣", message: "all statements inside a switch must be covered by a 'case' or 'default' label"),
        DiagnosticSpec(locationMarker: "3️⃣", message: "'case' can only appear inside a 'switch' statement or 'enum' declaration"),
      ]
    )
  }

  func testRecovery51() {
    assertParse(
      """
      switch 1️⃣{ 2️⃣42 }()3️⃣ {
        4️⃣case _: return
      }
      """,
      diagnostics: [
        DiagnosticSpec(locationMarker: "1️⃣", message: "expected expression in 'switch' statement"),
        DiagnosticSpec(locationMarker: "2️⃣", message: "all statements inside a switch must be covered by a 'case' or 'default' label"),
        DiagnosticSpec(locationMarker: "3️⃣", message: "consecutive statements on a line must be separated by ';'"),
        DiagnosticSpec(locationMarker: "4️⃣", message: "'case' can only appear inside a 'switch' statement or 'enum' declaration"),
      ]
    )
  }

  //===--- Recovery for missing braces in nominal type decls.
  func testRecovery54() {
    assertParse(
      """
      struct NoBracesStruct11️⃣()
      """,
      diagnostics: [
        DiagnosticSpec(message: "expected member block in struct")
      ]
    )
  }

  func testRecovery55() {
    assertParse(
      """
      enum NoBracesUnion11️⃣()
      class NoBracesClass12️⃣()
      protocol NoBracesProtocol13️⃣()
      extension NoBracesStruct14️⃣()
      """,
      diagnostics: [
        DiagnosticSpec(locationMarker: "1️⃣", message: "expected '{' in enum"),
        DiagnosticSpec(locationMarker: "1️⃣", message: "unexpected code '()' before class"),
        DiagnosticSpec(locationMarker: "2️⃣", message: "expected '{' in class"),
        DiagnosticSpec(locationMarker: "2️⃣", message: "unexpected code '()' before protocol"),
        DiagnosticSpec(locationMarker: "3️⃣", message: "expected '{' in protocol"),
        DiagnosticSpec(locationMarker: "3️⃣", message: "unexpected code '()' before extension"),
        DiagnosticSpec(locationMarker: "4️⃣", message: "expected member block in extension"),
        DiagnosticSpec(locationMarker: "4️⃣", message: "expected '}' to end protocol"),
        DiagnosticSpec(locationMarker: "4️⃣", message: "expected '}' to end class"),
        DiagnosticSpec(locationMarker: "4️⃣", message: "expected '}' to end enum"),
      ]
    )
  }

  func testRecovery56() {
    assertParse(
      """
      struct NoBracesStruct2 1️⃣
      enum NoBracesUnion2 2️⃣
      class NoBracesClass2 3️⃣
      protocol NoBracesProtocol2 4️⃣
      extension NoBracesStruct25️⃣
      """,
      diagnostics: [
        DiagnosticSpec(locationMarker: "1️⃣", message: "expected '{' in struct"),
        DiagnosticSpec(locationMarker: "2️⃣", message: "expected '{' in enum"),
        DiagnosticSpec(locationMarker: "3️⃣", message: "expected '{' in class"),
        DiagnosticSpec(locationMarker: "4️⃣", message: "expected '{' in protocol"),
        DiagnosticSpec(locationMarker: "5️⃣", message: "expected member block in extension"),
        DiagnosticSpec(locationMarker: "5️⃣", message: "expected '}' to end protocol"),
        DiagnosticSpec(locationMarker: "5️⃣", message: "expected '}' to end class"),
        DiagnosticSpec(locationMarker: "5️⃣", message: "expected '}' to end enum"),
        DiagnosticSpec(locationMarker: "5️⃣", message: "expected '}' to end struct"),
      ]
    )
  }

  //===--- Recovery for multiple identifiers in decls
  func testRecovery58() {
    assertParse(
      """
      protocol Multi 1️⃣ident {}
      """,
      diagnostics: [
        DiagnosticSpec(message: "found an unexpected second identifier in protocol")
      ]
    )
  }

  func testRecovery60() {
    assertParse(
      """
      class CCC 1️⃣CCC<T> {}
      """,
      diagnostics: [
        DiagnosticSpec(message: "found an unexpected second identifier in class")
      ],
      fixedSource: """
        class CCCCCC<T> {}
        """
    )
  }

  func testRecovery62() {
    assertParse(
      """
      enum EE 1️⃣EE<T> where T : Multi {
        case a2️⃣ 3️⃣a
        case b
      }
      """,
      diagnostics: [
        DiagnosticSpec(locationMarker: "1️⃣", message: "found an unexpected second identifier in enum"),
        DiagnosticSpec(locationMarker: "2️⃣", message: "consecutive declarations on a line must be separated by ';'"),
        DiagnosticSpec(locationMarker: "3️⃣", message: "unexpected code 'a' before enum case"),
      ]
    )
  }

  func testRecovery63() {
    assertParse(
      #"""
      struct SS 1️⃣SS : Multi {
        private var a 2️⃣b 3️⃣: Int = ""
        func f() {
          var c 4️⃣d = 5
          let _ = 0
        }
      }
      """#,
      diagnostics: [
        DiagnosticSpec(locationMarker: "1️⃣", message: "found an unexpected second identifier in struct"),
        DiagnosticSpec(locationMarker: "2️⃣", message: "expected ':' in type annotation"),
        DiagnosticSpec(locationMarker: "3️⃣", message: #"unexpected code ': Int = ""' before function"#),
        // TODO: (good first issue) Old parser expected error on line 4: found an unexpected second identifier in variable declaration; is there an accidental break?
        DiagnosticSpec(locationMarker: "4️⃣", message: "expected ':' in type annotation"),
      ]
    )
  }

  func testRecovery64() {
    assertParse(
      """
      let (efg 1️⃣hij, foobar) = (5, 6)
      """,
      diagnostics: [
        // TODO: (good first issue) Old parser expected error on line 1: found an unexpected second identifier in constant declaration; is there an accidental break?
        DiagnosticSpec(message: "unexpected code 'hij, foobar' in tuple pattern")
      ]
    )
  }

  func testRecovery65() {
    assertParse(
      """
      _ = foobar // OK.
      """
    )
  }

  //===--- Recovery for parse errors in types.

  func testRecovery67() {
    assertParse(
      """
      struct ErrorTypeInVarDecl1 {
        var v1 : 1️⃣
      }
      """,
      diagnostics: [
        DiagnosticSpec(message: "expected type in type annotation")
      ]
    )
  }

  func testRecovery68() {
    assertParse(
      """
      struct ErrorTypeInVarDecl2 {
        var v1 : Int.1️⃣
        var v2 : Int
      }
      """,
      diagnostics: [
        DiagnosticSpec(message: "expected name in member type")
      ]
    )
  }

  func testRecovery69() {
    assertParse(
      """
      struct ErrorTypeInVarDecl3 {
        var v1 : Int< 1️⃣
        var v2 : Int
      }
      """,
      diagnostics: [
        DiagnosticSpec(message: "expected '>' to end generic argument clause")
      ]
    )
  }

  func testRecovery70() {
    assertParse(
      """
      struct ErrorTypeInVarDecl4 {
        var v1 : Int<1️⃣,
        var v2 : Int
      }
      """,
      diagnostics: [
        DiagnosticSpec(message: "expected '>' to end generic argument clause")
      ]
    )
  }

  func testRecovery71() {
    assertParse(
      """
      struct ErrorTypeInVarDecl5 {
        var v1 : Int<Int 1️⃣
        var v2 : Int
      }
      """,
      diagnostics: [
        DiagnosticSpec(message: "expected '>' to end generic argument clause")
      ]
    )
  }

  func testRecovery72() {
    assertParse(
      """
      struct ErrorTypeInVarDecl6 {
        var v1 : Intℹ️<Int,
                     Int 1️⃣
        var v2 : Int
      }
      """,
      diagnostics: [
        DiagnosticSpec(message: "expected '>' to end generic argument clause", notes: [NoteSpec(message: "to match this opening '<'")])
      ]
    )
  }

  func testRecovery73() {
    assertParse(
      """
      struct ErrorTypeInVarDecl7 {
        var v1 : Int<Int, 1️⃣
        var v2 : Int
      }
      """,
      diagnostics: [
        DiagnosticSpec(message: "expected type in generic argument"),
        DiagnosticSpec(message: "expected '>' to end generic argument clause"),
      ]
    )
  }

  func testRecovery83() {
    assertParse(
      """
      struct ErrorTypeInVarDecl12 {
        var v1 : FooProtocol & 1️⃣
        var v2 : Int
      }
      """,
      diagnostics: [
        DiagnosticSpec(message: "expected type in type composition")
      ]
    )
  }

  func testRecovery84() {
    assertParse(
      """
      struct ErrorTypeInVarDecl13 {
        var v1 : 1️⃣& FooProtocol
        var v2 : Int
      }
      """,
      diagnostics: [
        DiagnosticSpec(message: "expected type in type composition")
      ]
    )
  }

  func testRecovery85() {
    assertParse(
      """
      struct ErrorTypeInVarDecl16 {
        var v1 : FooProtocol & 1️⃣
        var v2 : Int
      }
      """,
      diagnostics: [
        DiagnosticSpec(message: "expected type in type composition")
      ]
    )
  }

  func testRecovery86() {
    assertParse(
      """
      func ErrorTypeInPattern4(_: FooProtocol & 1️⃣) { }
      """,
      diagnostics: [
        DiagnosticSpec(message: "expected type in type composition")
      ]
    )
  }

  func testRecovery87() {
    assertParse(
      """
      struct ErrorGenericParameterList1<1️⃣
      """,
      diagnostics: [
        DiagnosticSpec(message: "expected '>' to end generic parameter clause"),
        DiagnosticSpec(message: "expected member block in struct"),
      ]
    )
  }

  func testRecovery87b() {
    assertParse(
      """
      struct ErrorGenericParameterList1<each1️⃣
      """,
      diagnostics: [
        DiagnosticSpec(message: "expected name in generic parameter"),
        DiagnosticSpec(message: "expected '>' to end generic parameter clause"),
        DiagnosticSpec(message: "expected member block in struct"),
      ]
    )
  }

  func testRecovery88() {
    assertParse(
      """
      struct ErrorGenericParameterList2<T1️⃣
      """,
      diagnostics: [
        DiagnosticSpec(message: "expected '>' to end generic parameter clause"),
        DiagnosticSpec(message: "expected member block in struct"),
      ]
    )
  }

  func testRecovery89() {
    assertParse(
      """
      struct ErrorGenericParameterList3<T,1️⃣
      """,
      diagnostics: [
        DiagnosticSpec(message: "expected generic parameter in generic parameter clause"),
        DiagnosticSpec(message: "expected '>' to end generic parameter clause"),
        DiagnosticSpec(message: "expected member block in struct"),
      ]
    )
  }

  func testRecovery90() {
    assertParse(
      """
      // Note: Don't move braces to a different line here.
      struct ErrorGenericParameterList4< 1️⃣
      {
      }
      """,
      diagnostics: [
        DiagnosticSpec(message: "expected '>' to end generic parameter clause")
      ]
    )
  }

  func testRecovery91() {
    assertParse(
      """
      // Note: Don't move braces to a different line here.
      struct ErrorGenericParameterList5<T 1️⃣
      {
      }
      """,
      diagnostics: [
        DiagnosticSpec(message: "expected '>' to end generic parameter clause")
      ]
    )
  }

  func testRecovery92() {
    assertParse(
      """
      // Note: Don't move braces to a different line here.
      struct ErrorGenericParameterList6<T, 1️⃣
      {
      }
      """,
      diagnostics: [
        DiagnosticSpec(message: "expected generic parameter in generic parameter clause"),
        DiagnosticSpec(message: "expected '>' to end generic parameter clause"),
      ]
    )
  }

  func testRecovery93() {
    assertParse(
      """
      struct ErrorTypeInVarDeclFunctionType1 {
        var v1 : () -> 1️⃣
        var v2 : Int
      }
      """,
      diagnostics: [
        DiagnosticSpec(message: "expected return type in function type")
      ]
    )
  }

  func testRecovery98a() {
    assertParse(
      """
      let a1: Swift.Int1️⃣]
      """,
      diagnostics: [
        DiagnosticSpec(message: "extraneous code ']' at top level")
      ]
    )
  }

  func testRecovery98b() {
    assertParse(
      """
      let a2: Set<Int1️⃣]>
      """,
      diagnostics: [
        DiagnosticSpec(message: "expected '>' to end generic argument clause"),
        DiagnosticSpec(message: "extraneous code ']>' at top level"),
      ]
    )
  }

  func testRecovery98c() {
    assertParse(
      """
      let a3: Set<Int>1️⃣]
      """,
      diagnostics: [
        // TODO: Old parser expected error on line 4: unexpected ']' in type; did you mean to write an array type?, Fix-It replacements: 11 - 11 = '['
        DiagnosticSpec(message: "extraneous code ']' at top level")
      ]
    )
  }

  func testRecovery98d() {
    assertParse(
      """
      let a4: Int1️⃣]?
      """,
      diagnostics: [
        // TODO: Old parser expected error on line 5: unexpected ']' in type; did you mean to write an array type?, Fix-It replacements: 11 - 11 = '['
        DiagnosticSpec(message: "extraneous code ']?' at top level")
      ]
    )
  }

  func testRecovery98e() {
    assertParse(
      """
      let a5: Int?1️⃣]
      """,
      diagnostics: [
        // TODO: Old parser expected error on line 6: unexpected ']' in type; did you mean to write an array type?, Fix-It replacements: 11 - 11 = '['
        DiagnosticSpec(message: "extraneous code ']' at top level")
      ]
    )
  }

  func testRecovery98f() {
    assertParse(
      """
      let a6: [Int]1️⃣]
      """,
      diagnostics: [
        // TODO: Old parser expected error on line 7: unexpected ']' in type; did you mean to write an array type?, Fix-It replacements: 11 - 11 = '['
        DiagnosticSpec(message: "extraneous code ']' at top level")
      ]
    )
  }

  func testRecovery98g() {
    assertParse(
      """
      let a7: [String: Int]1️⃣]
      """,
      diagnostics: [
        // TODO: Old parser expected error on line 8: unexpected ']' in type; did you mean to write an array type?, Fix-It replacements: 11 - 11 = '['
        DiagnosticSpec(message: "extraneous code ']' at top level")
      ]
    )
  }

  func testRecovery99() {
    assertParse(
      """
      struct ErrorTypeInVarDeclDictionaryType {
        let a1: String1️⃣:
        let a2: String2️⃣: Int]
        let a3: String3️⃣: [Int]
        let a4: String4️⃣: Int
      }
      """,
      diagnostics: [
        // TODO: Old parser expected error on line 2: unexpected ':' in type; did you mean to write a dictionary type?, Fix-It replacements: 11 - 11 = '['
        DiagnosticSpec(locationMarker: "1️⃣", message: "consecutive declarations on a line must be separated by ';'"),
        DiagnosticSpec(locationMarker: "1️⃣", message: "unexpected code ':' before variable"),
        // TODO: Old parser expected error on line 3: unexpected ':' in type; did you mean to write a dictionary type?, Fix-It replacements: 11 - 11 = '['
        DiagnosticSpec(locationMarker: "2️⃣", message: "unexpected code ': Int]' before variable"),
        // TODO: Old parser expected error on line 4: unexpected ':' in type; did you mean to write a dictionary type?, Fix-It replacements: 11 - 11 = '[', 24 - 24 = ']'
        DiagnosticSpec(locationMarker: "3️⃣", message: "unexpected code ': [Int]' before variable"),
        // TODO: Old parser expected error on line 5: unexpected ':' in type; did you mean to write a dictionary type?, Fix-It replacements: 11 - 11 = '[', 22 - 22 = ']'
        DiagnosticSpec(locationMarker: "4️⃣", message: "unexpected code ': Int' in struct"),
      ]
    )
  }

  func testRecovery100() {
    assertParse(
      """
      struct ErrorInFunctionSignatureResultArrayType1 {
        func foo() -> Int1️⃣[ {
          return [0]
        }  2️⃣
        func bar() -> Int3️⃣] {
          return [0]
        }
      4️⃣}
      """,
      diagnostics: [
        DiagnosticSpec(locationMarker: "1️⃣", message: "expected '}' to end struct"),
        DiagnosticSpec(locationMarker: "2️⃣", message: "expected ']' to end array"),
        // TODO: Old parser expected error on line 5: unexpected ']' in type; did you mean to write an array type?, Fix-It replacements: 17 - 17 = '['
        DiagnosticSpec(locationMarker: "3️⃣", message: "unexpected code ']' in function"),
        DiagnosticSpec(locationMarker: "4️⃣", message: "extraneous brace at top level"),
      ]
    )
  }

  func testRecovery101() {
    assertParse(
      """
      struct ErrorInFunctionSignatureResultArrayType2 {
        func foo() -> Int1️⃣[0 {
          return [0]
        }2️⃣
      3️⃣}
      """,
      diagnostics: [
        // TODO: Old parser expected error on line 2: expected ']' in array type
        // TODO: Old parser expected note on line 2: to match this opening '['
        DiagnosticSpec(locationMarker: "1️⃣", message: "expected '}' to end struct"),
        DiagnosticSpec(locationMarker: "2️⃣", message: "expected ']' to end array"),
        DiagnosticSpec(locationMarker: "3️⃣", message: "extraneous brace at top level"),
      ]
    )
  }

  func testRecovery102() {
    assertParse(
      """
      struct ErrorInFunctionSignatureResultArrayType3 {
        func foo() -> Int1️⃣[0] {
          return [0]
        }
      }
      """,
      diagnostics: [
        // TODO: Old parser expected error on line 2: array types are now written with the brackets around the element type, Fix-It replacements: 17 - 17 = '[', 20 - 21 = ''
        DiagnosticSpec(message: "unexpected code '[0]' in function")
      ]
    )
  }

  func testRecovery103() {
    assertParse(
      """
      struct ErrorInFunctionSignatureResultArrayType4 {
        func foo() -> Int1️⃣[0_1] {
          return [0]
        }
      }
      """,
      diagnostics: [
        // TODO: Old parser expected error on line 2: array types are now written with the brackets around the element type, Fix-It replacements: 17 - 17 = '[', 20 - 21 = ''
        DiagnosticSpec(message: "unexpected code '[0_1]' in function")
      ]
    )
  }

  func testRecovery104() {
    assertParse(
      """
      struct ErrorInFunctionSignatureResultArrayType5 {
        func foo() -> Int1️⃣[0b1] {
          return [0]
        }
      }
      """,
      diagnostics: [
        // TODO: Old parser expected error on line 2: array types are now written with the brackets around the element type, Fix-It replacements: 17 - 17 = '[', 20 - 21 = ''
        DiagnosticSpec(message: "unexpected code '[0b1]' in function")
      ]
    )
  }

  func testRecovery105() {
    assertParse(
      """
      struct ErrorInFunctionSignatureResultArrayType11 {
        func foo() -> Int1️⃣[(a){a++}] {
        }
      2️⃣}
      """,
      diagnostics: [
        DiagnosticSpec(locationMarker: "1️⃣", message: "expected '}' to end struct"),
        DiagnosticSpec(locationMarker: "2️⃣", message: "extraneous brace at top level"),
      ]
    )
  }

  func testRecovery106() {
    assertParse(
      """
      //===--- Recovery for missing initial value in var decls.
      """
    )
  }

  func testRecovery107() {
    assertParse(
      """
      struct MissingInitializer1 {
        var v1 : Int = 1️⃣
      }
      """,
      diagnostics: [
        DiagnosticSpec(message: "expected expression in variable")
      ]
    )
  }

  func testRecovery108() {
    assertParse(
      """
      //===--- Recovery for expr-postfix.
      """
    )
  }

  func testRecovery109() {
    assertParse(
      """
      func exprPostfix1(x : Int) {
        x.1️⃣
      }
      """,
      diagnostics: [
        DiagnosticSpec(message: "expected name in member access")
      ]
    )
  }

  func testRecovery110() {
    assertParse(
      """
      func exprPostfix2() {
        _ = .1️⃣42
      }
      """,
      diagnostics: [
        // TODO: Old parser expected error on line 2: '.42' is not a valid floating point literal; it must be written '0.42', Fix-It replacements: 7 - 7 = '0'
        DiagnosticSpec(message: "expected name in member access")
      ]
    )
  }

  func testRecovery111() {
    assertParse(
      """
      //===--- Recovery for expr-super.
      """
    )
  }

  func testRecovery112() {
    assertParse(
      """
      class Base {}
      """
    )
  }

  func testRecovery113() {
    assertParse(
      """
      class ExprSuper1 {
        init() {
          super
        }
      }
      """
    )
  }

  func testRecovery114() {
    assertParse(
      """
      class ExprSuper2 {
        init() {
          super.1️⃣
        }
      }
      """,
      diagnostics: [
        DiagnosticSpec(message: "expected name in member access")
      ]
    )
  }

  func testRecovery115() {
    assertParse(
      """
      //===--- Recovery for braces inside a nominal decl.
      """
    )
  }

  func testRecovery116() {
    assertParse(
      """
      struct BracesInsideNominalDecl1 {
        1️⃣{
          aaa
        }
        typealias A = Int
      }
      """,
      diagnostics: [
        DiagnosticSpec(message: "unexpected code before typealias declaration")
      ]
    )
  }

  func testRecovery117() {
    assertParse(
      """
      func use_BracesInsideNominalDecl1() {
        // Ensure that the typealias decl is not skipped.
        var _ : BracesInsideNominalDecl1.A // no-error
      }
      """
    )
  }

  func testRecovery118() {
    assertParse(
      #"""
      // https://github.com/apple/swift/issues/43383
      class С_43383 {
          1️⃣print(2️⃣"No one else was in the room where it happened")
      }
      """#,
      diagnostics: [
        DiagnosticSpec(locationMarker: "1️⃣", message: "expected 'func' in function"),
        DiagnosticSpec(locationMarker: "2️⃣", message: "expected type in parameter"),
        DiagnosticSpec(locationMarker: "2️⃣", message: #"unexpected code '"No one else was in the room where it happened"' in parameter clause"#),
      ]
    )
  }

  func testRecovery119() {
    assertParse(
      #"""
      extension С_43383 {
          1️⃣print(2️⃣"The room where it happened, the room where it happened")
      }
      """#,
      diagnostics: [
        DiagnosticSpec(locationMarker: "1️⃣", message: "expected 'func' in function"),
        DiagnosticSpec(locationMarker: "2️⃣", message: "expected type in parameter"),
        DiagnosticSpec(locationMarker: "2️⃣", message: #"unexpected code '"The room where it happened, the room where it happened"' in parameter clause"#),
      ]
    )
  }

  func testRecovery120() {
    assertParse(
      """
      //===--- Recovery for wrong decl introducer keyword.
      """
    )
  }

  func testRecovery121() {
    assertParse(
      """
      class WrongDeclIntroducerKeyword1 {
        1️⃣notAKeyword() {}
        func foo() {}
        class func bar() {}
      }
      """,
      diagnostics: [
        // TODO: Old parser expected error on line 2: expected 'func' keyword in instance method declaration
        DiagnosticSpec(message: "unexpected code 'notAKeyword() {}' before function")
      ]
    )
  }

  func testRecovery122() {
    assertParse(
      """
      //===--- Recovery for wrong inheritance clause.
      """
    )
  }

  func testRecovery123() {
    assertParse(
      """
      class Base2<T> {
      }
      """
    )
  }

  func testRecovery124() {
    assertParse(
      """
      class SubModule {
          class Base1 {}
          class Base2<T> {}
      }
      """
    )
  }

  func testRecovery125() {
    assertParse(
      """
      class WrongInheritanceClause11️⃣(Int) {}
      """,
      diagnostics: [
        // TODO: Old parser expected error on line 1: expected ':' to begin inheritance clause, Fix-It replacements: 30 - 31 = ': ', 34 - 35 = ''
        DiagnosticSpec(message: "unexpected code '(Int)' in class")
      ]
    )
  }

  func testRecovery126() {
    assertParse(
      """
      class WrongInheritanceClause21️⃣(Base2<Int>) {}
      """,
      diagnostics: [
        // TODO: Old parser expected error on line 1: expected ':' to begin inheritance clause, Fix-It replacements: 30 - 31 = ': ', 41 - 42 = ''
        DiagnosticSpec(message: "unexpected code '(Base2<Int>)' in class")
      ]
    )
  }

  func testRecovery127() {
    assertParse(
      """
      class WrongInheritanceClause3<T>1️⃣(SubModule.Base1) where T:AnyObject {}
      """,
      diagnostics: [
        // TODO: Old parser expected error on line 1: expected ':' to begin inheritance clause, Fix-It replacements: 33 - 34 = ': ', 49 - 50 = ''
        DiagnosticSpec(message: "unexpected code '(SubModule.Base1) where T:AnyObject' in class")
      ]
    )
  }

  func testRecovery128() {
    assertParse(
      """
      class WrongInheritanceClause41️⃣(SubModule.Base2<Int>) {}
      """,
      diagnostics: [
        // TODO: Old parser expected error on line 1: expected ':' to begin inheritance clause, Fix-It replacements: 30 - 31 = ': ', 51 - 52 = ''
        DiagnosticSpec(message: "unexpected code '(SubModule.Base2<Int>)' in class")
      ]
    )
  }

  func testRecovery129() {
    assertParse(
      """
      class WrongInheritanceClause5<T>1️⃣(SubModule.Base2<Int>) where T:AnyObject {}
      """,
      diagnostics: [
        // TODO: Old parser expected error on line 1: expected ':' to begin inheritance clause, Fix-It replacements: 33 - 34 = ': ', 54 - 55 = ''
        DiagnosticSpec(message: "unexpected code '(SubModule.Base2<Int>) where T:AnyObject' in class")
      ]
    )
  }

  func testRecovery130() {
    assertParse(
      """
      class WrongInheritanceClause61️⃣(Int 2️⃣{}3️⃣
      """,
      diagnostics: [
        // TODO: Old parser expected error on line 1: expected ':' to begin inheritance clause, Fix-It replacements: 30 - 31 = ': '
        DiagnosticSpec(locationMarker: "1️⃣", message: "expected '{' in class"),
        DiagnosticSpec(locationMarker: "1️⃣", message: "expected 'var' in variable"),
        DiagnosticSpec(locationMarker: "2️⃣", message: "expected ')' to end tuple pattern"),
        DiagnosticSpec(locationMarker: "3️⃣", message: "expected '}' to end class"),
      ]
    )
  }

  func testRecovery131() {
    assertParse(
      """
      class WrongInheritanceClause7<T>1️⃣(Int 2️⃣where T:AnyObject {}
      """,
      diagnostics: [
        // TODO: Old parser expected error on line 1: expected ':' to begin inheritance clause, Fix-It replacements: 33 - 34 = ': '
        DiagnosticSpec(locationMarker: "1️⃣", message: "expected '{' in class"),
        DiagnosticSpec(locationMarker: "1️⃣", message: "expected 'var' in variable"),
        DiagnosticSpec(locationMarker: "2️⃣", message: "expected ')' to end tuple pattern"),
        DiagnosticSpec(locationMarker: "2️⃣", message: "expected '}' to end class"),
        DiagnosticSpec(locationMarker: "2️⃣", message: "extraneous code 'where T:AnyObject {}' at top level"),
      ]
    )
  }

  func testRecovery132() {
    assertParse(
      """
      // <rdar://problem/18502220> [swift-crashes 078] parser crash on invalid cast in sequence expr
      Base=1 as Base=1
      """
    )
  }

  func testRecovery133() {
    assertParse(
      #"""
      // <rdar://problem/18634543> Parser hangs at swift::Parser::parseType
      public enum TestA {
        public static func convertFromExtenndition(
          s._core.count 1️⃣!= 0, "Can't form a Character from an empty String")
      }
      """#,
      diagnostics: [
        DiagnosticSpec(message: #"unexpected code '!= 0, "Can't form a Character from an empty String"' in parameter clause"#)
      ]
    )
  }

  func testRecovery134() {
    assertParse(
      #"""
      public enum TestB {
        public static func convertFromExtenndition(
          s._core.count 1️⃣?= 0, "Can't form a Character from an empty String")
      }
      """#,
      diagnostics: [
        DiagnosticSpec(message: #"unexpected code '?= 0, "Can't form a Character from an empty String"' in parameter clause"#)
      ]
    )
  }

  func testRecovery135() {
    assertParse(
      """
      // <rdar://problem/18634543> Infinite loop and unbounded memory consumption in parser
      class bar {}
      """
    )
  }

  func testRecovery136() {
    assertParse(
      """
      var baz: bar
      func foo1(bar!=baz) {}
      """,
      diagnostics: [
        // TODO: Old parser expected error on line 2: unnamed parameters must be written with the empty name '_'
      ]
    )
  }

  func testRecovery137() {
    assertParse(
      """
      func foo2(bar! = baz) {}
      """,
      diagnostics: [
        // TODO: Old parser expected error on line 1: unnamed parameters must be written with the empty name '_'
      ]
    )
  }

  func testRecovery138() {
    assertParse(
      """
      // rdar://19605567
      switch esp {
      case let (jeb):
        class Ceac<1️⃣}2️⃣> {}
      }
      """,
      diagnostics: [
        DiagnosticSpec(locationMarker: "1️⃣", message: "expected '>' to end generic parameter clause"),
        DiagnosticSpec(locationMarker: "1️⃣", message: "expected '{' in class"),
        DiagnosticSpec(locationMarker: "2️⃣", message: "unexpected code '> {}' in 'switch' statement"),
      ]
    )
  }

  func testRecovery141() {
    assertParse(
      """
      #if true
      // rdar://19605164
      struct Foo19605164 {
      func a(s: S1️⃣[{{g2️⃣) -> Int {}
      }}3️⃣}
      #endif
      """,
      diagnostics: [
        DiagnosticSpec(locationMarker: "1️⃣", message: "expected ')' to end parameter clause"),
        DiagnosticSpec(locationMarker: "1️⃣", message: "expected '}' to end struct"),
        DiagnosticSpec(locationMarker: "2️⃣", message: "unexpected code ') -> Int {}' in closure"),
        DiagnosticSpec(locationMarker: "3️⃣", message: "expected ']' to end array"),
        DiagnosticSpec(locationMarker: "3️⃣", message: "unexpected brace in conditional compilation block"),
      ]
    )
  }

  func testRecovery143() {
    assertParse(
      """
      // rdar://19605567
      func F() { init<1️⃣( 2️⃣} 3️⃣)}
      struct InitializerWithName {
        init 4️⃣x() {}5️⃣
      }
      """,
      diagnostics: [
        DiagnosticSpec(locationMarker: "1️⃣", message: "expected '>' to end generic parameter clause"),
        DiagnosticSpec(locationMarker: "2️⃣", message: "expected type and ')' to end parameter clause"),
        DiagnosticSpec(locationMarker: "3️⃣", message: "unexpected code ')}' before struct"),
        DiagnosticSpec(locationMarker: "4️⃣", message: "initializers cannot have a name", fixIts: ["remove 'x'"]),
      ]
    )
  }

  func testRecovery144() {
    assertParse(
      """
      init 1️⃣a(b: Int) {}
      """,
      diagnostics: [
        DiagnosticSpec(message: "initializers cannot have a name", fixIts: ["remove 'a'"])
      ],
      fixedSource: """
        init(b: Int) {}
        """
    )
  }

  func testRecovery145() {
    assertParse(
      """
      init? 1️⃣c(_ d: Int) {}
      """,
      diagnostics: [
        DiagnosticSpec(message: "initializers cannot have a name", fixIts: ["remove 'c'"])
      ],
      fixedSource: """
        init?(_ d: Int) {}
        """
    )
  }

  func testRecovery146() {
    assertParse(
      """
      init 1️⃣e<T>(f: T) {}
      """,
      diagnostics: [
        DiagnosticSpec(message: "initializers cannot have a name", fixIts: ["remove 'e<T>'"])
      ],
      fixedSource: """
        init(f: T) {}
        """
    )
  }

  func testRecovery147() {
    assertParse(
      """
      init? 1️⃣g<T>(_: T) {}
      """,
      diagnostics: [
        DiagnosticSpec(message: "initializers cannot have a name", fixIts: ["remove 'g<T>'"])
      ],
      fixedSource: """
        init?(_: T) {}
        """
    )
  }

  func testRecovery148() {
    assertParse(
      """
      init 1️⃣c d: Int 2️⃣{}
      """,
      diagnostics: [
        DiagnosticSpec(locationMarker: "1️⃣", message: "expected '(' to start parameter clause"),
        DiagnosticSpec(locationMarker: "2️⃣", message: "expected ')' to end parameter clause"),
      ]
    )
  }

  func testRecovery150() {
    assertParse(
      """
      let n 1️⃣== C { get {}
      }
      """,
      diagnostics: [
        DiagnosticSpec(message: "extraneous code at top level")
      ]
    )
  }

  func testRecovery151() {
    assertParse(
      #"""
      // <rdar://problem/20489838> QoI: Nonsensical error and fixit if "let" is missing between 'if let ... where' clauses
      if let y = x 1️⃣where y == 0, let z = x {
        _ = y
        _ = z
      }2️⃣
      """#,
      diagnostics: [
        // TODO: Old parser expected error on line 4: expected ',' joining parts of a multi-clause condition, Fix-It replacements: 15 - 21 = ','
        DiagnosticSpec(locationMarker: "1️⃣", message: "expected '{' in 'if' statement"),
        DiagnosticSpec(locationMarker: "1️⃣", message: "unexpected code 'where y == 0,' before variable"),
        DiagnosticSpec(locationMarker: "2️⃣", message: "expected '}' to end 'if' statement"),
      ]
    )
  }

  func testRecovery152() {
    assertParse(
      """
      if var y = x, y == 0, var z = x {
        z = y; y = z
      }
      """
    )
  }

  func testRecovery153() {
    assertParse(
      """
      if var y = x, z = x {
        z = y; y = z
      }
      """,
      diagnostics: [
        // TODO: Old parser expected error on line 1: expected 'var' in conditional, Fix-It replacements: 17 - 17 = 'var '
      ]
    )
  }

  func testRecovery154() {
    assertParse(
      #"""
      // <rdar://problem/20883210> QoI: Following a "let" condition with boolean condition spouts nonsensical errors
      guard let x: Int? = 1, x == 1 else {  }
      """#
    )
  }

  func testRecovery156() {
    assertParse(
      """
      // rdar://20866942
      func testRefutableLet() {
        var e : Int?
        let x1️⃣? = e
      }
      """,
      diagnostics: [
        DiagnosticSpec(message: "unexpected code '? = e' in function")
      ]
    )
  }

  func testRecovery157() {
    assertParse(
      #"""
      // <rdar://problem/19833424> QoI: Bad error message when using Objective-C literals (@"Hello") in Swift files
      let myString = 1️⃣@"foo"
      """#,
      diagnostics: [
        // TODO: Old parser expected error on line 2: string literals in Swift are not preceded by an '@' sign, Fix-It replacements: 16 - 17 = ''
        DiagnosticSpec(message: "expected expression in variable"),
        DiagnosticSpec(message: #"extraneous code '@"foo"' at top level"#),
      ]
    )
  }

  func testRecovery158() {
    // <rdar://problem/16990885> support curly quotes for string literals
    assertParse(
      """
      let curlyQuotes1 = 1️⃣“hello world!”
      """,
      diagnostics: [
        DiagnosticSpec(message: #"unicode curly quote found; use '"' instead"#)
      ],
      fixedSource: """
        let curlyQuotes1 = "hello world!"
        """
    )
  }

  func testRecovery159() {
    assertParse(
      #"""
      let curlyQuotes2 = 1️⃣“hello world!"
      """#,
      diagnostics: [
        DiagnosticSpec(message: #"unicode curly quote found; use '"' instead"#)
      ],
      fixedSource: #"""
        let curlyQuotes2 = "hello world!"
        """#
    )
  }

  func testRecovery160() {
    // <rdar://problem/21196171> compiler should recover better from "unicode Specials" characters
    assertParse(
      #"""
      let 1️⃣￼tryx  = 123
      """#,
      diagnostics: [
        DiagnosticSpec(message: "invalid character in source file")
      ]
    )
  }

  func testRecovery161() {
    assertParse(
      """
      // <rdar://problem/21369926> Malformed Swift Enums crash playground service
      enum Rank: Int {
        case Ace = 1
        case Two = 2.1
      }
      """
    )
  }

  func testRecovery162() {
    assertParse(
      """
      // rdar://22240342 - Crash in diagRecursivePropertyAccess
      class r22240342 {
        lazy var xx: Int = {
          foo {
            let issueView = 42
            issueView.delegate = 12
          }
          return 42
          }()
      }
      """
    )
  }

  func testRecovery163() {
    assertParse(
      """
      // <rdar://problem/22387625> QoI: Common errors: 'let x= 5' and 'let x =5' could use Fix-its
      func r22387625() {
        let _= 5
        let _ =5
      }
      """,
      diagnostics: [
        // TODO: Old parser expected error on line 3: '=' must have consistent whitespace on both sides, Fix-It replacements: 8 - 8 = ' '
        // TODO: Old parser expected error on line 4: '=' must have consistent whitespace on both sides, Fix-It replacements: 10 - 10 = ' '
      ]
    )
  }

  func testRecovery164() {
    assertParse(
      """
      // https://github.com/apple/swift/issues/45723
      do {
        let _: Int= 5
        let _: Array<Int>= []
      }
      """,
      diagnostics: [
        // TODO: Old parser expected error on line 3: '=' must have consistent whitespace on both sides, Fix-It replacements: 13 - 13 = ' '
        // TODO: Old parser expected error on line 4: '=' must have consistent whitespace on both sides, Fix-It replacements: 20 - 20 = ' '
      ]
    )
  }

  func testRecovery165() {
    assertParse(
      """
      // <rdar://problem/23086402> Swift compiler crash in CSDiag
      protocol A23086402 {
        var b: B23086402 { get }
      }
      """
    )
  }

  func testRecovery166() {
    assertParse(
      """
      protocol B23086402 {
        var c: [String] { get }
      }
      """
    )
  }

  func testRecovery167() {
    assertParse(
      #"""
      func test23086402(a: A23086402) {
        print(a.b.c + "") // should not crash but: expected-error {{}}
      }
      """#
    )
  }

  func testRecovery168() {
    assertParse(
      #"""
      // <rdar://problem/23550816> QoI: Poor diagnostic in argument list of "print" (varargs related)
      // The situation has changed. String now conforms to the RangeReplaceableCollection protocol
      // and `ss + s` becomes ambiguous. Disambiguation is provided with the unavailable overload
      // in order to produce a meaningful diagnostics. (Related: <rdar://problem/31763930>)
      func test23550816(ss: [String], s: String) {
        print(ss + s)
      }
      """#
    )
  }

  func testRecovery169() {
    assertParse(
      """
      // <rdar://problem/23719432> [practicalswift] Compiler crashes on &(Int:_)
      func test23719432() {
        var x = 42
          &(Int:x)
      }
      """,
      diagnostics: [
        // TODO: Old parser expected error on line 4: '&' may only be used to pass an argument to inout parameter
      ]
    )
  }

  func testRecovery170() {
    assertParse(
      """
      // <rdar://problem/19911096> QoI: terrible recovery when using '·' for an operator
      infix operator 1️⃣· 2️⃣{
        associativity none precedence3️⃣ 150
      4️⃣}
      """,
      diagnostics: [
        DiagnosticSpec(locationMarker: "1️⃣", message: "'·' is considered an identifier and must not appear within an operator name"),
        DiagnosticSpec(locationMarker: "2️⃣", message: "operator should not be declared with body"),
        DiagnosticSpec(locationMarker: "3️⃣", message: "consecutive statements on a line must be separated by ';'"),
        DiagnosticSpec(locationMarker: "4️⃣", message: "extraneous brace at top level"),
      ]
    )
  }

  func testRecovery171() {
    assertParse(
      """
      infix operator -1️⃣@-class Recover1 {}
      """,
      diagnostics: [
        DiagnosticSpec(message: "'@-class' is not allowed in operator names")
      ]
    )
  }

  func testRecovery172() {
    assertParse(
      """
      prefix operator -1️⃣фф--class Recover2 {}
      """,
      diagnostics: [
        DiagnosticSpec(message: "'фф--class' is not allowed in operator names")
      ]
    )
  }

  func testRecovery173() {
    assertParse(
      #"""
      // <rdar://problem/21712891> Swift Compiler bug: String subscripts with range should require closing bracket.
      func r21712891(s : String) -> String {
        let a = s.startIndex..<s.startIndex
        _ = a
        // The specific errors produced don't actually matter, but we need to reject this.
        return "\(s[a1️⃣)"
      }
      """#,
      diagnostics: [
        DiagnosticSpec(message: "expected ']' to end subscript")
      ]
    )
  }

  func testRecovery174() {
    assertParse(
      #"""
      // <rdar://problem/24029542> "Postfix '.' is reserved" error message" isn't helpful
      func postfixDot(a : String) {
        _ = a.utf8
        _ = a1️⃣.   utf8
        _ = a.2️⃣
          a.3️⃣
      }
      """#,
      diagnostics: [
        DiagnosticSpec(locationMarker: "1️⃣", message: "extraneous whitespace after '.' is not permitted"),
        DiagnosticSpec(locationMarker: "2️⃣", message: "expected name in member access"),
        DiagnosticSpec(locationMarker: "3️⃣", message: "expected name in member access"),
      ]
    )
  }

  func testRecovery175() {
    assertParse(
      #"""
      // <rdar://problem/22290244> QoI: "UIColor." gives two issues, should only give one
      func f() { // expected-note 2{{did you mean 'f'?}}
        _ = ClassWithStaticDecls.1️⃣
      }
      """#,
      diagnostics: [
        DiagnosticSpec(message: "expected name in member access")
      ]
    )
  }

  func testRecovery176() {
    assertParse(
      """
      // rdar://problem/22478168
      // https://github.com/apple/swift/issues/53396
      func f_53396(a: Int 1️⃣== 0) {}
      """,
      diagnostics: [
        // TODO: Old parser expected error on line 3: expected '=' instead of '==' to assign default value for parameter, Fix-It replacements: 21 - 23 = '='
        DiagnosticSpec(message: "unexpected code '== 0' in parameter clause")
      ]
    )
  }

  func testRecovery177() {
    assertParse(
      """
      // rdar://38225184
      extension Collection where Element == Int 1️⃣&& Index == Int {}
      """,
      diagnostics: [
        DiagnosticSpec(message: "unexpected code '&& Index == Int' in extension")
        // TODO: Old parser expected error on line 1: expected ',' to separate the requirements of this 'where' clause, Fix-It replacements: 43 - 45 = ','
      ]
    )
  }

  func testRecovery179() {
    assertParse(
      """
      func testSkipUnbalancedParen() {1️⃣
        2️⃣?(
      }
      """,
      diagnostics: [
        DiagnosticSpec(locationMarker: "1️⃣", message: "expected '}' to end function"),
        DiagnosticSpec(locationMarker: "2️⃣", message: "extraneous code at top level"),
      ]
    )
  }

  func testRecovery180() {
    assertParse(
      """
      func testSkipToFindOpenBrace1() {
        do { if case 1️⃣}
      }2️⃣
      """,
      diagnostics: [
        DiagnosticSpec(locationMarker: "1️⃣", message: "expected expression, '=', and expression in pattern matching"),
        DiagnosticSpec(locationMarker: "1️⃣", message: "expected '{' in 'if' statement"),
        DiagnosticSpec(locationMarker: "2️⃣", message: "expected '}' to end function"),
      ]
    )
  }

  func testRecovery181() {
    assertParse(
      """
      func testSkipToFindOpenBrace2() {
        do { if true {} else 1️⃣false }
      }2️⃣
      """,
      diagnostics: [
        // TODO: Old parser expected error on line 2: expected '{' or 'if' after 'else'
        DiagnosticSpec(locationMarker: "1️⃣", message: "expected '{' in 'if' statement"),
        DiagnosticSpec(locationMarker: "2️⃣", message: "expected '}' to end function"),
      ]
    )
  }

  func testRecovery182() {
    assertParse(
      "func foo() 1️⃣bogus {}",
      diagnostics: [
        DiagnosticSpec(message: "unexpected code 'bogus' in function")
      ]
    )

    assertParse(
      "func foo() 1️⃣bogus -> Int {}",
      diagnostics: [
        DiagnosticSpec(message: "unexpected code 'bogus' in function signature")
      ]
    )
  }

}
