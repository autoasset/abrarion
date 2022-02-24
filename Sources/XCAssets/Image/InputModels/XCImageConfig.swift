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
    
    struct Paths {

        let xcassets: String
        let template: String?
        let codes: String?
        let contents: [String]
        let images: [String]
        
        init(xcassets: String,
             template: String? = nil,
             codes: String? = nil,
             contents: [String] = [],
             images: [String] = []) {
            self.xcassets = xcassets
            self.template = template
            self.codes = codes
            self.contents = contents
            self.images = images
        }
        
        init(from json: JSON) throws {
            guard let xcassets = json["xcassets"].string else {
                throw ParsableCommandError.parsableFail
            }
            self.xcassets = xcassets
            self.codes = json["codes"].string
            self.template = json["template"].string
            self.images = json["images"].arrayValue.compactMap(\.string)
            self.contents = json["contents"].arrayValue.compactMap(\.string)

            if self.images.isEmpty {
                throw ParsableCommandError.parsableFail
            }
        }
        
    }
    
    let paths: Paths
    let darkModePatterns: [DarkModePattern]
    
    init(paths: XCImageConfig.Paths, darkModePatterns: [XCImageConfig.DarkModePattern]) {
        self.paths = paths
        self.darkModePatterns = darkModePatterns
    }
    
    init?(from json: JSON) throws {
        self.paths = try .init(from: json["paths"])
        self.darkModePatterns = try json["dark_mode_patterns"].arrayValue.map(DarkModePattern.init(from:))
    }
    
}
