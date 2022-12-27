//
//  File.swift
//  
//
//  Created by linhey on 2022/12/27.
//

import Foundation

enum AndriodDensity: String, CaseIterable {
    
    case drawable = "drawable"
    case ldpi     = "drawable-ldpi"
    case mdpi     = "drawable-mdpi"
    case hdpi     = "drawable-hdpi"
    case xhdpi    = "drawable-xhdpi"
    case xxhdpi   = "drawable-xxhdpi"
    case xxxhdpi  = "drawable-xxxhdpi"
    
    var night: String {
        switch self {
        case .drawable: return "drawable-night"
        case .ldpi:     return "drawable-night-ldpi"
        case .mdpi:     return "drawable-night-mdpi"
        case .hdpi:     return "drawable-night-hdpi"
        case .xhdpi:    return "drawable-night-xhdpi"
        case .xxhdpi:   return "drawable-night-xxhdpi"
        case .xxxhdpi:  return "drawable-night-xxxhdpi"
        }
    }
}
