import Foundation
import Features
import ArgumentParser
import Yams
import Stem
import StemFilePath

@main
struct Abrarion: AsyncParsableCommand {
    
    @Option(help: "A file to count lines in. If omitted, counts the lines of stdin.",
              completion: .file(),
              transform: URL.init(fileURLWithPath:))
    var config: URL
    
    @Option(help: "A file to count lines in. If omitted, counts the lines of stdin.",
              completion: .file(),
              transform: URL.init(fileURLWithPath:))
    var environment: URL?
    
    
    func run() async throws {
        do {
            guard let text = String(data: try STFile(config).data(), encoding: .utf8),
                  let yaml = try Yams.load(yaml: text) else {
                return
            }
            
            let json = JSON(yaml)
            print(json)
            
            let context = MissionContext()
        
            if let path = environment,
               let text = String(data: try STFile(path).data(), encoding: .utf8),
               let yaml = try Yams.load(yaml: text),
               let array = JSON(yaml)
                .array?
                .compactMap(\.dictionary)
                .map({ $0.compactMapValues(\.string) })
                .filter({ $0.count == 1 })
                .map({ (key: $0.keys.first!, value: $0.values.first!) }),
               array.isEmpty == false {
                print(array)
                array.forEach { item in
                    context.variables.register(Variables(key: item.key, value: item.value))
                }
            }
            
            let missionManager = MissionManager()
            missionManager.register(Shell(), for: "shell")
            missionManager.register(TidyDelete(), for: "tidy_delete")
            try await missionManager.run(from: json, context: context)
        } catch {
            print(error.localizedDescription)
        }
    }
    
}

