//
//  File.swift
//
//
//  Created by linhey on 2026/1/19.
//

import Foundation
import STColor
import STJSON
import Stem

struct HarmonyOSVariable {

    static func parseColor(name: String, option: HarmonyOSColorMaker.Options) -> String {
        if (try? StemColor(throwing: name)) != nil {
            return option.color_prefix_when_name_is_hex + name
        } else {
            return name
        }
    }

}
