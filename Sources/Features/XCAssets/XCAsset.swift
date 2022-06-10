//
//  File.swift
//  
//
//  Created by linhey on 2022/2/9.
//

import Foundation
import Stem

public struct XCAsset<Content: XCAssetContentProtocol> {
    
    public let contents: [Content]
    public let properties: [String: Any]
    public let info: Info
    
    public init(contents: [Content],
                properties: [String: Any] = ["localizable": true],
                info: Info = .xcode) {
        self.contents = contents
        self.properties = properties
        self.info = info
    }
    
    public init(from json: JSON) throws {
        self.properties = json["properties"].dictionaryObject ?? [:]
        self.info = .init(from: json["info"])
        self.contents = try json[Content.parseKey].arrayValue.map(Content.init(from:))
    }
    
}
