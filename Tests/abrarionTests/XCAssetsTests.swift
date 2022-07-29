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
        try allOption(asset)
        try allOption(XCAsset<XCColor>(from: JSON(asset.toJSON)))
    }
    
    func testSymbolParse() throws {
        let asset = try XCAsset<XCSymbol>(from: JSON(parseJSON: Resource.symbol))
        try allOption(asset)
        try allOption(XCAsset<XCSymbol>(from: JSON(asset.toJSON)))
    }
    
    func allOption(_ asset: XCAsset<XCSymbol>) throws {
        assert(asset.contents.count == 6)
        assert(asset.info == .xcode)
        let items = asset.contents
        
        var index = 0
        assert(items[index].filename?.isEmpty == false)
        assert(items[index].devices.idiom == .universal)
        assert(items[index].direction == .leftToRight)
        assert(items[index].appearances.luminosities == [])
        
        index = 1
        assert(items[index].filename?.isEmpty == false)
        assert(items[index].devices.idiom == .universal)
        assert(items[index].direction == .leftToRight)
        assert(items[index].appearances.luminosities == [.light])
        
        index = 2
        assert(items[index].filename?.isEmpty == false)
        assert(items[index].devices.idiom == .universal)
        assert(items[index].direction == .leftToRight)
        assert(items[index].appearances.luminosities == [.dark])
        
        index = 3
        assert(items[index].filename?.isEmpty == false)
        assert(items[index].devices.idiom == .universal)
        assert(items[index].direction == .rightToleft)
        assert(items[index].appearances.luminosities == [])
        
        index = 4
        assert(items[index].filename?.isEmpty == false)
        assert(items[index].devices.idiom == .universal)
        assert(items[index].direction == .rightToleft)
        assert(items[index].appearances.luminosities == [.light])
        
        index = 5
        assert(items[index].filename?.isEmpty == false)
        assert(items[index].devices.idiom == .universal)
        assert(items[index].direction == .rightToleft)
        assert(items[index].appearances.luminosities == [.dark])
    }
    
    func allOption(_ asset: XCAsset<XCColor>) throws {
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

    
    func test_resizing_image() async throws {
    let text =
        """
        {
          "images" : [
            {
              "idiom" : "universal",
              "scale" : "1x"
            },
            {
              "resizing" : {
                "mode" : "9-part",
                "center" : {
                  "mode" : "tile",
                  "width" : 1,
                  "height" : 1
                },
                "cap-insets" : {
                  "bottom" : 16,
                  "top" : 16,
                  "right" : 28,
                  "left" : 27
                }
              },
              "idiom" : "universal",
              "filename" : "mes_bg_me@2x.png",
              "scale" : "2x"
            },
            {
              "resizing" : {
                "mode" : "9-part",
                "center" : {
                  "mode" : "tile",
                  "width" : 1,
                  "height" : 1
                },
                "cap-insets" : {
                  "bottom" : 24,
                  "top" : 24,
                  "right" : 42,
                  "left" : 41
                }
              },
              "idiom" : "universal",
              "filename" : "mes_bg_me@3x.png",
              "scale" : "3x"
            }
          ],
          "info" : {
            "version" : 1,
            "author" : "xcode"
          }
        }
        """
        let json = JSON(parseJSON: text)
        let asset = try XCAsset<XCImage>(from: json)
        // TODO
        asset.contents.first
    }
    
}
