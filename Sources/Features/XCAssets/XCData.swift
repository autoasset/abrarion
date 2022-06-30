//
//  File.swift
//  
//
//  Created by linhey on 2022/3/4.
//

import Foundation
import Stem

public struct XCData: XCAssetContentProtocol {
    
    public typealias Properties = DefaultProperties
    public static let parseKey: String = "data"
    
    public let filename: String?
    public let devices: Devices = .init(idiom: .universal)
    public let compressionType: XCDataCompressionType?
    public let universalTypeIdentifier: String?
    
    public init(from json: JSON) {
        filename = json["filename"].string
        universalTypeIdentifier = json["universal-type-identifier"].string
        compressionType = .init(from: json)
    }
    
    internal init(filename: String?,
                  compressionType: XCDataCompressionType? = nil,
                  universalTypeIdentifier: String? = nil) {
        self.filename = filename
        self.compressionType = compressionType
        self.universalTypeIdentifier = universalTypeIdentifier
    }
    
    public var toJSON: [String: Any] {
        var dict = [String: Any]()
        dict["filename"] = filename
        dict["universal-type-identifier"] = universalTypeIdentifier
        dict.merge(devices.toJSON, uniquingKeysWith: { $1 })
        if let item = compressionType {
            dict.merge(item.toJSON, uniquingKeysWith: { $1 })
        }
        return dict
    }
    
}
