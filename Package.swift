// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "SwiftUIBackgroundFill",
    platforms: [
        .iOS(.v16),
    ],
    products: [
        .library(
            name: "SwiftUIBackgroundFill",
            targets: ["SwiftUIBackgroundFill"]
        ),
    ],
    targets: [
        .target(
            name: "SwiftUIBackgroundFill"),
    ]
)
