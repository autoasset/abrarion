//
//  File.swift
//  
//
//  Created by linhey on 2022/6/9.
//

import Foundation
import XCTest
import Features
import Stem
import StemFilePath

class XCAssetsTests: XCTestCase {
    
    func testColorParse() throws {
        let asset = try XCAsset<XCColor>(from: JSON(parseJSON: Resource.color))
        try allOptionColors(asset)
        try allOptionColors(XCAsset<XCColor>(from: JSON(asset.toJSON)))
    }
    
    func allOptionColors(_ asset: XCAsset<XCColor>) throws {
        assert(asset.contents.count == 79)
        assert(asset.info == .xcode)
        let colors = asset.contents
        
        devices(.init(colors[0...11]), idiom: .universal)
        devices(.init(colors[12...23]), idiom: .iphone)
        /// TODO (24...54)
        devices(.init(colors[55...66]), idiom: .tv)
        devices(.init(colors[67...78]), idiom: .mac)
    }
    
    func devices(_ colors: [XCColor], idiom: Devices.Idiom) {
        var index = 0
        assert(colors[index].appearances.contrast == [])
        assert(colors[index].appearances.luminosities == [])
        assert(colors[index].space == .sRGB)
        assert(colors[index].displayGamut == .sRGB)
        assert(colors[index].devices.idiom == idiom)
        assert(colors[index].value.uInt == 0xFFFFFFFF)
        
        index = 1
        assert(colors[index].appearances.contrast == [])
        assert(colors[index].appearances.luminosities == [.light])
        assert(colors[index].space == .sRGB)
        assert(colors[index].displayGamut == .sRGB)
        assert(colors[index].devices.idiom == idiom)
        assert(colors[index].value.uInt == 0xFFFFFFFF)
        
        index = 2
        assert(colors[index].appearances.contrast == [])
        assert(colors[index].appearances.luminosities == [.dark])
        assert(colors[index].space == .sRGB)
        assert(colors[index].displayGamut == .sRGB)
        assert(colors[index].devices.idiom == idiom)
        assert(colors[index].value.uInt == 0xFFFFFFFF)
        
        index = 3
        assert(colors[index].appearances.contrast == [.high])
        assert(colors[index].appearances.luminosities == [])
        assert(colors[index].space == .sRGB)
        assert(colors[index].displayGamut == .sRGB)
        assert(colors[index].devices.idiom == idiom)
        assert(colors[index].value.uInt == 0xFFFFFFFF)
        
        index = 4
        assert(colors[index].appearances.contrast == [.high])
        assert(colors[index].appearances.luminosities == [.light])
        assert(colors[index].space == .sRGB)
        assert(colors[index].displayGamut == .sRGB)
        assert(colors[index].devices.idiom == idiom)
        assert(colors[index].value.uInt == 0xFFFFFFFF)
        
        index = 5
        assert(colors[index].appearances.contrast == [.high])
        assert(colors[index].appearances.luminosities == [.dark])
        assert(colors[index].space == .sRGB)
        assert(colors[index].displayGamut == .sRGB)
        assert(colors[index].devices.idiom == idiom)
        assert(colors[index].value.uInt == 0xFFFFFFFF)
        
        index = 6
        assert(colors[index].appearances.contrast == [])
        assert(colors[index].appearances.luminosities == [])
        assert(colors[index].space == .displayP3)
        assert(colors[index].displayGamut == .displayP3)
        assert(colors[index].devices.idiom == idiom)
        assert(colors[index].value.uInt == 0xFFFFFFFF)
        
        index = 7
        assert(colors[index].appearances.contrast == [])
        assert(colors[index].appearances.luminosities == [.light])
        assert(colors[index].space == .displayP3)
        assert(colors[index].displayGamut == .displayP3)
        assert(colors[index].devices.idiom == idiom)
        assert(colors[index].value.uInt == 0xFFFFFFFF)
        
        index = 8
        assert(colors[index].appearances.contrast == [])
        assert(colors[index].appearances.luminosities == [.dark])
        assert(colors[index].space == .displayP3)
        assert(colors[index].displayGamut == .displayP3)
        assert(colors[index].devices.idiom == idiom)
        assert(colors[index].value.uInt == 0xFFFFFFFF)
        
        index = 9
        assert(colors[index].appearances.contrast == [.high])
        assert(colors[index].appearances.luminosities == [])
        assert(colors[index].space == .displayP3)
        assert(colors[index].displayGamut == .displayP3)
        assert(colors[index].devices.idiom == idiom)
        assert(colors[index].value.uInt == 0xFFFFFFFF)
        
        index = 10
        assert(colors[index].appearances.contrast == [.high])
        assert(colors[index].appearances.luminosities == [.light])
        assert(colors[index].space == .displayP3)
        assert(colors[index].displayGamut == .displayP3)
        assert(colors[index].devices.idiom == idiom)
        assert(colors[index].value.uInt == 0xFFFFFFFF)
        
        index = 11
        assert(colors[index].appearances.contrast == [.high])
        assert(colors[index].appearances.luminosities == [.dark])
        assert(colors[index].space == .displayP3)
        assert(colors[index].displayGamut == .displayP3)
        assert(colors[index].devices.idiom == idiom)
        assert(colors[index].value.uInt == 0xFFFFFFFF)
    }

}
