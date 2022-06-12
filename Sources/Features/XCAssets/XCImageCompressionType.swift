//
//  File.swift
//  
//
//  Created by linhey on 2022/2/21.
//

import Foundation
import Stem

public enum XCImageCompressionType: String {
    /// 图像使用自动有损压缩。
    case automatic
    /// 图像使用无损压缩
    case lossless
    /// 该图像使用基本的有损压缩
    case lossy
    /// 图像使用针对质量进行了优化的有损 GPU 压缩格式
    case gpuOptimizedBest = "gpu-optimized-best"
    /// 该图像使用针对内存大小优化的有损 GPU 压缩格式
    case gpuOptimizedSmallest = "gpu-optimized-smallest"
    
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
