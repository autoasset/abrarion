//
//  File.swift
//  
//
//  Created by linhey on 2022/7/20.
//

import Foundation
import SwiftGit
import StemFilePath
import Stem

public struct SystemVariables {
    
    
    public static func variables() async throws -> [Variables] {
        try await gitVariables()
    }
    
    
//    public static func packageVariables() async throws -> [Variables] {
//        let repository = try Repository(path: "./", environment: .shared)
//
//        return [
//            .init(key: "package.recommend.name",
//                  desc: ,
//                  value: )
//        ]
//    }
    
    public static func gitVariables() async throws -> [Variables] {
        let repository = try Repository(path: "./", environment: .shared)
        let folder = STFolder("./")
        let nameFormatter = NameFormatter(language: .swift, splitSet: .letters.union(.decimalDigits).inverted)

        func package_name() async throws -> String {
            URL(string: try await repository.lsRemote([.getURL], refs: []))?.lastPathComponent ?? folder.url.lastPathComponent
        }

        func lastTagVersion() async throws -> STVersion {
            for tag in try await repository.lsRemote.tags() {
                if let version = STVersion(tag.shortName) {
                    return version
                }
            }
            return STVersion(0, 0, 0)
        }
        
        return [
            .init(key: "package.name",
                  desc: "git 项目名称",
                  value: package_name),
            .init(key: "package.name.cameled",
                  desc: "git 项目名称(驼峰形式, 首字母大写)",
                  value: { try await nameFormatter.splitWords(package_name()).map(\.localizedCapitalized).joined() }),
            .init(key: "package.name.snaked",
                  desc: "git 项目名称(下划线形式)",
                  value: { try await nameFormatter.snakeCased(package_name()) }),
            
            .init(key: "package.url",
                  desc: "git 项目 远程链接",
                  value: { try await repository.lsRemote.url()?.absoluteString ?? "" }),
            
            .init(key: "git.last.tag.version",
                  desc: "最近一次 git tag 版本号",
                  value: { try await lastTagVersion().description }),
            .init(key: "git.next.tag.major_version",
                  desc: "最近一次 git tag 版本号",
                  value: {
                      let version = try await lastTagVersion()
                      return STVersion(version.major + 1, version.minor, version.patch).description
                  }),
            .init(key: "git.next.tag.minor_version",
                  desc: "最近一次 git tag 版本号",
                  value: {
                      let version = try await lastTagVersion()
                      return STVersion(version.major, version.minor + 1, version.patch).description
                  }),
            .init(key: "git.next.tag.patch_version",
                  desc: "最近一次 git tag 版本号",
                  value: {
                      let version = try await lastTagVersion()
                      return STVersion(version.major, version.minor, version.patch + 1).description
                  })
            //            .init(key: "git.last.commits.no_ci_skip",
            //                  desc: "上一次含有 [ci skip] 的提交到当前提交的提交记录",
            //                  value: {
            //                      let logs = try await repository.log()
            //                      let index = logs.firstIndex { result in
            //                          result.message.contains(<#T##other: StringProtocol##StringProtocol#>)
            //                      }
            //                  })
        ]
        
    }
    
}
