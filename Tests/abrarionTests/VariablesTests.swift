//
//  VariablesTests.swift
//  
//
//  Created by linhey on 2022/6/20.
//

import XCTest
import Features

class VariablesTests: XCTestCase {

    func testParse() async throws {
        let manager = VariablesManager()
        manager.register(Variables(key: "key1", value: "value1"))
        let parse1 = try await manager.parse("${key1}")
        assert(parse1 == "value1")
        
        manager.register(Variables.init(key: "key2", value: {
            return "value2"
        }))
        let parse2 = try await manager.parse("${key2}")
        assert(parse2 == "value2")
    }
    
    func testParse2() async throws {
        let manager = VariablesManager()
        manager.register(Variables(key: "key1", value: "${key2}"))
        manager.register(Variables(key: "key2", value: "${key3}"))
        manager.register(Variables(key: "key3", value: "value"))
        let parse1 = try await manager.parse("${key1}")
        assert(parse1 == "value")
    }
    
    func test_package_name() async throws {
        if let url = URL(string: "git@github.com:AxApp/abrarion.git") {
            XCTAssertEqual(url.path.split(separator: "/").last?.split(separator: ".").first, "abrarion")
        }
        if let url = URL(string: "https://github.com/AxApp/abrarion.git") {
            XCTAssertEqual(url.path.split(separator: "/").last?.split(separator: ".").first, "abrarion")
        }
    }

}
