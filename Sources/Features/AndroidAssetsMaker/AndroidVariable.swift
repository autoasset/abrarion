//
//  File.swift
//  
//
//  Created by linhey on 2022/7/29.
//

import Foundation
import Stem
import STJSON
import StemColor

struct AndroidVariable {
    
    static let formatter = NameFormatter(language: .swift, splitSet: .letters.union(.decimalDigits).inverted)
    
    static func parseColor(name: String, option: AndriodColorMaker.Options) -> String {
        if (try? StemColor(throwing: name)) != nil {
            return option.color_prefix_when_name_is_hex + name
        } else {
            return name
        }
    }
    
}
