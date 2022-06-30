//
//  File.swift
//  
//
//  Created by linhey on 2022/6/30.
//

import Foundation

struct KhalaIconFont: Codable {
    
    struct Glyph: Codable {
        var name: String
        var font_class: String
        var unicode: String
        var unicode_value: String
        var file: String
        var key: String
    }
    
    var font_family: String
    var font_name: String
    var glyphs: [Glyph]
}
