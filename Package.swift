// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "abrarion",
    platforms: [.macOS(.v12)],
    dependencies: [
        .package(url: "https://github.com/jpsim/Yams.git", .upToNextMajor(from: "5.0.1")),
        .package(url: "https://github.com/apple/swift-argument-parser", .upToNextMajor(from: "1.1.3")),
        .package(url: "https://github.com/linhay/swift-git", branch: "main"),
        // .package(url: "https://github.com/linhay/Stem", .upToNextMajor(from: "1.1.1")),
        .package(url: "https://github.com/linhay/Stem", branch: "master"),
//         .package(path: "/Users/linhey/Desktop/Stem")
    ],
    targets: [
        .target(name: "Features",
               dependencies: [
                .product(name: "SwiftGit", package: "swift-git"),
                .product(name: "Stem", package: "Stem"),
                .product(name: "StemFilePath", package: "Stem"),
                .product(name: "StemColor", package: "Stem"),
               ]),
        .executableTarget(
            name: "abrarion",
            dependencies: [
                "Features",
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
                .product(name: "Yams", package: "Yams")
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
