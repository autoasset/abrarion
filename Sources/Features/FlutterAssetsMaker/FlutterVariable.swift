//
//  File.swift
//  
//
//  Created by linhey on 2022/7/28.
//

import Foundation

struct FlutterVariable {
    
    static let formatter = NameFormatter(language: .swift, splitSet: .letters.union(.decimalDigits).inverted)
    
    static func parse(name: String, option: FlutterCodeOptions) -> String {
        var new: String = name
        
        if option.prefix_replace_first_letter_when_first_letter_isnot_number_or_letter.isEmpty == false,
           let first = new.first?.description,
           let scalar = Unicode.Scalar(first),
           CharacterSet.letters.union(.decimalDigits).inverted.contains(scalar) {
            new = option.prefix_replace_first_letter_when_first_letter_isnot_number_or_letter + new.dropFirst().description
        }
        
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
    
}
