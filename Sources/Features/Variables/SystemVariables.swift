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
    
    public static func gitVariables() async throws -> [Variables] {
        let repository = try Repository(path: "./", environment: .shared)
        let folder = STFolder("./")
        let nameFormatter = NameFormatter(language: .swift, splitSet: .letters.union(.decimalDigits).inverted)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        func package_name() async throws -> String {
            var name: String?
            do {
                let url = try await repository.lsRemote([.getURL], refs: [])
                name = URL(string: url)?.lastPathComponent.split(separator: ".").first?.description
            } catch {
                
            }
            return name ?? folder.url.lastPathComponent
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
                  }),
            .init(key: "git.current.commit.description",
                  desc: "上一次提交记录详细",
                  value: {
                      if let logs = try await repository.log().first {
                          let show = try await repository.show(commit: logs.id)
                          var result = ["\(show.message)",
                                        "user: \(show.author.user.name)",
                                        "date: \(dateFormatter.string(from: show.author.date))",
                                        "hash: \(show.ID)"]
                          
                          let deleted = show.items
                              .filter({ !Set([.renameFrom, .deleted, .copyFrom]).isDisjoint(with: $0.actions.map(\.type)) })
                              .map(\.diff.a)
                              .compactMap { $0.split(separator: "/").last }
                              .map({ "     \($0)" })
                              .sorted()
                          
                          let new = show.items
                              .filter({ !Set([.renameTo, .new, .copyTo]).isDisjoint(with: $0.actions.map(\.type)) })
                              .map(\.diff.b)
                              .compactMap { $0.split(separator: "/").last }
                              .map({ "     \($0)" })
                              .sorted()
                          
                          if deleted.isEmpty == false {
                              result += ["deleted:"]
                              result += deleted
                          }
                          
                          if new.isEmpty == false {
                              result += ["new:"]
                              result += new
                          }
                          return result.joined(separator: "\n")
                      } else {
                          return ""
                      }
                  })
        ]
        
    }
    
}
