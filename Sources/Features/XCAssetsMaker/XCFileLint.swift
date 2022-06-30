//
//  File.swift
//  
//
//  Created by linhey on 2022/6/30.
//

import Foundation
import Stem

struct XCFileLint {
    
    let name: String
    let pattern: NSRegularExpression
    
    init?(from json: JSON) {
        guard let pattern = json["pattern"].string, let regex = try? NSRegularExpression(pattern: pattern) else {
            return nil
        }
        self.name = json["name"].stringValue
        self.pattern = regex
    }
    
}
