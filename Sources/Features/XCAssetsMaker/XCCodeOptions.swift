//
//  File.swift
//  
//
//  Created by linhey on 2022/6/20.
//

import Foundation
import Stem

struct XCCodeOptions {
    
    init(listProtocolName: String,
         instanceName: String,
         instanceProtocolName: String) {
        self.listProtocolName = listProtocolName
        self.instanceName = instanceName
        self.instanceProtocolName = instanceProtocolName
        self.listOutputPath = ""
        self.instanceOutputPath = ""
        self.bundleName = ""
    }
    
    let listProtocolName: String
    
    let instanceName: String
    let instanceProtocolName: String
    
    let listOutputPath: String
    let instanceOutputPath: String
    let bundleName: String
    
    init(from json: JSON, default model: XCCodeOptions) throws {
        self.listProtocolName = json["list_protocol_name"].string ?? model.listProtocolName
        self.instanceName = json["instance_name"].string ?? model.instanceName
        self.instanceProtocolName = json["instance_protocol_name"].string ?? model.instanceProtocolName
        self.instanceOutputPath = json["instance_output_path"].stringValue
        self.listOutputPath = json["list_output_path"].stringValue
        self.bundleName = json["bundle_name"].stringValue
        
        if bundleName.isEmpty {
            throw StemError(message: "参数缺失: bundle_name")
        }
        
        if listOutputPath.isEmpty {
            throw StemError(message: "参数缺失: list_output_path")
        }
        
        if instanceOutputPath.isEmpty {
            throw StemError(message: "参数缺失: instance_output_path")
        }
    }
    
}
