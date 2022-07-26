//
//  CocoapodsTest.swift
//  
//
//  Created by linhey on 2022/7/19.
//

import XCTest
import Stem
import Features

class CocoapodsTest: XCTestCase {

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testVersion() throws {
        print(Cocoapods().version)
    }
    
    func testRepositories() throws {
        let list = try Cocoapods().repositories()
        assert(list.isEmpty == false)
        print(list)
    }

    func testlibLint() throws {
        // try Cocoapods.libLint("/Users/linhey/Desktop/EmptyPage/EmptyPage.podspec")
        // try Cocoapods.libLint("/Users/linhey/Desktop/dxyerui/DxyerUI.podspec.json")
    }
}
