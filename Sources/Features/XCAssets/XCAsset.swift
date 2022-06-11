//
//  File.swift
//  
//
//  Created by linhey on 2022/2/9.
//

import Foundation
import Stem

public protocol XCAssetProtocol {
    init(from json: JSON) throws
    var toJSON: [String: Any] { get }
}

public struct XCAsset<Content: XCAssetContentProtocol>: XCAssetProtocol {
    
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
    
    public var toJSON: [String: Any] {
        var dict = [String: Any]()
        dict["properties"] = properties
        dict["info"] = info.toJSON
        dict[Content.parseKey] = contents.map(\.toJSON)
        return dict
    }
    
}
