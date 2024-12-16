// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "abrarion",
    platforms: [.macOS(.v13)],
    dependencies: [
        .package(url: "https://github.com/linhay/STColor.git", from: "1.0.0"),
        .package(url: "https://github.com/linhay/STJSON.git", from: "1.1.4"),
        .package(url: "https://github.com/swhitty/SwiftDraw", from: "0.18.1"),
        .package(url: "https://github.com/jpsim/Yams.git", from: "5.1.3"),
        .package(url: "https://github.com/JohnSundell/CollectionConcurrencyKit", from: "0.2.0"),
        .package(url: "https://github.com/apple/swift-log.git", from: "1.6.1"),
        .package(url: "https://github.com/apple/swift-argument-parser.git", from: "1.5.0"),
        .package(url: "https://github.com/linhay/swift-git", from: "2.0.1"),
        .package(url: "git@github.com:linhay/Stem.git", from: "2.1.0"),
        .package(url: "https://github.com/linhay/STFilePath", from: "1.2.0"),
        .package(url: "https://github.com/scinfu/SwiftSoup.git", from: "2.7.5")
    ],
    targets: [
        .target(name: "Features",
                dependencies: [
                    "SwiftSoup",
                    "SwiftDraw",
                    .product(name: "Logging", package: "swift-log"),
                    .product(name: "SwiftGit", package: "swift-git"),
                    .product(name: "Stem", package: "Stem"),
                    .product(name: "STJSON", package: "STJSON"),
                    .product(name: "STFilePath", package: "STFilePath"),
                    .product(name: "STColor", package: "STColor"),
                    .product(name: "CollectionConcurrencyKit", package: "CollectionConcurrencyKit"),
                ]),
        .executableTarget(
            name: "abrarion",
            dependencies: [
                "Features",
                "SwiftSoup",
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
                .product(name: "Yams", package: "Yams"),
            ]),
        .testTarget(
            name: "abrarionTests",
            dependencies: ["abrarion",
                           "Features",
                          ]),
    ]
)
