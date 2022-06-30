//
//  File.swift
//  
//
//  Created by linhey on 2022/6/20.
//

import Foundation
import StemFilePath

protocol XCMaker {}

extension XCMaker {
    
    func files(from inputs: [String]) async throws -> [STFile] {
        try inputs
            .map(STPath.init)
            .map({ item -> [STFile] in
                switch item.referenceType {
                case .file(let file):
                    return [file]
                case .folder(let folder):
                    return try folder.allSubFilePaths().compactMap(\.asFile)
                }
            })
            .flatMap({ $0 })
    }
    
}
