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
    dependencies: [],
    targets: [
        .target(
            name: "Setup",
            dependencies: []),
        .testTarget(
            name: "SetupTests",
            dependencies: []),
    ]
)
