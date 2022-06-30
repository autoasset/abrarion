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
    
    var jsonEncoder = JSONEncoder()
    var workFolder = try! STFolder("~/Downloads/Tests")

    func testImageMaker() async throws {
        try? workFolder.delete()
        let file = try workFolder.create(file: "test_image.zip", data: Resource.testImageZip)
        await try StemShell.zsh("unzip \(file.attributes.name)", context: .init(at: workFolder.url, standardOutput: { str in
            print("==> ", str)
        }))
        try file.delete()
        let maker = XCImageMaker()
        let options = try XCImageMaker.JSONModeOptions(from: JSON(data: jsonEncoder.encode(ImageJSONModeOptions())))
        try await maker.evaluate(options: options)
    }
    
}
