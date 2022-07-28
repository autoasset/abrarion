//
//  File.swift
//  
//
//  Created by linhey on 2022/7/22.
//

import Foundation
import Stem

public struct FlutterCodeOptions {
    
    enum VariableNameType: String {
        case camel
        case snake
        case none
    }
    
    let variable_name_type: VariableNameType
    /// 当首字母不是数字或者字母时用该前缀来替换首字母
    let prefix_replace_first_letter_when_first_letter_isnot_number_or_letter: String
    let class_name: String
    let package_name: String
    
    public init(from json: JSON, variables: VariablesManager) async throws {
        self.variable_name_type = try await .init(rawValue: variables.parse(json["variable_name_type"].stringValue)) ?? .camel
        self.prefix_replace_first_letter_when_first_letter_isnot_number_or_letter = try await variables.parse(json["prefix_replace_first_letter_when_first_letter_isnot_number_or_letter"].stringValue)
        self.class_name = try await variables.parse(json["class_name"].stringValue)
        self.package_name = try await variables.parse(json["package_name"].stringValue)
    }
    
}
