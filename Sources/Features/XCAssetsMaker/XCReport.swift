//
//  File.swift
//  
//
//  Created by linhey on 2022/6/23.
//

import Foundation
import StemFilePath

protocol XCReportPayload: Codable {
    static var Key: String { get }
    static var Message: String { get }
}

class XCReport {
    
    static let shared = XCReport()
    
    private var store = [String: [Any]]()
    
    /// 重复文件报告
    func duplicates(_ with: [STFile]) {
        
    }
    
    /// 非法的命名
    func illegalFileName(_  file: STFile, with regexs: [XCFileLint]) -> STFile? {
        guard !regexs.isEmpty else {
            return file
        }
        return file
    }
    
    func vaild(_ record: XCImageMaker.AssetsRecord) -> XCImageMaker.AssetsRecord {
        return record
    }
    
    func vaild(_ record: XCDataMaker.AssetsRecord) -> XCDataMaker.AssetsRecord {
        return record
    }
    
    func add(_ payload: XCReportPayload) {
        let key = type(of: payload).Key
        if self.store[key] == nil {
            self.store[key] = []
        }
        self.store[key]?.append(payload)
    }
    
}
