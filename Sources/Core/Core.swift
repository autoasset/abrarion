//
//  File.swift
//  
//
//  Created by linhey on 2022/2/4.
//

import Foundation
import Stem
import Yams

public enum ParsableCommandError: Error {
    case parsableFail
}


public enum FilePathError: Error {
    case folderIsNoEmpty(file: String = #file, line: Int = #line, function: String = #function, String)
}

public func json(from path: String?) throws -> JSON? {
    guard let path = path else { return nil }
    let file = try FilePath.File(path: path)
    let data = try file.data()
    guard let text = String(data: data, encoding: .utf8), let yml = try Yams.load(yaml: text) else {
        return nil
    }
    return JSON(yml)
}
