// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Agen",
    platforms: [
        .macOS(.v10_10),
    ],
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "AgenLib",
            targets: ["AgenLib"]),
        .library(
            name: "AmazonLinkUtility",
            targets: ["AmazonLinkUtility"]),
        .executable(
            name: "agen",
            targets: ["Agen"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "AmazonLinkUtility",
            dependencies: []),
        .target(
            name: "AgenLib",
            dependencies: ["AmazonLinkUtility"]),
        .target(
            name: "Agen",
            dependencies: ["AgenLib"]),
        .testTarget(
            name: "AmazonLinkUtilityTests",
            dependencies: ["AmazonLinkUtility"]),
        .testTarget(
            name: "AgenLibTests",
            dependencies: ["AgenLib"]),
    ]
)
