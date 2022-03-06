//
//  File.swift
//  
//
//  Created by linhey on 2022/2/23.
//

import Foundation
import Stem

struct XCImageTemplate {
    
    let instanceName: String
    let protocolName: String
    let bundleName: String?

    init(from json: JSON?) {
        instanceName = json?["instance_name"].string ?? "AbrarionImage"
        protocolName = json?["protocol_name"].string ?? "AbrarionImageProtocol"
        bundleName = json?["bundle_Name"].string
    }
    
}
