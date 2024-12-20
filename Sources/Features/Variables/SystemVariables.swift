//
//  File.swift
//  
//
//  Created by linhey on 2022/7/20.
//

import Foundation
import SwiftGit
import STFilePath
import Stem
import STJSON

public struct SystemVariables {
    
    public static func variables() async throws -> [Variables] {
        try await gitVariables()
    }
    
    public static func gitVariables() async throws -> [Variables] {
        let repository = try Repository(git: .shared, path: "./")
        let folder = STFolder("./")
        let nameFormatter = NameFormatter(language: .swift, splitSet: .letters.union(.decimalDigits).inverted)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        func removeURLPassword(_ url: String) -> String? {
            guard url.hasPrefix("https://") || url.hasPrefix("http://"),
                  var components = URLComponents(string: url) else {
                return nil
            }
            /// 移除敏感信息
            components.user = nil
            components.password = nil
            return components.string ?? url
        }
        
        func package_name() async throws -> String {
            var name: String?
            do {
                if let url = URL(string: try await repository.lsRemote([.getURL], refs: [])),
                   let item = url.path.split(separator: "/").last?.split(separator: ".").first,
                   !item.isEmpty {
                    name = String(item)
                }
            } catch {
                
            }
            return name ?? folder.attributes.name
        }
        
        func lastTagVersion() async throws -> STVersion {
            do {
                return try await repository.lsRemote.tags()
                    .map(\.shortName)
                    .compactMap(STVersion.init)
                    .max() ?? STVersion(0, 0, 0)
            } catch {
#if !DEBUG
                throw error
#endif
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
                  desc: "git 项目远程链接",
                  value: {
                          let url = try await repository.lsRemote.url()?.absoluteString ?? ""
                          return removeURLPassword(url) ?? url
                      }),
            .init(key: "package.https_url",
                  desc: "git 项目远程链接,",
                  value: {
                      var url = try await repository.lsRemote.url()?.absoluteString ?? ""
                      if url.hasPrefix("git@") {
                          url = url.replacingOccurrences(of: ":", with: "/")
                          url = "ssh://" + url
                      }
                      if var components = URLComponents(string: url) {
                          components.user = nil
                          components.password = nil
                          components.path = components.path.split(separator: ".").dropLast().joined(separator: ".").description
                          components.scheme = "https"
                          url = components.string ?? url
                      }
                      return url
                  }),
            .init(key: "git.last.tag.version",
                  desc: "最近一次 git tag 版本号",
                  value: { try await lastTagVersion().description }),
            .init(key: "git.next.tag.major_version",
                  desc: "获取 major.minor.patch 格式的 git tag 记录, 选取最大的version, 并在 major 部分 +1, 后面部分重置为 0",
                  value: {
                      let version = try await lastTagVersion()
                      return STVersion(version.major + 1, 0, 0).description
                  }),
            .init(key: "git.next.tag.minor_version",
                  desc: "获取 major.minor.patch 格式的 git tag 记录, 选取最大的version, 并在 minor 部分 +1, 后面部分重置为 0",
                  value: {
                      let version = try await lastTagVersion()
                      return STVersion(version.major, version.minor + 1, 0).description
                  }),
            .init(key: "git.next.tag.patch_version",
                  desc: "获取 major.minor.patch 格式的 git tag 记录, 选取最大的version, 并在 patch 部分 +1",
                  value: {
                      let version = try await lastTagVersion()
                      return STVersion(version.major, version.minor, version.patch + 1).description
                  }),
            .init(key: "git.current.commit.description",
                  desc: "上一次提交记录详细",
                  value: {
                      if let logs = try await repository.log().first {
                          let show = try await repository.show(commit: logs.id)
                          var result = ["user: \(show.author.user.name)",
                                        "date: \(dateFormatter.string(from: show.author.date))",
                                        "hash: \(show.ID)",
                                        " msg: \(show.message)",]
                          
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
                              if deleted.count == 1, let msg = deleted.first?.trimmingCharacters(in: .whitespacesAndNewlines) {
                                  result += ["deleted: \(msg)"]
                              } else {
                                  result += ["deleted:"]
                                  result += deleted
                              }
                          }
                          
                          if new.isEmpty == false {
                              if new.count == 1, let msg = new.first?.trimmingCharacters(in: .whitespacesAndNewlines) {
                                  result += [" new: \(msg)"]
                              } else {
                                  result += [" new:"]
                                  result += new
                              }
                          }
                          return result.joined(separator: "\n")
                      } else {
                          return ""
                      }
                  }),
            .init(key: "git.current.commit.id",
                  desc: "上一次提交记录 ID",
                  value: { try await repository.log().first?.id ?? "" }),
            .init(key: "git.current.commit.user.email",
                  desc: "上一次提交记录用户的 email",
                  value: { try await repository.log().first?.commit.user.email ?? "" }),
            .init(key: "git.current.commit.user.name",
                  desc: "上一次提交记录用户的名称",
                  value: { try await repository.log().first?.commit.user.name ?? "" }),
            .init(key: "git.current.commit.date",
                  desc: "上一次提交记录的日期",
                  value: {
                      if let date = try await repository.log().first?.commit.date {
                          return dateFormatter.string(from: date)
                      }
                      return ""
                  }),
            .init(key: "git.current.commit.message",
                  desc: "上一次提交记录的信息",
                  value: { try await repository.log().first?.commit.user.name ?? "" })
            
        ]
        
    }
    
}
