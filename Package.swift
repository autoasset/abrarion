// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "abrarion",
    platforms: [.macOS(.v12)],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser", from: "1.1.2"),
        .package(url: "https://github.com/linhay/SwiftGit", branch: "main"),
        .package(url: "https://github.com/linhay/Stem", branch: "master"),
    ],
    targets: [
        .target(name: "Features",
               dependencies: [
                "SwiftGit",
                .product(name: "Stem", package: "Stem"),
                .product(name: "StemFilePath", package: "Stem"),
                .product(name: "StemColor", package: "Stem"),
               ]),
        .executableTarget(
            name: "abrarion",
            dependencies: [
                "Features",
                .product(name: "ArgumentParser", package: "swift-argument-parser")
            ]),
        .testTarget(
            name: "abrarionTests",
            dependencies: ["abrarion",
                           "Features",
                           .product(name: "Stem", package: "Stem"),
                           .product(name: "StemFilePath", package: "Stem"),
                           .product(name: "StemColor", package: "Stem")]),
    ]
)
