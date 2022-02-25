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

    enum Mode: String {
        case auto
        case git
        case http
    }
    
    struct Credentials {

        let username: String
        let password: String
        
        init?(username: String, password: String) {
            self.username = username
            self.password = password
            if self.username.isEmpty, self.password.isEmpty {
                return nil
            }
        }
        
        init?(from json: JSON) {
            self.username = json["username"].stringValue
            self.password = json["password"].stringValue
            if self.username.isEmpty, self.password.isEmpty {
                return nil
            }
        }
    }
    
    var mode: Mode
    let source: URL
    let output: String
    let credentials: Credentials?
    
    init(from json: JSON) throws {
        guard let url = json["source"].url else {
            throw ParsableCommandError.parsableFail
        }
        self.mode = .auto
        self.source = url
        self.output = json["output"].stringValue
        self.credentials = .init(from: json)
    }
    
    init(mode: DownloadModel.Mode, source: URL, output: String, credentials: Credentials?) {
        self.mode = mode
        self.source = source
        self.output = output
        self.credentials = credentials
    }
    
}


struct DownloadConfig {
    
    let models: [DownloadModel]
    
    init(models: [DownloadModel]) {
        self.models = models
    }
    
    init(from json: JSON) {
        self.models = json["models"].arrayValue.compactMap({ try? DownloadModel(from: $0) })
    }
}
