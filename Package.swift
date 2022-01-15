// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "ReadabilityKit",
    platforms: [
        .macOS(.v10_12)
    ],
    products: [
        .library(
            name: "ReadabilityKit", 
            targets: ["ReadabilityKit"]
        )
    ],
    dependencies: [
        .package(
            url: "https://github.com/honghaoz/Ji",
            from: "5.0.0"
        )
    ],
    targets: [
        .target(
            name: "ReadabilityKit",
            dependencies: ["Ji"],
            path: "Sources"
        )
    ]
)
