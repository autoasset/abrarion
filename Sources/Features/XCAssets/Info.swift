//
//  File.swift
//  
//
//  Created by linhey on 2022/2/21.
//

import Foundation
import Stem

public struct Info: Equatable, Codable {

    public static let xcode = Info(author: "xcode", version: 1)
    
    public let author: String
    public let version: Int
    
    public init(from json: JSON) {
        self.author = json["author"].string ?? Info.xcode.author
        self.version = json["version"].int ?? Info.xcode.version
    }
    
    public init(author: String, version: Int) {
        self.author = author
        self.version = version
    }
    
    public var toJSON: [String: Any] {
        ["author": author, "version": version]
    }
}
