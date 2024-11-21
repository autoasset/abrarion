//
//  File.swift
//  
//
//  Created by linhey on 2022/3/17.
//

import Foundation
import Stem
import STJSON
import STJSON

public struct XCSymbol: XCAssetContentProtocol {
    
    public typealias Properties = DefaultProperties
    public static let parseKey: String = "symbols"

    public let filename: String?
    public let devices: Devices = .init(idiom: .universal)
    public let direction: XCImageDirection?
    public let appearances: [Appearance]

    public init(filename: String?, appearances: [Appearance], direction: XCImageDirection?) {
        self.filename = filename
        self.direction = direction
        self.appearances = appearances
    }
    
    public init(from json: JSON) throws {
        filename = json["filename"].string
        direction = .init(from: json)
        appearances = try json["appearances"].arrayValue.map(Appearance.init(from:))
    }
    
    public var toJSON: [String: Any] {
        var dict = [String: Any]()
        dict["filename"] = filename
        dict.merge(devices.toJSON, uniquingKeysWith: { $1 })
        dict.merge(direction?.toJSON ?? [:], uniquingKeysWith: { $1 })
        dict["appearances"] = appearances.map(\.toJSON)
        return dict.filter { (key, value) in
            if let value = value as? Array<Any>, value.isEmpty {
                return false
            }
            return true
        }
    }
    
}
