//
//  File.swift
//  
//
//  Created by linhey on 2022/2/21.
//

import Foundation
import Stem
import STJSON

public enum XCImageMemory: String {
    
    case gb1  = "1GB"
    case gb2  = "2GB"
    case gb3  = "3GB"
    case gb4  = "4GB"
    case gb6  = "6GB"
    case gb8  = "8GB"
    case gb16 = "16GB"
    
    init?(from json: JSON) {
        guard let value = json["memory"].string else {
            return nil
        }
        self.init(rawValue: value)
    }
    
    var toJSON: [String: String] {
        return ["memory": rawValue]
    }
}
