// swift-tools-version:6.0

import PackageDescription

let package = Package(
    name: "JsonRfc3339",

    // This definition let's us skip adding `@available(macOS 12, *)`
    // all over the damn place.
    platforms: [
        .macOS(.v12)
    ],

    products: [
        .library(name: "JsonRfc3339", targets: ["JsonRfc3339"])
    ],

    targets: [
        .target(name: "JsonRfc3339", dependencies: []),
        .testTarget(name: "JsonRfc3339Tests", dependencies: ["JsonRfc3339"]),
    ]
)
