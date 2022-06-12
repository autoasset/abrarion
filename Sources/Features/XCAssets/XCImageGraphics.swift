//
//  File.swift
//  
//
//  Created by linhey on 2022/2/21.
//

import Foundation
import Stem

enum XCImageGraphics: String {
    
    case apple1
    case apple2
    case apple3
    case apple4
    case apple5
    case apple6
    case apple7
    case apple8
    
    init?(from json: JSON) {
        guard let value = json["graphics-feature-set"].string else {
            return nil
        }
        self.init(rawValue: value)
    }
    
    var toJSON: [String: String] {
        return ["graphics-feature-set": rawValue]
    }
}
