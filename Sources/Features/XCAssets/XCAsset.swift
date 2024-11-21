//
//  File.swift
//  
//
//  Created by linhey on 2022/2/9.
//

import Foundation
import Stem
import STJSON

public struct XCAsset<Content: XCAssetContentProtocol>: XCAssetProtocol {
    
    public let contents: [Content]
    public let properties: Content.Properties
    public let info: Info
    
    public init(contents: [Content],
                properties: Content.Properties,
                info: Info = .xcode) {
        self.contents = contents
        self.properties = properties
        self.info = info
    }
    
    public init(from json: JSON) throws {
        self.properties = try .init(from: json["properties"])
        self.info = .init(from: json["info"])
        self.contents = try json[Content.parseKey].arrayValue.map(Content.init(from:))
    }
    
    public var toJSON: [String: Any] {
        var dict = [String: Any]()
        if !properties.toJSON.isEmpty {
            dict["properties"] = properties.toJSON
        }
        dict["info"] = info.toJSON
        dict[Content.parseKey] = contents.map(\.toJSON)
        return dict
    }
    
}
