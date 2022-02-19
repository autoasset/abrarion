//
//  File.swift
//  
//
//  Created by linhey on 2022/2/4.
//

import Foundation

struct DownloadModel {
    
    enum Mode {
        case git
        case http
    }
    
    let mode: Mode
    let source: URL
    let output: String
    
}
