//
//  File.swift
//  
//
//  Created by linhey on 2022/6/23.
//

import Foundation
import STFilePath
import Stem
import STColor
import STJSON
import Logging

protocol XCErrorReportPayload: Codable {
    static var Key: String { get }
    static var Message: String { get }
}

public class XCReport: MissionInstance {
    
    public struct Options {
        
        var output: STFolder?
        var pwd = STPath("./").path + "/"
        
        init(json: JSON, variables: VariablesManager) async throws {
            if let item = json.string {
                output = STFolder(try await variables.parse(item))
            } else if let item = json["output"].string {
                output = STFolder(try await variables.parse(item))
            } else {
                throw StemError(message: "参数缺失: output")
            }
        }
        
    }
    
    public func evaluate(from json: JSON, context: MissionContext) async throws {
        let options = try await Options(json: json, variables: context.variables)
        XCReport.shared.options = options
    }
    
    public var logger: Logger?
    public static let shared = XCReport()
    
    private var options: Options?
    
    var payload = Payload()
    
    public func finish() throws {
        let encoder = JSONEncoder()
        encoder.outputFormatting = [.prettyPrinted, .withoutEscapingSlashes, .sortedKeys]
        try options?.output?
            .file("abrarion_report.json")
            .overlay(with: encoder.encode(payload))
    }
    
    /// 重复文件报告
    func duplicates(_ with: [STFile]) {
        
    }
    
    /// 未使用的 content 文件
    func unused_contents(_ with: Set<STFile>) {
        payload.unused_contents_files.formUnion(with.map(filePath))
    }
    
    func filePath(_ file: STFile) -> String {
        guard let options = options, file.path.hasPrefix(options.pwd) else {
            return file.path
        }
        return String(file.path.dropFirst(options.pwd.count))
    }
    
    /// 非法的命名
    func illegalFileName(_  file: STFile, with regexs: [XCFileTags]) -> STFile? {
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
    
    func add(_ payload: ErrorType) {
        self.payload.errors.append(payload)
    }
    
    func add(_ payload: RedundantFiles) {
        self.payload.errors.append(.redundantFiles(payload: payload))
    }
    
    func add(_ payload: ContentsNoIncludedRequiredFiles) {
        self.payload.errors.append(.contentsNoIncludedRequiredFiles(payload: payload))
    }
    
}


extension XCReport {
    
    enum ErrorType: Codable {
        case error(payload: ReportError)
        case redundantFiles(payload: RedundantFiles)
        case contentsNoIncludedRequiredFiles(payload: ContentsNoIncludedRequiredFiles)
        
    }
    
    struct ReportError: Codable {
        let message: String
    }
    
    struct ContentsNoIncludedRequiredFiles: Codable, XCErrorReportPayload {
        static var Key: String = "image_contents_no_included_requiredFiles"
        static var Message: String = "图片描述文件验证错误 (描述文件中包含的文件名未在磁盘上找到)"
        let contents: String
        let missingFiles: [String]
    }
    
    struct RedundantFiles: Codable, XCErrorReportPayload {
        static var Key: String = "image_redundant_files"
        static var Message: String = "图片文件验证错误 (冗余图片)"
        let files: [String]
    }
    
    struct Payload: Codable {
        var unused_contents_files: Set<String> = .init()
        var errors: [ErrorType] = []
    }
    
}
