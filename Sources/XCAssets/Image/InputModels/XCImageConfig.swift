//
//  File.swift
//  
//
//  Created by linhey on 2022/2/21.
//

import Foundation
import Stem
import Core

struct XCImageConfig {

    enum DarkModePattern {
        
        case regex(pattern: String)
        case prefix(pattern: String)
        case suffix(pattern: String)
        
        init(from json: JSON) throws {
            if let pattern = json["regex"].string {
                self = .regex(pattern: pattern)
            } else if let pattern = json["prefix"].string {
                self = .prefix(pattern: pattern)
            } else if let pattern = json["suffix"].string {
                self = .suffix(pattern: pattern)
            } else {
                throw ParsableCommandError.parsableFail
            }
        }
        
    }
    
    let paths: XCInputPaths
    let template: XCImageTemplate
    let darkModePatterns: [DarkModePattern]
    
    init(paths: XCInputPaths,
         template: XCImageTemplate,
         darkModePatterns: [DarkModePattern]) {
        self.paths = paths
        self.template = template
        self.darkModePatterns = darkModePatterns
    }
    
    init?(from json: JSON) throws {
        self.paths = try .init(from: json["paths"])
        self.template = .init(from: json["template"])
        self.darkModePatterns = try json["dark_mode_patterns"].arrayValue.map(DarkModePattern.init(from:))
    }
    
}
