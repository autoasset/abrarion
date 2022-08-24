//
//  File.swift
//  
//
//  Created by linhey on 2022/7/22.
//

import Foundation
import Logging
import StemFilePath
import Stem

public struct AndriodColorMaker: MissionInstance {
    
    public struct Options {
        
        /// 当颜色色值为Hex形式时所添加的前缀
        var color_prefix_when_name_is_hex: String
        let inputs: [String]
        let output_light: STFile
        let output_dark: STFile
        
        public init(from json: JSON, variables: VariablesManager) async throws {
            let color_prefix_when_name_is_hex = try await variables.parse(json["color_prefix_when_name_is_hex"].stringValue)
            if color_prefix_when_name_is_hex.isEmpty {
                self.color_prefix_when_name_is_hex = "c_"
            } else {
                self.color_prefix_when_name_is_hex = color_prefix_when_name_is_hex
            }
            self.output_light = try await STFile(variables.parse(json["output_light"].stringValue))
            self.output_dark  = try await STFile(variables.parse(json["output_dark"].stringValue))
            
            if let item = json["inputs"].string {
                self.inputs = [try await variables.parse(item)]
            } else {
                self.inputs = try await variables.parse(json["inputs"].arrayValue.compactMap(\.string))
            }
        }
    }
    
    public var logger: Logger?
    
    public init() {}
    
    public func evaluate(from json: JSON, context: MissionContext) async throws {
        let options = try await Options(from: json, variables: context.variables)
        let records = try await XCColorMaker().records(options.inputs)
        
        let light = records.map { record -> [String] in
            let color = record.any.hexString(.auto, prefix: .hashKey)
            return record.names.map { name in
                let name = AndroidVariable.parseColor(name: name, option: options)
                return "<color name=\"\(name)\">\(color)</color>"
            }
        }
            .joined()
            .sorted()
            .joined(separator: "\n")
        
        let dark = records.map { record -> [String] in
            let color = (record.dark ?? record.any).hexString(.auto, prefix: .hashKey)
            return record.names.map { name in
                let name = AndroidVariable.parseColor(name: name, option: options)
                return "<color name=\"\(name)\">\(color)</color>"
            }
        }
            .joined()
            .sorted()
            .joined(separator: "\n")
        
        try options.output_light.overlay(with:
        """
        <?xml version="1.0" encoding="utf-8"?>
        <resources>
        \(light)
        </resources>
        """.data(using: .utf8))
        
        try options.output_dark.overlay(with:
         """
         <?xml version="1.0" encoding="utf-8"?>
         <resources>
         \(dark)
         </resources>
         """.data(using: .utf8))
    }
    
}
