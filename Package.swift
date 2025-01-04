// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ToolTipKit",
    platforms: [
        .iOS(.v12)
    ],
    products: [
        .library(name: "ToolTipKit", targets: ["ToolTipKit"])
    ],
    dependencies: [
        .package(url: "https://github.com/SnapKit/SnapKit.git", .upToNextMajor(from: "5.7.0"))
    ],
    targets: [
        .target(name: "ToolTipKit", dependencies: ["SnapKit"])
    ]
)
