//
//  File.swift
//  
//
//  Created by linhey on 2022/2/21.
//

import Foundation
import Stem
import STJSON

public enum XCImageDirection: String {
    
    case leftToRight = "left-to-right"
    case rightToleft = "right-to-left"

    public init?(from json: JSON) {
        guard let value = json["language-direction"].string else {
            return nil
        }
        self.init(rawValue: value)
    }
    
    public var toJSON: [String: String] {
        return ["language-direction": rawValue]
    }
}
