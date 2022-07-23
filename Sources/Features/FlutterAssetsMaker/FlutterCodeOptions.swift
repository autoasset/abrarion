//
//  File.swift
//  
//
//  Created by linhey on 2022/7/22.
//

import Foundation
import Stem

public struct FlutterCodeOptions {
    
    let class_name: String
    let package_name: String
    
    public init(from json: JSON, variables: VariablesManager) async throws {
        self.class_name = try await variables.parse(json["class_name"].stringValue)
        self.package_name = try await variables.parse(json["package_name"].stringValue)
    }
    
}
