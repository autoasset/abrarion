// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let ArgumentParser = Target.Dependency.product(name: "ArgumentParser", package: "swift-argument-parser")
let Stem = Target.Dependency.product(name: "Stem", package: "Stem")
let Yams = Target.Dependency.product(name: "Yams", package: "Yams")
let Abrarion = "Abrarion"
let Download = "Download"
let XCAssets = "XCAssets"
let Core = "Core"

let TargetDefaultdependencies: [Target.Dependency] = [
    .init(stringLiteral: Core),
    ArgumentParser,
    Stem,
]

let package = Package(
    name: Abrarion,
    platforms: [ .macOS(.v12) ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-log.git", .upToNextMajor(from: "1.4.2")),
        .package(url: "https://github.com/linhay/Stem.git", .upToNextMajor(from: "1.0.7")),
        .package(url: "https://github.com/jpsim/Yams.git", .upToNextMajor(from: "4.0.6")),
        .package(url: "https://github.com/apple/swift-argument-parser", .branch("async")),
        .package(url: "https://github.com/kareman/SwiftShell.git", .upToNextMajor(from: "5.1.0")),
        .package(name: "SwiftGit", path: "/Users/linhey/Desktop/SwiftGit")
    ],
    targets: [
        .target(
            name: Core,
            dependencies: [
                Stem,
                ArgumentParser,
                Yams
            ]),
        .target(
            name: XCAssets,
            dependencies: TargetDefaultdependencies
        ),
        .target(
            name: Download,
            dependencies: TargetDefaultdependencies + [
                "SwiftGit",
            ]),
        .executableTarget(
            name: Abrarion,
            dependencies: [
                ArgumentParser,
                .init(stringLiteral: Download),
                .init(stringLiteral: XCAssets)
            ]),
        .testTarget(
            name: "abrarionTests",
            dependencies: [
                Stem,
                .init(stringLiteral: Abrarion),
                .init(stringLiteral: XCAssets),
                .init(stringLiteral: Download)
            ]),
    ]
)
