//
//  File.swift
//  
//
//  Created by linhey on 2022/6/30.
//

import Foundation
import XCTest
import Features
import Stem
import StemFilePath

final class XCDataAssetsMakerTests: XCTestCase {

    public struct JSONModeOptions: Codable {
        
        struct CodeOptions: Codable {
            var list_protocol_name: String = "DataInstanceList"
            var instance_name: String = "DataInstance"
            var instance_protocol_name: String = "DataInstanceListProtocol"
            var bundle_name: String = "bundle_name"
            var instance_output_path: String = "~/Downloads/Tests/codes/DataInstance.swift"
            var list_output_path: String = "~/Downloads/Tests/codes/DataInstanceList.swift"
        }
        
        var template_dependent_output = "~/Downloads/Tests/codes"
        var template: CodeOptions = .init()
        var contents: [String] = []
        var inputs: [String] = ["~/Downloads/Tests"]
        var output: String = "~/Downloads/Tests/resources"
        
    }
    
    var jsonEncoder = JSONEncoder()
    var workFolder  = STFolder("~/Downloads/Tests")

    func testMaker() async throws {
        try? workFolder.delete()
        
        try (0...100).forEach { index in
            try workFolder.create(file: "test_data_\(index).txt", data: "\(index)".data(using: .utf8))
        }
        
        let maker = XCDataMaker()
        let input = JSONModeOptions()
        let options = try await XCDataMaker.Options(from: JSON(data: jsonEncoder.encode(input)), variables: .init())
        try await maker.evaluate(options: options)
        
        try assert {
            try STFolder(input.template_dependent_output).subFilePaths().isEmpty == false
        }
        
        try assert {
            try STFolder(input.output).subFilePaths().isEmpty == false
        }
    }
    
}
