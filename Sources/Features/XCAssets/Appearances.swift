//
//  File.swift
//  
//
//  Created by linhey on 2022/2/21.
//

import Foundation
import Stem

public enum Appearance {
    
    public enum Luminosity: String {
        case light
        case dark
    }

    public enum Contrast: String {
        case high
    }
    
    case luminosity(Luminosity)
    case contrast(Contrast)
    
    init(from json: JSON) throws {
        guard let appearance = json["appearance"].string else {
            fatalError()
        }
        switch appearance {
        case "luminosity":
            guard let value = Luminosity(rawValue: json["value"].stringValue) else {
                fatalError()
            }
            self = .luminosity(value)
        case "contrast":
            guard let value = Contrast(rawValue: json["value"].stringValue) else {
                fatalError()
            }
            self = .contrast(value)
        default:
            fatalError()
        }
    }
    
    var toJSON: [String: String] {
        switch self {
        case .luminosity(let luminosity):
            return ["appearance": "luminosity",
                    "value": luminosity.rawValue]
        case .contrast(let contrast):
            return ["appearance": "contrast",
                    "value": contrast.rawValue]
        }
    }
    
}

public extension Array where Element == XCColor {

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

public extension Array where Element == Appearance {
    
    var luminosities: [Appearance.Luminosity] {
        self.compactMap { appearance in
            switch appearance {
            case .luminosity(let luminosity):
                return luminosity
            case .contrast:
                return nil
            }
        }
    }
    
    var contrast: [Appearance.Contrast] {
        self.compactMap { appearance in
            switch appearance {
            case .luminosity:
                return nil
            case .contrast(let contrast):
                return contrast
            }
        }
    }
    
}
