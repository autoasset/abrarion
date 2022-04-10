import XCTest
import Abrarion

class AbrarionTests: XCTestCase {
    
    func runApp(bash: String) throws -> String {
       return try runApp(arguments: bash.split(separator: " ").map(\.description))
    }
    
    func runApp(arguments: [String]) throws -> String {
        guard #available(macOS 10.13, *) else {
            return ""
        }

        #if !targetEnvironment(macCatalyst)
        let fooBinary = productsDirectory.appendingPathComponent(Abrarion.configuration.commandName ?? "")

        let process = Process()
        process.executableURL = fooBinary
        process.arguments = arguments
        
        let pipe = Pipe()
        process.standardOutput = pipe

        try process.run()
        process.waitUntilExit()

        let data = pipe.fileHandleForReading.readDataToEndOfFile()
        return String(data: data, encoding: .utf8)?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        #endif
    }

    var productsDirectory: URL {
      #if os(macOS)
        for bundle in Bundle.allBundles where bundle.bundlePath.hasSuffix(".xctest") {
            return bundle.bundleURL.deletingLastPathComponent()
        }
        fatalError("couldn't find the products directory")
      #else
        return Bundle.main.bundleURL
      #endif
    }
    
}
