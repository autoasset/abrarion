//
//  File.swift
//  
//
//  Created by linhey on 2022/2/21.
//

import Foundation
import Stem
import STJSON
import STJSON

public enum XCImageScale: String {
    case x1 = "1x"
    case x2 = "2x"
    case x3 = "3x"
    
    init?(from json: JSON) {
        guard let value = json["scale"].string else {
            return nil
        }
        self.init(rawValue: value)
    }
    
    var toJSON: [String: String] {
        return ["scale": rawValue]
    }
}
