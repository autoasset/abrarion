//
//  File.swift
//  
//
//  Created by linhey on 2022/7/28.
//

import Foundation
import StemColor

struct FlutterVariable {
    
    static let formatter = NameFormatter(language: .swift, splitSet: .letters.union(.decimalDigits).inverted)
    
    static func parse(name: String, option: FlutterCodeOptions) -> String {
        var new: String = name
        switch option.variable_name_type {
        case .camel:
            new = formatter.camelCased(new)
        case .snake:
            new = formatter.snakeCased(new)
        case .none:
            break
        }
        return new
    }
    
    static func parseColor(name: String, option: FlutterCodeOptions) -> String {
        if (try? StemColor(throwing: name)) != nil {
            return parse(name: option.color_prefix_when_name_is_hex + name, option: option)
        } else {
            let name = parse(name: name, option: option)
            if (try? StemColor(throwing: name)) != nil {
                return parse(name: option.color_prefix_when_name_is_hex + name, option: option)
            } else {
                return name
            }
        }
    }
    
}
