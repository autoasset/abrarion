//
//  File.swift
//  
//
//  Created by linhey on 2022/7/24.
//

import Foundation
import ArgumentParser
import Stem
import StemFilePath
import SwiftGit

struct Publish: AsyncParsableCommand {
    
    func run() async throws {
        Git._shared = try Git(environment: .init(type: .system))
        do {
            let version = Abrarion.configuration.version
            let release = STFolder(".release")
            _ = try? release.delete()
            _ = try? release.create()
            try await StemShell.zsh(string: "swift build -c release")
            let file = STFile(".release/abrarion-\(version).tar.gz")
            var exec = STFile(".build/release/abrarion")
            exec = try exec.copy(into: release)
            try await StemShell.zsh(string: "cd \(release.path) && tar -cf \(file.path) abrarion")
            guard let sha256 = try await StemShell.zsh(string: "shasum -a 256 \(file.path)")?
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
            try await repository.add([], paths: ["."])
            try await repository.commit([.message(version)])
            try await repository.push([], refspecs: [])
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
