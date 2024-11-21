//
//  File.swift
//  
//
//  Created by linhey on 2022/2/21.
//

import Foundation
import Stem
import STJSON

public enum XCImageRenderAs: String {
    
    case `default`
    case original
    case template
    
    init?(from json: JSON) {
        guard let value = json["template-rendering-intent"].string else {
            return nil
        }
        self.init(rawValue: value)
    }
    
    var toJSON: [String: String] {
        switch self {
        case .default:
            return [:]
        case .original:
            return ["template-rendering-intent": rawValue]
        case .template:
            return ["template-rendering-intent": rawValue]
        }
    }
}
