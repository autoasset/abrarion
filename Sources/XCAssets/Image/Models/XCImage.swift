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
    
    init(json: JSON) {
        filename = json["filename"].string
        appearances = .init(from: json)
        displayGamut = .init(from: json)
        scale = .init(from: json)
        devices = .init(from: json) ?? .init(idiom: .universal, subtype: nil)
        direction = .init(from: json)
        size = .init(from: json)
        memory = .init(from: json)
        locale = json["locale"].string.flatMap(Locale.init(identifier:))
    }
    
}
