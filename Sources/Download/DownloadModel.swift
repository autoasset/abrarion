//
//  File.swift
//  
//
//  Created by linhey on 2022/2/4.
//

import Foundation
import Stem
import Core

struct DownloadModel {

    
    
    enum Mode {
        case auto
        case git
        case http
    }
    
    let mode: Mode
    let source: URL
    let output: String
    
    init(from json: JSON) throws {
        guard let url = json["source"].url else {
            throw ParsableCommandError.parsableFail
        }
        self.mode = .auto
        self.source = url
        self.output = json["output"].stringValue
    }
    
    init(mode: DownloadModel.Mode, source: URL, output: String) {
        self.mode = mode
        self.source = source
        self.output = output
    }
    
}


struct DownloadConfig {
    
    let models: [DownloadModel]
    
    init(from json: JSON) {
        self.models = json["models"].arrayValue.compactMap({ try? DownloadModel(from: $0) })
    }
}
