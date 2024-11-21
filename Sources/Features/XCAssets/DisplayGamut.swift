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

public enum DisplayGamut: String {
    
    case sRGB
    case displayP3 = "display-P3"
    
    public init?(from json: JSON) {
        guard let value = json["display-gamut"].string else {
            return nil
        }
        self.init(rawValue: value)
    }
    
    public var toJSON: [String: String] {
        return ["display-gamut": rawValue]
    }
}
