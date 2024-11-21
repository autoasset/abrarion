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
import STJSON
import STFilePath
import Combine

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
    var workFolder = STFolder("~/Downloads/Tests")
    private var cancellables = Set<AnyCancellable>()
    
    func clear() async throws {
        try? workFolder.delete()
        let file = try workFolder.create(file: "iconfont.zip", data: Resource.iconfontZip)
        let context = StemShell.Context.init(at: workFolder.url, standardOutput: .init())
        context.standardOutput?.sink(receiveValue: { data in
            print(String(data: data, encoding: .utf8) ?? "")
        }).store(in: &cancellables)
        try await StemShell.zsh("unzip -d iconfont \(file.attributes.name)", context: context)
        try file.delete()
    }
    
    func testMaker() async throws {
        do {
            try await clear()
            let maker = XCIconFontMaker()
            let input = JSONModeOptions()
            let options = try await XCIconFontMaker.Options(from: JSON(data: jsonEncoder.encode(input)), variables: .init())
            try await maker.evaluate(options: options, context: .init())
            
            try assert {
                try STFolder(input.template_dependent_output).subFilePaths().isEmpty == false
            }
            
            try assert {
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
    
//    public struct FlutterModeOptions: Codable {
//
//        struct CodeOptions: Codable {
//            var font_package = "font_package"
//            var class_name = "class_name"
//            var list_output_path: String = "~/Downloads/Tests/codes/DataInstanceList.dart"
//        }
//
//        var template: CodeOptions = .init()
//        var input_json_file: String = "~/Downloads/Tests/iconfont/iconfont.json"
//        var input_font_file: String = "~/Downloads/Tests/iconfont/iconfont.ttf"
//        var output: String = "~/Downloads/resources"
//    }
//
//    func testFlutterMaker() async throws {
//        try await clear()
//        let maker = FlutterIconFontMaker()
//        let input = FlutterModeOptions()
//        let options = try await FlutterIconFontMaker.Options(from: JSON(data: jsonEncoder.encode(input)), variables: .init())
//        try? STFolder(input.output).delete()
//
//        try await maker.evaluate(options: options)
//        try assert {
//            try STFolder(input.output).subFilePaths().isEmpty == false
//        }
//    }
    
}
