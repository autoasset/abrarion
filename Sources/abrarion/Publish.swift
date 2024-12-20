//
//  File.swift
//  
//
//  Created by linhey on 2022/7/24.
//

import Foundation
import ArgumentParser
import Stem
import STJSON
import STFilePath
import SwiftGit

struct Publish: AsyncParsableCommand {
    
    func run() async throws {
        Git._shared = try Git(environment: .init(type: .system))
        do {
            let version = Abrarion.configuration.version
            let release = STFolder(".release")
            _ = try? release.delete()
            _ = try? release.create()
            try StemShell.zsh(string: "swift build -c release --arch arm64 --arch x86_64")
            let file = STFile(".release/abrarion-\(version).tar.gz")
            var exec = STFile(".build/apple/Products/Release/abrarion")
            exec = try exec.copy(into: release)
            try StemShell.zsh(string: "cd \(release.path) && tar -cf \(file.path) abrarion")
            guard let sha256 = try StemShell.zsh(string: "shasum -a 256 \(file.path)")?
                .split(separator: " ")
                .first?
                .description else {
                return
            }
            print("sha256: \(sha256)")
            let forual = forual(version: Abrarion.configuration.version, sha256: sha256)
            let repository = try await Git.shared.clone([.singleBranch, .depth(1)],
                                                        repository: "git@github.com:autoasset/homebrew-abrarion.git",
                                                        directory: ".release/homebrew-abrarion")
            try STFile(".release/homebrew-abrarion/Formula/abrarion.rb").overlay(with: forual.data(using: .utf8))
            
            let documentation = STFolder("Documentation")
            let release_documentation = STFolder(".release/homebrew-abrarion/Documentation")
            _ = try? release_documentation.delete()
            try documentation.copy(into: .init(".release/homebrew-abrarion"))
            
            let readme = STFile("./README.md")
            try readme.replace(.init(".release/homebrew-abrarion/README.md"))
            
            try await repository.add([], paths: ["."])
            try await repository.commit([.message(version)])
            _ = try? await repository.push([], refspecs: [])
            _ = try? await repository.tag([.delete], tagname: version)
            _ = try? await repository.push.delete(.tag(.init(version)))
            try await repository.tag([], tagname: version)
            try await repository.push.tag(version)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func forual(version: String, sha256: String) -> String {
        """
        class Abrarion < Formula
          desc "任务编排工具"
          homepage "https://github.com/autoasset/homebrew-abrarion"
          url "https://github.com/autoasset/homebrew-abrarion/releases/download/\(version)/abrarion-\(version).tar.gz"
          sha256 "\(sha256)"
          def install
            bin.install "abrarion"
          end
          test do
            system "false"
          end
        end
        """
    }
    
}
