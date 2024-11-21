//
//  File.swift
//  
//
//  Created by linhey on 2022/7/29.
//

import Foundation
import Stem
import STJSON
import STJSON

public struct XCImageResizing {
    
    public enum Mode: String {
        case part_3_horizontal = "3-part-horizontal"
        case part_3_vertical = "3-part-vertical"
        case part_9 = "9-part"
    }
    
    public enum CenterMode: String {
        case tile
        case stretch
    }
    
    public struct Center {
        public let mode: CenterMode
        public let width: Int?
        public let height: Int?
        
        public init(from json: JSON) throws {
            guard let mode = CenterMode(rawValue: json["mode"].stringValue) else {
                throw StemError("XCImageResizing: center mode 数据格式错误")
            }
            self.mode = mode
            self.width = json["width"].int
            self.height = json["height"].int
        }
    }
    
    public struct CapInsets {
        public let bottom: Int?
        public let top: Int?
        public let right: Int?
        public let left: Int?
        
        public init(from json: JSON) throws {
            guard json.isExists else {
                throw StemError("XCImageResizing: cap-insets 数据格式错误")
            }
            self.bottom = json["bottom"].int
            self.top = json["top"].int
            self.right = json["right"].int
            self.left = json["left"].int
        }
    }
    
    public let mode: Mode
    public let cap_insets: CapInsets
    public let center: Center
    
    public init?(from json: JSON) throws {
        let json = json["resizing"]
        guard json.isExists else {
            return nil
        }
        
        guard let mode = Mode(rawValue: json["mode"].stringValue) else {
            throw StemError("XCImageResizing: mode 数据格式错误")
        }
        
        self.mode = mode
        self.center = try .init(from: json["center"])
        self.cap_insets = try .init(from: json["cap-insets"])
    }
    
}
