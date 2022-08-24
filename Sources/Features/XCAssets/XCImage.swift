//
//  File.swift
//  
//
//  Created by linhey on 2022/2/21.
//

import Foundation
import Stem

public struct XCImage: XCAssetContentProtocol {
    
    public typealias Properties = XCImageProperties
    public static let parseKey: String = "images"
    
    public let filename: String?
    public let appearances: [Appearance]
    public let resizing: XCImageResizing?
    public let displayGamut: DisplayGamut?
    public let scale: XCImageScale?
    public let locale: Locale?
    public let devices: Devices
    public let direction: XCImageDirection?
    public let size: XCImageSizeClass?
    public let memory: XCImageMemory?
    
    public init(filename: String?,
         appearances: [Appearance] = [],
         displayGamut: DisplayGamut? = nil,
         scale: XCImageScale? = nil,
         locale: Locale? = nil,
         devices: Devices = .init(idiom: .universal, subtype: nil),
         direction: XCImageDirection? = nil,
         size: XCImageSizeClass? = nil,
         memory: XCImageMemory? = nil) {
        self.filename = filename
        self.appearances = appearances
        self.displayGamut = displayGamut
        self.scale = scale
        self.locale = locale
        self.devices = devices
        self.direction = direction
        self.size = size
        self.memory = memory
        self.resizing = nil
    }
    
    public init(from json: JSON) throws {
        filename = json["filename"].string
        self.appearances = try json["appearances"].arrayValue.map(Appearance.init(from:))
        displayGamut = .init(from: json)
        scale = .init(from: json)
        devices = .init(from: json) ?? .init(idiom: .universal, subtype: nil)
        direction = .init(from: json)
        size = .init(from: json)
        memory = .init(from: json)
        resizing = try .init(from: json)
        locale = json["locale"].string.flatMap(Locale.init(identifier:))
    }
    
    public var toJSON: [String: Any] {
        var dict = [String: Any]()
        dict["filename"] = filename
        dict["appearances"] = appearances.map(\.toJSON)
        dict["locale"] = locale?.currencyCode
        dict.merge(displayGamut?.toJSON ?? [:], uniquingKeysWith: { $1 })
        dict.merge(scale?.toJSON ?? [:], uniquingKeysWith: { $1 })
        dict.merge(devices.toJSON, uniquingKeysWith: { $1 })
        dict.merge(direction?.toJSON ?? [:], uniquingKeysWith: { $1 })
        dict.merge(size?.toJSON ?? [:], uniquingKeysWith: { $1 })
        dict.merge(memory?.toJSON ?? [:], uniquingKeysWith: { $1 })
        return dict
    }
    
}
