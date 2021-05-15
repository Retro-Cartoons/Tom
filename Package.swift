// swift-tools-version:5.3

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
        .target(name: "Tom", path: "Sources")
    ],
    swiftLanguageVersions: [.v5]
)
