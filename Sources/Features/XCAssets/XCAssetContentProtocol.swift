//
//  File.swift
//  
//
//  Created by linhey on 2022/6/10.
//

import Foundation
import Stem

public protocol XCAssetProtocol {
    init(from json: JSON) throws
    var toJSON: [String: Any] { get }
}

extension XCAssetProtocol {
    var data: Data {
        get throws {
            try JSONSerialization.data(withJSONObject: toJSON, options: [.prettyPrinted, .sortedKeys])
        }
    }
}

public protocol XCAssetContentProtocol: XCAssetProtocol {
    
    associatedtype Properties: XCAssetProtocol
    static var parseKey: String { get }
    
}


public struct DefaultProperties: XCAssetProtocol {

    static var `default`: DefaultProperties = .init(dict: [:])
    
    public var dict: [String: Any]
    public var toJSON: [String: Any] { dict }
    
    internal init(dict: [String : Any]) {
        self.dict = dict
    }
    
    public init(from json: JSON) throws {
        dict = json.dictionaryObject ??  [:]
    }
    
}
