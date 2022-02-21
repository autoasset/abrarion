//
//  File.swift
//  
//
//  Created by linhey on 2022/2/21.
//

import Foundation
import Stem

struct Devices {
    
    enum Idiom: String {
        case universal
        case iphone
        case ipad
        case tv
        case mac
    }
    
    enum Subtype: String {
        case macCatalyst = "mac-catalyst"
    }
    
    let idiom: Idiom
    let subtype: Subtype?
    
    init(idiom: Devices.Idiom, subtype: Devices.Subtype? = nil) {
        self.idiom = idiom
        self.subtype = subtype
    }

    init?(from json: JSON) {
        guard let idiom = json["idiom"].string.flatMap(Idiom.init(rawValue:)) else {
            return nil
        }
        
        self.idiom = idiom
        self.subtype = Subtype(rawValue: json["subtype"].stringValue)
    }
    
    var toJSON: [String: String] {
        [
            "idiom": idiom.rawValue,
            "subtype": subtype?.rawValue
        ].compactMapValues({ $0 })
    }
    
}
