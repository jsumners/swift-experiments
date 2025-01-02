// swift-tools-version:6.0

import PackageDescription

let package = Package(
  name: "JsonExperiment",

  // products: [
  //   .library(name: "Foo", targets: ["Foo"])
  // ],

  targets: [
    .target(name: "Foo", dependencies: []),
    .testTarget(name: "FooTests", dependencies: ["Foo"])
  ]
)