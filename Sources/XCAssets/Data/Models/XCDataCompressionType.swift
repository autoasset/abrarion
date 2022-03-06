//
//  File.swift
//  
//
//  Created by linhey on 2022/3/4.
//

import Foundation
import Stem

enum XCDataCompressionType: String {
    /// 使用自动压缩。
    case automatic
    /// 使用无损压缩
    case lossless
    /// 使用基本的压缩
    case none
    
    init?(from json: JSON) {
        guard let value = json["compression-type"].string else {
            return nil
        }
        self.init(rawValue: value)
    }
    
    var toJSON: [String: String] {
        return ["compression-type": rawValue]
    }
}
