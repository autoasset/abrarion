//
//  File.swift
//  
//
//  Created by linhey on 2022/2/19.
//

import Stem

struct XCColorTemplate {
    
    static let `default` = XCColorTemplate(instanceName: "AbrarionColor",
                                           protocolName: "AbrarionColorProtocol")
    
    let instanceName: String
    let protocolName: String

    init(from json: JSON?) {
        instanceName = json?["instance_name"].string ?? XCColorTemplate.default.instanceName
        protocolName = json?["protocol_name"].string ?? XCColorTemplate.default.protocolName
    }
    
    init(instanceName: String, protocolName: String) {
        self.instanceName = instanceName
        self.protocolName = protocolName
    }
    
}
