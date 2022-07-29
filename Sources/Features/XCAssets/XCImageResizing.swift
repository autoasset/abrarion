//
//  File.swift
//  
//
//  Created by linhey on 2022/7/29.
//

import Foundation
import Stem

public struct XCImageResizing {
    
    enum Mode: String {
        case tile
    }
    
    struct Center {
        let mode: String
        let width: Int?
        let height: Int?
    }
    
    struct CapInsets {
        let bottom: Int?
        let top: Int?
        let right: Int?
        let left: Int?
    }
    
//    let mode: String
//    let cap_insets: CapInsets
//    let center: Center
    
    init?(from json: JSON) {
        let json = json["resizing"]
        guard json.isExists else {
            return nil
        }
    }
    
}
