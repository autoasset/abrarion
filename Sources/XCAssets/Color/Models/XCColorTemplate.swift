//
//  File.swift
//  
//
//  Created by linhey on 2022/2/19.
//

import Stem

struct XCColorTemplate {
    
    let instanceName: String
    let protocolName: String

    init(from json: JSON?) {
        instanceName = json?["instance_name"].string ?? "AbrarionColor"
        protocolName = json?["protocol_name"].string ?? "AbrarionColorProtocol"
    }
    
}
