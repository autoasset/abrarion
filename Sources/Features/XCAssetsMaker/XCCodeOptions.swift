//
//  File.swift
//  
//
//  Created by linhey on 2022/6/20.
//

import Foundation
import Stem

struct XCCodeOptions {

    init(type: String) {
        self.list_protocol_name = "Abrarion\(type)ListProtocol"
        self.instance_name = "Abrarion\(type)Instance"
        self.instance_protocol_name = "Abrarion\(type)"
        self.list_output_path = ""
        self.instance_output_path = ""
        self.bundle_name = ""
        self.color_prefix_when_name_is_hex = "_"
    }
    
    let list_protocol_name: String
    
    let instance_name: String
    let instance_protocol_name: String
    
    let list_output_path: String
    let instance_output_path: String
    let bundle_name: String
    /// 当颜色色值与名称相同时所添加的前缀
    var color_prefix_when_name_is_hex: String    

    
    init?(from json: JSON, default model: XCCodeOptions, variables: VariablesManager) async throws {
        if !json.isExists {
            return nil
        }
        
        if let item = json["list_protocol_name"].string {
            self.list_protocol_name = try await variables.parse(item)
        } else {
            self.list_protocol_name = model.list_protocol_name
        }
        
        if let item = json["instance_name"].string {
            self.instance_name = try await variables.parse(item)
        } else {
            self.instance_name = model.instance_name
        }
        
        if let item = json["instance_protocol_name"].string {
            self.instance_protocol_name = try await variables.parse(item)
        } else {
            self.instance_protocol_name = model.instance_protocol_name
        }
        
        if let item = json["instance_output_path"].string {
            self.instance_output_path = try await variables.parse(item)
        } else {
            self.instance_output_path = model.instance_output_path
        }
        
        if let item = json["list_output_path"].string {
            self.list_output_path = try await variables.parse(item)
        } else {
            self.list_output_path = model.list_output_path
        }
        
        self.bundle_name = try await variables.parse(json["bundle_name"].stringValue)
        
        if bundle_name.isEmpty {
            throw StemError(message: "参数缺失: bundle_name")
        }
        
        if list_output_path.isEmpty {
            throw StemError(message: "参数缺失: list_output_path")
        }
        
        if instance_output_path.isEmpty {
            throw StemError(message: "参数缺失: instance_output_path")
        }
        
        self.color_prefix_when_name_is_hex = try await variables.parse(json["color_prefix_when_name_is_hex"].stringValue)
        if self.color_prefix_when_name_is_hex.isEmpty {
            self.color_prefix_when_name_is_hex = "_"
        }
    }
    
}
