//
//  File.swift
//  
//
//  Created by linhey on 2022/7/25.
//

import Foundation
import STFilePath

public struct AppInfo {
    public static let shared = AppInfo()
    public let pwd = STFolder("./")
    public let version = "1.1.0"
}
