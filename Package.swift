// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "TableLibrary",
    products: [
        .library(
            name: "TableLibrary",
            targets: ["TableLibrary"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "TableLibrary",
            dependencies: [],
            path: "Sources"),
    ]
)
