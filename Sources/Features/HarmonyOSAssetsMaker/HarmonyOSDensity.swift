//
//  HarmonyOSDensity.swift
//
//
//  Created by abrarion on 2026/1/12.
//

import Foundation

/// HarmonyOS 屏幕密度限定词
/// 参考: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/resource-categories-and-access
enum HarmonyOSDensity: String, CaseIterable {

    /// 默认资源目录，作为 fallback
    case base = "base"
    /// 0.75x - DPI (0, 120]
    case sdpi = "sdpi"
    /// 1x 基准 - DPI (120, 160]
    case mdpi = "mdpi"
    /// 1.5x - DPI (160, 240]
    case ldpi = "ldpi"
    /// 2x - DPI (240, 320]
    case xldpi = "xldpi"
    /// 3x - DPI (320, 480]
    case xxldpi = "xxldpi"
    /// 4x - DPI (480, 640]
    case xxxldpi = "xxxldpi"

    /// 对应的暗黑模式目录名
    var dark: String {
        if self == .base {
            return "dark"
        }
        return "dark-\(rawValue)"
    }

    /// 资源子目录为 media
    var mediaPath: String {
        return "\(rawValue)/media"
    }

    /// 暗黑模式资源子目录
    var darkMediaPath: String {
        return "\(dark)/media"
    }
}
