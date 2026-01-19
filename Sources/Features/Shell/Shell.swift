//
//  File.swift
//
//
//  Created by linhey on 2022/7/19.
//

import Foundation
import Logging
import STFilePath
import STJSON
import Stem

public struct Shell: MissionInstance {

    public var logger: Logger?

    struct Options {

        var commands: [String]
        var allow_errors: Bool
        var environment: [String: String]

        public init(from json: JSON, variables: VariablesManager) async throws {
            self.allow_errors = json["allow_errors"].boolValue
            if let item = json.string {
                self.commands = [try await variables.parse(item)]
            } else if let item = json.array?.compactMap(\.string) {
                self.commands = try await variables.parse(item)
            } else {
                self.commands = try await variables.parse(
                    json["commands"].arrayValue.map(\.stringValue))
            }
            self.environment = json["environment"].dictionaryValue.compactMapValues(\.string)
        }
    }

    let shell: StemShell.Instance

    init(shell: StemShell.Instance) {
        self.shell = shell
    }

    public func evaluate(from json: JSON, context: MissionContext) async throws {
        let options = try await Options(from: json, variables: context.variables)
        let commands = try await context.variables.parse(options.commands)
        try evaluate(
            commands: commands,
            environment: options.environment,
            allow_errors: options.allow_errors)
    }

    public func evaluate(
        commands: [String],
        environment: [String: String] = [:],
        allow_errors: Bool = false
    ) throws {
        let context = StemShell.Context(environment: environment)
        for command in commands {
            do {
                logger?.info(.init(stringLiteral: command))
                guard
                    let result = try shell.shell(string: .init(command: command, context: context))
                else {
                    continue
                }
                logger?.info(.init(stringLiteral: "\n" + result))
            } catch {
                logger?.error(.init(stringLiteral: "❌ Command run failed: \(command)"))
                logger?.error(.init(stringLiteral: "❌ Error: \(error)"))
                if allow_errors {
                    logger?.info("⚠️ allow_errors is true, continuing...")
                } else {
                    throw error
                }
            }
        }
    }

}
