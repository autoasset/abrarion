import Foundation
import Features
import ArgumentParser
import Yams
import Stem
import StemFilePath
import Logging

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
        let logger = Logger(label: "[abrarion]")
        do {
            guard let text = String(data: try STFile(config).data(), encoding: .utf8),
                  let yaml = try Yams.load(yaml: text) else {
                return
            }
            
            let json = JSON(yaml)            
            let context = MissionContext()
            try await context.variables.register(SystemVariables.variables())
        
            if let path = environment,
               let text = String(data: try STFile(path).data(), encoding: .utf8),
               let yaml = try Yams.load(yaml: text),
               let array = JSON(yaml)
                .array?
                .compactMap(\.dictionary)
                .map({ $0.compactMapValues(\.string) })
                .filter({ $0.count == 1 })
                .map({ Variables(key: $0.keys.first!, value: $0.values.first!) }),
               array.isEmpty == false {
                context.variables.register(array)
            }
            
            let missionManager = MissionManager()
            missionManager.register(XCReport.shared, for: "report")
            missionManager.register(FlutterIconFontMaker(), for: "flutter_iconfont")
            missionManager.register(CustomVariables(), for: "variables")
            missionManager.register(Cocoapods(), for: "cocoapods_push")
            missionManager.register(Shell(), for: "shell")
            missionManager.register(TidyDelete(), for: "tidy_delete")
            missionManager.register(TidyCreate(), for: "tidy_create")
            missionManager.register(TidyCopy(), for: "tidy_copy")
            missionManager.register(XCColorMaker(), for: "xcassets_colors")
            missionManager.register(XCImageMaker(), for: "xcassets_images")
            missionManager.register(XCIconFontMaker(), for: "xcassets_iconfonts")
            missionManager.register(XCDataMaker(), for: "xcassets_datas")
            try await missionManager.run(from: json, context: context)
            try XCReport.shared.finish()
        } catch {
            logger.error(.init(stringLiteral: error.localizedDescription))
            Abrarion.exit(withError: error)
        }
    }
    
}

