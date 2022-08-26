//
//  XCFileTagsManager.swift
//  
//
//  Created by linhey on 2022/8/24.
//

import Foundation
import StemFilePath

class XCFileTagsManager: XCMaker {
    
    private let model: XCFileTags
    
    private var store: [String: Set<STFile>] = [:]
    
    init(_ model: XCFileTags) async throws {
        self.model = model
        try await task()
    }
    
}

extension XCFileTagsManager {

    func vaild_files() -> Set<STFile> {
        var vailds = Set<STFile>()
        model.vaild_tags.forEach { tag in
            if let files = store[tag] {
                vailds.formUnion(files)
            }
        }
        var exclude = Set<STFile>()
        model.exclude_tags.forEach { tag in
            if let files = store[tag] {
                exclude.formUnion(files)
            }
        }
        return vailds.subtracting(exclude)
    }
    
}

private extension XCFileTagsManager {
    
    func task() async throws {
        for payload in model.expressions {
            try await files(from: payload.inputs)
                .filter { pass(payload, filename: $0.attributes.name) }
                .forEach { file in
                    payload.tags.forEach { tag in
                        if store[tag] == nil {
                            store[tag] = .init()
                        }
                        store[tag]?.update(with: file)
                    }
                }
        }
    }
    
    func pass(_ payload: XCFileTags.Expression, filename: String) -> Bool {
        let ranage = NSRange(filename.startIndex..., in: filename)
        if payload.patterns.isEmpty {
            switch payload.substitute {
            case .always_fail:
                return false
            case .always_pass:
                return true
            }
        }
        switch payload.kind {
        case .and:
            return payload.patterns.contains { regex in
                let result = regex.matches(in: filename, range: ranage)
                return result.first?.range != ranage
            } == false
        case .or:
            return payload.patterns.contains { regex in
                let result = regex.matches(in: filename, range: ranage)
                return result.first?.range == ranage
            }
        }
    }
    
}
