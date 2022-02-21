//
//  File.swift
//  
//
//  Created by linhey on 2022/2/21.
//

import Foundation
import Stem

struct Info {

    static let xcode = Info(author: "xcode", version: 1)
    
    let author: String
    let version: Int
    
    init(from json: JSON) {
        self.author = json["author"].string ?? Info.xcode.author
        self.version = json["version"].int ?? Info.xcode.version
    }
    
    init(author: String, version: Int) {
        self.author = author
        self.version = version
    }
    
    var toJSON: [String: Any] {
        ["author": author, "version": version]
    }
}
