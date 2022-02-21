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
    
    struct Color {
        
        let appearances: [Appearance]
        let space: ColorSpace
        let value: StemColor
        let displayGamut: DisplayGamut?
        let locale: Locale?
        let devices: Devices
        
        internal init(appearances: [Appearance],
                      space: XCColorSet.ColorSpace,
                      value: StemColor,
                      displayGamut: DisplayGamut? = nil,
                      locale: Locale? = nil,
                      devices: Devices = .init(idiom: .universal, subtype: nil)) {
            self.appearances = appearances
            self.space = space
            self.value = value
            self.displayGamut = displayGamut
            self.locale = locale
            self.devices = devices
        }
    }
    
    let names: [String]
    let ivars: [String]
    let colors: [Color]
    
    let properties: [String: Any]
    let info: Info
    
    init(names: [String],
         ivars: [String],
         colors: [XCColorSet.Color],
         properties: [String: Any] = ["localizable": true],
         info: Info = .xcode) {
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
        self.info = .init(from: json["info"])
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
                                    
            return Color(appearances: [Appearance](from: json["appearances"]),
                         space: ColorSpace(rawValue: json["color"]["color-space"].stringValue) ?? .displayP3,
                         value: color,
                         displayGamut: DisplayGamut(from: json),
                         locale: json["locale"].string.flatMap(Locale.init(identifier:)),
                         devices: .init(from: json) ?? .init(idiom: .universal, subtype: nil))
        })
    }
}
