// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "Erbium",
    products: [
        .library(name: "Erbium", targets: ["Erbium"])
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "Erbium",
            dependencies: [],
            path: "Sources"
        )
    ]
)
