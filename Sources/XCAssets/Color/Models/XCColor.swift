//
//  File.swift
//  
//
//  Created by linhey on 2022/2/21.
//

import Foundation
import Stem

struct XCColor {
    
    enum ColorSpace: String {
        case displayP3 = "display-p3"
    }
    
    let appearances: [Appearance]
    let space: ColorSpace
    let value: StemColor
    let displayGamut: DisplayGamut?
    let locale: Locale?
    let devices: Devices
    
    init(appearances: [Appearance],
                  space: ColorSpace,
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
    
    init(from json: JSON) throws {
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
               
        self.appearances = [Appearance](from: json["appearances"])
        self.space = ColorSpace(rawValue: json["color"]["color-space"].stringValue) ?? .displayP3
        self.value = color
        self.displayGamut = DisplayGamut(from: json)
        self.locale = json["locale"].string.flatMap(Locale.init(identifier:))
        self.devices =  .init(from: json) ?? .init(idiom: .universal, subtype: nil)
    }
}
