//
//  File.swift
//  
//
//  Created by linhey on 2022/2/9.
//

import Foundation
import Stem

struct XCColorsetController {
    
    struct Output {
        let name: String
        let content: Data
    }
    
    let set: XCColorSet
}

extension XCColorsetController {
    
    func output() throws -> [Output] {
        var content = [String: Any]()
        
        var colors = [[String: Any]]()
        
        for color in set.colors {
            var dict = [String: Any]()
            do {
                var store = [String: Any]()
                store["components"] = self.components(color.value)
                store["color-space"] = color.space.rawValue
                dict["color"] = store
            }

            if color.appearances.isEmpty == false {
                dict["appearance"] = color.appearances.map(\.toJSON)
            }
            
            dict["idiom"] = color.idiom.rawValue
            
            colors.append(dict)
        }
        
        content["colors"] = colors
        content["info"] = set.info
        content["properties"] = set.properties
        
        let data = try JSONSerialization.data(withJSONObject: content, options: [.prettyPrinted, .sortedKeys])
        return set.names.map({ .init(name: $0, content: data) })
    }
    
}


extension XCColorsetController {
    
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
