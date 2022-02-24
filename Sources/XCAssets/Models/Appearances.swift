//
//  File.swift
//  
//
//  Created by linhey on 2022/2/21.
//

import Foundation
import Stem

enum Appearance {
    
    enum Luminosity: String {
        case light
        case dark
    }

    enum Contrast: String {
        case high
    }
    
    case luminosity(Luminosity)
    case contrast(Contrast)
    
}

extension Array where Element == XCColor {

    func firstNoLuminosity() -> Element? {
        for item in self {
            if item.appearances.isEmpty {
                return item
            }
        }
        return nil
    }
    
    func first(by luminosity: Appearance.Luminosity) -> Element? {
        for item in self {
            for appearance in item.appearances {
                switch appearance {
                case .luminosity(let value):
                    if luminosity == value {
                        return item
                    }
                case .contrast:
                    break
                }
            }
        }
        return nil
    }
    
    
}

extension Array where Element == Appearance {

    init(from json: JSON) {
        var list = [Element]()
        
        if let value = json["luminosity"].string,
           let rawValue = Appearance.Luminosity(rawValue: value) {
            list.append(.luminosity(rawValue))
        }
        
        if let value = json["contrast"].string,
           let rawValue = Appearance.Contrast(rawValue: value) {
            list.append(.contrast(rawValue))
        }
        
        self = list
    }
    
}

extension Appearance {
    
    var toJSON: [String: String] {
        switch self {
        case .luminosity(let luminosity):
            return ["luminosity": luminosity.rawValue]
        case .contrast(let contrast):
            return ["contrast": contrast.rawValue]
        }
    }
    
}
