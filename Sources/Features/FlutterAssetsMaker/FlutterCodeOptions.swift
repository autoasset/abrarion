//
//  File.swift
//  
//
//  Created by linhey on 2022/7/22.
//

import Foundation
import Stem
import STJSON
import STFilePath

public struct FlutterCodeOptions {
    
    let variable_name_type: VariableNameType
    /// 当颜色色值为Hex形式时所添加的前缀
    var color_prefix_when_name_is_hex: String
    let class_name: String
    let package_name: String
    let output: STFile?

    public init(from json: JSON, variables: VariablesManager) async throws {
        self.output =  try await variables.parse(json["output"].string).flatMap(STFile.init)
        self.variable_name_type = try await .init(rawValue: variables.parse(json["variable_name_type"].stringValue)) ?? .camel
        self.color_prefix_when_name_is_hex = try await variables.parse(json["color_prefix_when_name_is_hex"].stringValue)
        self.class_name = try await variables.parse(json["class_name"].stringValue)
        self.package_name = try await variables.parse(json["package_name"].stringValue)
        if color_prefix_when_name_is_hex.isEmpty {
            color_prefix_when_name_is_hex = "c_"
        }
    }
    
}
