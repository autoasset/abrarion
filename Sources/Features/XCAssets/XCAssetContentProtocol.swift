//
//  File.swift
//  
//
//  Created by linhey on 2022/6/10.
//

import Foundation
import Stem

public protocol XCAssetContentProtocol {
    static var parseKey: String { get }
    init(from: JSON) throws
    var toJSON: [String: Any] { get }
}
