//
//  File.swift
//  
//
//  Created by linhey on 2022/2/21.
//

import Foundation
import Stem

public struct Devices {
    
    public enum Idiom: String {
        case universal
        case iphone
        case ipad
        case tv
        case mac
    }
    
    public enum Subtype: String {
        case macCatalyst = "mac-catalyst"
    }
    
    public let idiom: Idiom
    public let subtype: Subtype?
    
    public init(idiom: Devices.Idiom, subtype: Devices.Subtype? = nil) {
        self.idiom = idiom
        self.subtype = subtype
    }

    public init?(from json: JSON) {
        guard let idiom = json["idiom"].string.flatMap(Idiom.init(rawValue:)) else {
            return nil
        }
        
        self.idiom = idiom
        self.subtype = Subtype(rawValue: json["subtype"].stringValue)
    }
    
    public var toJSON: [String: String] {
        [
            "idiom": idiom.rawValue,
            "subtype": subtype?.rawValue
        ].compactMapValues({ $0 })
    }
    
}
