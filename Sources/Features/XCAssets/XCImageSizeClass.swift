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

public struct XCImageSizeClass {
    
    public enum Enum: String {
        case compact
        case regular
    }
    
    public let width: Enum?
    public let height: Enum?
    
    init?(from json: JSON) {
        width  = .init(rawValue: json["width-class"].stringValue)
        height = .init(rawValue: json["height-class"].stringValue)
        if width == nil, height == nil {
            return nil
        }
    }
    
    var toJSON: [String: String] {
        return [
            "width-class": width?.rawValue,
            "height-class": height?.rawValue
        ].compactMapValues({ $0 })
    }
    
}
