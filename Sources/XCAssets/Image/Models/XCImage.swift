//
//  File.swift
//  
//
//  Created by linhey on 2022/2/21.
//

import Foundation
import Stem

struct XCImage {
    
    let filename: String?
    let appearances: [Appearance]
    let displayGamut: DisplayGamut?
    let scale: XCImageScale?
    let locale: Locale?
    let devices: Devices
    let direction: XCImageDirection?
    let size: XCImageSizeClass?
    let memory: XCImageMemory?
    
    init(filename: String?,
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
    }
    
    init(json: JSON) {
        filename = json["filename"].string
        appearances = .init(from: json["appearances"])
        displayGamut = .init(from: json)
        scale = .init(from: json)
        devices = .init(from: json) ?? .init(idiom: .universal, subtype: nil)
        direction = .init(from: json)
        size = .init(from: json)
        memory = .init(from: json)
        locale = json["locale"].string.flatMap(Locale.init(identifier:))
    }
    
    var toJSON: [String: Any] {
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
