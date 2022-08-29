//
//  XCFileTagsManager.swift
//  
//
//  Created by linhey on 2022/8/24.
//

import Foundation
import StemFilePath

class XCInputFileManager: XCMaker {
    
    private let action: Action
    
    enum Action {
        case files([String])
        case tags(XCFileTags)
    }
    
    private var store: [String: Set<STFile>] = [:]
    
    init(_ model: XCInputsOptions) async throws {
        if let action = model.file_tags {
            self.action = .tags(action)
            store.removeAll()
            try await task(model: action)
        } else {
            self.action = .files(model.inputs)
        }
    }
    
}

extension XCInputFileManager {
    
    func files(tags: [String]) async throws -> Set<STFile> {
        switch action {
        case .files:
            return .init()
        case .tags:
            var vailds = Set<STFile>()
            for tag in tags {
                if let files = store[tag] {
                    vailds.formUnion(files)
                }
            }
            return vailds
        }
    }

    func vaild_files() async throws -> Set<STFile> {
        switch action {
        case .files(let inputs):
            return try await .init(self.files(from: inputs))
        case .tags(let model):
            let vailds  = try await files(tags: model.vaild_tags)
            let exclude = try await files(tags: model.exclude_tags)
            return vailds.subtracting(exclude)
        }
    }
    
}

private extension XCInputFileManager {
    
    func task(model: XCFileTags) async throws {
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
        case .reversed_or:
            return payload.patterns.contains { regex in
                let result = regex.matches(in: filename, range: ranage)
                return result.first?.range == ranage
            } == false
        }
    }
    
}
