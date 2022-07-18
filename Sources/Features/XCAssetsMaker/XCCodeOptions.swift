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
    }
    
    let list_protocol_name: String
    
    let instance_name: String
    let instance_protocol_name: String
    
    let list_output_path: String
    let instance_output_path: String
    let bundle_name: String
    
    init(from json: JSON, default model: XCCodeOptions) throws {
        self.list_protocol_name = json["list_protocol_name"].string ?? model.list_protocol_name
        self.instance_name = json["instance_name"].string ?? model.instance_name
        self.instance_protocol_name = json["instance_protocol_name"].string ?? model.instance_protocol_name
        self.instance_output_path = json["instance_output_path"].stringValue
        self.list_output_path = json["list_output_path"].stringValue
        self.bundle_name = json["bundle_name"].stringValue
        
        if bundle_name.isEmpty {
            throw StemError(message: "参数缺失: bundle_name")
        }
        
        if list_output_path.isEmpty {
            throw StemError(message: "参数缺失: list_output_path")
        }
        
        if instance_output_path.isEmpty {
            throw StemError(message: "参数缺失: instance_output_path")
        }
    }
    
}
