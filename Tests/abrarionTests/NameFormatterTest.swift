//
//  NameFormatterTest.swift
//  UnitTest
//
//  Created by 林翰 on 2020/12/7.
//  Copyright © 2020 linhey.autoasset. All rights reserved.
//

import XCTest
import Features

class NameFormatterTest: XCTestCase {
    
    func testCamelCased() throws {
        let formatter = NameFormatter(language: .swift, splitSet: .decimalDigits.union(.letters).inverted)
        
        XCTAssertEqual(formatter.camelCased("12") , "12")
        XCTAssertEqual(formatter.camelCased("1 2"), "12")
        XCTAssertEqual(formatter.camelCased("1_2"), "12")
        XCTAssertEqual(formatter.camelCased("1-2"), "12")

        XCTAssertEqual(formatter.camelCased("add white"), "addWhite")
        XCTAssertEqual(formatter.camelCased("add_white"), "addWhite")
        XCTAssertEqual(formatter.camelCased("add-white"), "addWhite")

        XCTAssertEqual(formatter.camelCased("add  white"), "addWhite")
        XCTAssertEqual(formatter.camelCased("add__white"), "addWhite")
        XCTAssertEqual(formatter.camelCased("add--white"), "addWhite")

        XCTAssertEqual(formatter.camelCased("3d_touch_code"), "3dTouchCode")
        XCTAssertEqual(formatter.camelCased("class"), "`class`")
        XCTAssertEqual(formatter.camelCased("switch"), "`switch`")
    }
    
    
}
