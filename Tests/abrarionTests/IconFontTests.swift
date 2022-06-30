//
//  IconFontTests.swift
//  
//
//  Created by linhey on 2022/6/30.
//

import XCTest
import XCTest
import Features
import Stem
import StemFilePath

class IconFontTests: XCTestCase {
    
    public struct JSONModeOptions: Codable {
        
        struct CodeOptions: Codable {
            var list_protocol_name: String = "DataInstanceList"
            var instance_name: String = "DataInstance"
            var instance_protocol_name: String = "DataInstanceListProtocol"
            var bundle_name: String = "bundle_name"
            var instance_output_path: String = "~/Downloads/Tests/codes/DataInstance.swift"
            var list_output_path: String = "~/Downloads/Tests/codes/DataInstanceList.swift"
        }
        
        var template: CodeOptions = .init()
        /// 依赖代码输出文件夹位置
        var template_dependent_output = "~/Downloads/Tests/codes"
        var input_json_file: String = "~/Downloads/Tests/iconfont/iconfont.json"
        var input_font_file: String = "~/Downloads/Tests/iconfont/iconfont.ttf"
        var output: String = "~/Downloads/resources"
    }
    
    var jsonEncoder = JSONEncoder()
    var workFolder = try! STFolder("~/Downloads/Tests")
    
    func testMaker() async throws {
        do {
            try? workFolder.delete()
            let file = try workFolder.create(file: "iconfont.zip", data: Resource.iconfontZip)
            try await StemShell.zsh("unzip -d iconfont \(file.attributes.name)", context: .init(at: workFolder.url, standardOutput: { str in
                print("==> ", str)
            }))
            try file.delete()
            let maker = XCIconFontMaker()
            let input = JSONModeOptions()
            let options = try XCIconFontMaker.JSONModeOptions(from: JSON(data: jsonEncoder.encode(input)))
            try await maker.evaluate(options: options)
            
            try await assert {
                try STFolder(input.template_dependent_output).subFilePaths().isEmpty == false
            }
            
            try await assert {
                try STFolder(input.output).subFilePaths().isEmpty == false
            }
        } catch let DecodingError.dataCorrupted(context) {
            print(context)
        } catch let DecodingError.keyNotFound(key, context) {
            print("Key '\(key)' not found:", context.debugDescription)
            print("codingPath:", context.codingPath)
        } catch let DecodingError.valueNotFound(value, context) {
            print("Value '\(value)' not found:", context.debugDescription)
            print("codingPath:", context.codingPath)
        } catch let DecodingError.typeMismatch(type, context)  {
            print("Type '\(type)' mismatch:", context.debugDescription)
            print("codingPath:", context.codingPath)
        } catch {
            throw error
        }
    }
    
}
