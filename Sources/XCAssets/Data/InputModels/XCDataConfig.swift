//
//  File.swift
//  
//
//  Created by linhey on 2022/3/5.
//

import Foundation
import Stem
import Core

struct XCDataConfig {
    
    let paths: XCInputPaths
    
    init(paths: XCInputPaths) {
        self.paths = paths
    }
    
    init?(from json: JSON) throws {
        self.paths = try .init(from: json["paths"])
    }
    
}
