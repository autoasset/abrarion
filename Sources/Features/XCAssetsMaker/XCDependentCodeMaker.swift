//
//  File.swift
//  
//
//  Created by linhey on 2022/6/27.
//

import StemFilePath

struct XCDependentCodeMaker {
    
    static func createFindModule(in folder: STFolder) throws {
        let code = """
        import Foundation
        
        private class AbrarionBundleFinder {}
        
        extension Foundation.Bundle {
            static func module(name: String) -> Bundle {
                #if SWIFT_PACKAGE
                return .module
                #else
                if !name.isEmpty,
                   let url = Bundle(for: AbrarionBundleFinder.self).url(forResource: name, withExtension: "bundle"),
                   let bundle = Bundle(url: url) {
                    return bundle
                }
                return .main
                #endif
            }
        }
        """
        let file = folder.file(name: "AbrarionBundleFinder.swift")
        try file.overlay(with: code.data(using: .utf8))
    }
    
}
