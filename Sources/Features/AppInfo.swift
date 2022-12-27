//
//  File.swift
//  
//
//  Created by linhey on 2022/7/25.
//

import Foundation
import StemFilePath

public struct AppInfo {
    public static let shared = AppInfo()
    
    public let pwd = STFolder("./")
    public let version = "0.0.33"
}
