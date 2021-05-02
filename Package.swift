// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Tom",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(name: "Tom", targets: ["Tom"]),
    ],
    targets: [
        .target(name: "Tom", path: "Source/Tom/Classes", linkerSettings: []),
        .testTarget(name: "TomTests", dependencies: ["Tom"]),
    ],
    swiftLanguageVersions: [.v5]
)
