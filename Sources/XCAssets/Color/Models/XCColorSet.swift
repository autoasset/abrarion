//
//  File.swift
//  
//
//  Created by linhey on 2022/2/9.
//

import Foundation
import Stem

struct XCColorSet {
    
    enum ColorSpace: String {
        case displayP3 = "display-p3"
    }
    
    enum Luminosity: String {
        case light
        case dark
    }
    
    enum Contrast: String {
        case high
    }
    
    enum Appearances {
        case luminosity(Luminosity)
        case contrast(Contrast)
    }
    
    enum DisplayGamut: String {
        case sRGB
        case displayP3 = "display-P3"
    }
    
    enum Subtype: String {
        case macCatalyst = "mac-catalyst"
    }
    
    enum Idiom: String {
        case universal
        case iphone
        case ipad
        case tv
        case mac
    }
    
    struct Color {
        
        let appearances: [Appearances]
        let space: ColorSpace
        let value: StemColor
        let displayGamut: DisplayGamut?
        let locale: Locale?
        let idiom: Idiom
        let subtype: Subtype?
        
        internal init(appearances: [XCColorSet.Appearances],
                      space: XCColorSet.ColorSpace,
                      value: StemColor,
                      displayGamut: XCColorSet.DisplayGamut? = nil,
                      locale: Locale? = nil,
                      idiom: XCColorSet.Idiom = .universal,
                      subtype: XCColorSet.Subtype? = nil) {
            self.appearances = appearances
            self.space = space
            self.value = value
            self.displayGamut = displayGamut
            self.locale = locale
            self.idiom = idiom
            self.subtype = subtype
        }
    }
    
    let names: [String]
    let ivars: [String]
    let colors: [Color]
    
    let properties: [String: Any]
    let info: [String : Any]
    
    init(names: [String],
         ivars: [String],
         colors: [XCColorSet.Color],
         properties: [String: Any] = ["localizable": true],
         info: [String : Any] = ["author": "xcode", "version": 1]) {
        self.names = names
        self.colors = colors
        self.properties = properties
        self.info = info
        self.ivars = ivars
    }
    
    init(contentFile json: JSON) throws {
        self.names = []
        self.ivars = []
        self.properties = json["properties"].dictionaryObject ?? [:]
        self.info = json["info"].dictionaryObject ?? [:]
        self.colors = try json["colors"].arrayValue.map({ json in
            
            let components = json["color"]["components"]
            let alpha  = Double(components["alpha"].stringValue) ?? 1
            let blue   = components["blue"].stringValue
            let green  = components["green"].stringValue
            let red    = components["red"].stringValue
            
            let color: StemColor
            if blue.hasPrefix("0x") {
               let hex = [red, green, blue].map({ $0.st.deleting(prefix: "0x") }).joined()
                color = .init(hex: hex)
                color.alpha(with: alpha)
            } else {
                var list = try [red, green, blue].map { value throws -> Double in
                    if let value = Double(value) {
                        return value
                    } else {
                        throw StemError()
                    }
                }
                if [red, green, blue].contains(where: { $0.contains(".") }) == false {
                    list = list.map({ $0 / 255 })
                }
                let space = StemColor.RGBSpace(list)
                color = .init(rgb: space, alpha: alpha)
            }
            
            let appearances = json["appearances"].arrayValue.compactMap({ json -> Appearances? in
                let appearance = json["appearance"].stringValue
                let value = json["value"].stringValue
                switch appearance {
                    case "luminosity":
                    guard let item = Luminosity(rawValue: value) else {
                        return nil
                    }
                    return Appearances.luminosity(item)
                case "contrast":
                    guard let item = Contrast(rawValue: value) else {
                        return nil
                    }
                    return Appearances.contrast(item)
                default:
                    return nil
                }
            })
                        
            return Color(appearances: appearances,
                         space: ColorSpace(rawValue: json["color"]["color-space"].stringValue) ?? .displayP3,
                         value: color,
                         displayGamut: DisplayGamut(rawValue: json["display-gamut"].stringValue),
                         locale: json["locale"].string.flatMap(Locale.init(identifier:)),
                         idiom: json["idiom"].string.flatMap(Idiom.init(rawValue:)) ?? .universal,
                         subtype: json["subtype"].string.flatMap(Subtype.init(rawValue:)))
        })
    }
}


extension Array where Element == XCColorSet.Color {

    func firstNoLuminosity() -> Element? {
        for item in self {
            if item.appearances.isEmpty {
                return item
            }
        }
        return nil
    }
    
    func first(by luminosity: XCColorSet.Luminosity) -> Element? {
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

extension XCColorSet.Appearances {
    
    var toJSON: [String: String] {
        switch self {
        case .luminosity(let luminosity):
            return ["luminosity": luminosity.rawValue]
        case .contrast(let contrast):
            return ["contrast": contrast.rawValue]
        }
    }
    
}
