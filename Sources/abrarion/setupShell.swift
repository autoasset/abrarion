//
//  File.swift
//  abrarion
//
//  Created by linhey on 11/22/24.
//

import Stem
import STFilePath

func setupShell() throws -> StemShell.Instance {
    var shell = StemShell.Instance()
    var env = ""
    if let value = try? STFile("/usr/bin/env").read() {
        env += "\n" + value
    }
    if let value = try? STFile("~/.abrarion/environment.txt").read() {
        env += "\n" + value
    }

    let environment = env
        .split(separator: "\n")
        .compactMap { row -> (key: String, value: String)? in
            let list = row.split(separator: "=", maxSplits: 1)
            guard list.count == 2 else {
                return nil
            }
            return (list[0].description, list[1].description)
        }.dictionary(key: \.key, value: \.value)
        
    shell.changedArgsBeforeRun = { ctx in
        var paths = ctx.context?.environment["PATH"]?
            .split(separator: ":")
            .filter({ !$0.isEmpty })
            .map(\.description) ?? []
        
        paths += environment["PATH"]?
            .split(separator: ":")
            .filter({ !$0.isEmpty })
            .map(\.description) ?? []
        
        paths += [
            "/usr/local/bin"
        ]
        paths = Set(paths)
            .sorted(by: { lhs, rhs in
                lhs.split(separator: "/").count < rhs.split(separator: "/").count
            })
        
        var environment: [String:String] = environment
            .merging(ctx.context?.environment ?? [:], uniquingKeysWith: { $1 })
        environment["PATH"] = paths.joined(separator: ":")
        environment["PATH"] = paths.joined(separator: ":")
        
        var context = ctx.context ?? .init()
        context.environment = environment
        ctx.context = context
    }
    
    return shell
}
