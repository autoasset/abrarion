//
//  File.swift
//  
//
//  Created by linhey on 2022/2/9.
//

import Foundation
import Stem

struct XCColorSet {
    
    let names: [String]
    let ivars: [String]
    let colors: [XCColor]
    
    let properties: [String: Any]
    let info: Info
    
    init(names: [String],
         ivars: [String],
         colors: [XCColor],
         properties: [String: Any] = ["localizable": true],
         info: Info = .xcode) {
        self.names = names
        self.colors = colors
        self.properties = properties
        self.info = info
        self.ivars = ivars
    }
    
    init(contentFile json: JSON) throws {
        self.names = []
        self.ivars = []
        self.properties = json["properties"].dictionaryObject ?? [:]
        self.info = .init(from: json["info"])
        self.colors = try json["colors"].arrayValue.map(XCColor.init(from:))
    }
}
