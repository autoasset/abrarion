//
//  XCImageAssetsMakerTests.swift
//  
//
//  Created by linhey on 2022/6/29.
//

import XCTest
import Features
import Stem
import StemFilePath
import Combine

final class XCImageAssetsMakerTests: XCTestCase {

    public struct ImageJSONModeOptions: Codable {
        
        struct CodeOptions: Codable {
            var list_protocol_name: String = "ImageInstanceList"
            var instance_name: String = "ImageInstance"
            var instance_protocol_name: String = "ImageInstanceListProtocol"
            var bundle_name: String = "bundle_name"
            var instance_output_path: String = "~/Downloads/Tests/codes/ImageInstance.swift"
            var list_output_path: String = "~/Downloads/Tests/codes/ImageInstanceList.swift"
        }
        
        struct VectorCodeOptions: Codable {
            var list_protocol_name: String = "VectorImageInstanceList"
            var instance_name: String = "VectorImageInstance"
            var instance_protocol_name: String = "VectorImageInstanceListProtocol"
            var bundle_name: String = "bundle_name"
            var instance_output_path: String = "~/Downloads/Tests/codes/VectorImageInstance.swift"
            var list_output_path: String = "~/Downloads/Tests/codes/VectorImageInstanceList.swift"
        }
        
        var template_dependent_output = "~/Downloads/Tests/codes"
        var template: CodeOptions = .init()
        var vector_template: VectorCodeOptions = .init()
        var contents: [String] = []
        var inputs: [String] = ["~/Downloads/Tests"]
        var output: String = "~/Downloads/Tests/resources"
        
    }
    
    var workFolder = STFolder("~/Downloads/Tests")
    
    func testImageMaker() async throws {
        try? workFolder.delete()
        let file = try workFolder.create(file: "test_image.zip", data: Resource.testImageZip)
        
        let context = StemShell.Context.init(at: workFolder.url, standardOutput: .init())
        context.standardOutput?.sink(receiveValue: { data in
            print(String(data: data, encoding: .utf8) ?? "")
        }).store(in: &Units.cancellables)
        try await StemShell.zsh("unzip \(file.attributes.name)", context: context)
        try file.delete()
        
        let maker = XCImageMaker()
        let input = ImageJSONModeOptions()
        let options = try await XCImageMaker.JSONModeOptions(from: JSON(data: Units.encode(input)), variables: .init())
        try await maker.evaluate(options: options)
        
        try assert {
            try STFolder(input.template_dependent_output).subFilePaths().isEmpty == false
        }
        
        try assert {
            try STFolder(input.output).subFilePaths().isEmpty == false
        }
    }
    
}


func assert(throwing: () async throws -> Bool) async rethrows {
   let flag = try await throwing()
    assert(flag)
}

func assert(throwing: () throws -> Bool) rethrows {
   let flag = try throwing()
    assert(flag)
}
