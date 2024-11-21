//
//  ZSH.swift
//  abrarion
//
//  Created by linhey on 11/22/24.
//

import Foundation
import ArgumentParser
import Features

struct ZSH: AsyncParsableCommand {
        
    @Argument(help: "The phrase to repeat.")
    var string: String
    
    func run() async throws {
        try await Shell().evaluate(commands: [string])
    }
    
}
