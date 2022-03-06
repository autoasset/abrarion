//
//  File.swift
//  
//
//  Created by linhey on 2022/3/4.
//

import Foundation
import Stem

struct XCData {

    let filename: String?
    let devices: Devices = .init(idiom: .universal)
    let compressionType: XCImageCompressionType?
    let universalTypeIdentifier: String?
    
    init?(from json: JSON) {
        filename = json["filename"].string
        universalTypeIdentifier = json["universal-type-identifier"].string
        compressionType = .init(from: json)
    }
    
    var toJSON: [String: Any] {
        var dict = [String: Any]()
        dict["filename"] = filename
        dict["universal-type-identifier"] = universalTypeIdentifier
        dict.merge(devices.toJSON, uniquingKeysWith: { $1 })
        if let item = compressionType {
            dict.merge(item.toJSON, uniquingKeysWith: { $1 })
        }
        return dict
    }
    
}
