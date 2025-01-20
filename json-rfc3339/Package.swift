// swift-tools-version:6.0

import PackageDescription

let package = Package(
    name: "JsonRfc3339",

    products: [
        .library(name: "JsonRfc3339", targets: ["JsonRfc3339"])
    ],

    targets: [
        .target(name: "JsonRfc3339", dependencies: []),
        .testTarget(name: "JsonRfc3339Tests", dependencies: ["JsonRfc3339"]),
    ]
)
