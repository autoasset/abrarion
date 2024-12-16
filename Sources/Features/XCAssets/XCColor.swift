//
//  File.swift
//  
//
//  Created by linhey on 2022/6/9.
//

import Foundation
import Stem
import STJSON
import STColor

public struct XCColor: XCAssetContentProtocol {
    
    public typealias Properties = DefaultProperties
    public static let parseKey: String = "colors"
    
    public enum ColorSpace: String {
        case displayP3 = "display-p3"
        case sRGB = "srgb"
    }
    
    public let appearances: [Appearance]
    public let space: ColorSpace
    public let value: StemColor
    public let displayGamut: DisplayGamut?
    public let devices: Devices
    
    public init(appearances: [Appearance],
                space: ColorSpace,
                value: StemColor,
                displayGamut: DisplayGamut? = nil,
                devices: Devices = .init(idiom: .universal, subtype: nil)) {
        self.appearances = appearances
        self.space = space
        self.value = value
        self.displayGamut = displayGamut
        self.devices = devices
    }
    
    public init(from json: JSON) throws {
        let components = json["color"]["components"]
        let alpha  = Double(components["alpha"].stringValue) ?? 1
        let blue   = components["blue"].stringValue
        let green  = components["green"].stringValue
        let red    = components["red"].stringValue
        
        let color: StemColor
        if blue.hasPrefix("0x") {
            let hex = [red, green, blue].map({ $0.st.deleting(prefix: "0x") }).joined()
            color = .init(hex)
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
        
        self.appearances = try json["appearances"].arrayValue.map(Appearance.init(from:))
        self.space = ColorSpace(rawValue: json["color"]["color-space"].stringValue) ?? .displayP3
        self.value = color
        self.displayGamut = DisplayGamut(from: json)
        self.devices = .init(from: json) ?? .init(idiom: .universal, subtype: nil)
    }
    
    public var toJSON: [String: Any] {
        var dict = [String: Any]()
        dict.merge(self.devices.toJSON, uniquingKeysWith: { $1 })
        dict.merge(self.displayGamut?.toJSON ?? [:], uniquingKeysWith: { $1 })
        dict["appearances"] = appearances.map(\.toJSON)
        
        var color = [String: Any]()
        color["color-space"] = self.space.rawValue
        color["components"] = components(value)
        
        dict["color"] = color
        return dict.filter { (key, value) in
            if let value = value as? Array<Any>, value.isEmpty {
                return false
            }
            return true
        }
    }
    
    func components(_ color: StemColor) -> [String: String] {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.formatWidth = 3
        formatter.minimumFractionDigits = 3
        formatter.maximumFractionDigits = 3
        let hex = color.hexString(.digits6, prefix: .none).map(\.description)
        return ["alpha": formatter.string(from: .init(value: color.alpha))!,
                "blue" : "0x\(hex[4...5].joined().uppercased())",
                "green": "0x\(hex[2...3].joined().uppercased())",
                "red"  : "0x\(hex[0...1].joined().uppercased())"]
    }
    
}
