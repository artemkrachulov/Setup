// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Setup",
    platforms: [
        .iOS(.v9)
    ],
    products: [
        .library(
            name: "Setup",
            targets: ["Setup"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-log.git", from: "1.0.0")
    ],
    targets: [
        .target(
            name: "Setup",
            dependencies: [
                "Logging"
            ]),
        .testTarget(
            name: "SetupTests",
            dependencies: []),
    ]
)
