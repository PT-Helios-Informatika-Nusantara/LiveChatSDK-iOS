// swift-tools-version: 6.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "LiveChatSDKiOS",
    platforms: [
        .iOS(.v18)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "LiveChatSDKiOS",
            targets: ["LiveChatSDKCore"]
        ),
    ],
    targets: [
            .binaryTarget(
                name: "LiveChatSDKCore",
                path: "LiveChatSDKCore.xcframework"
            ),
        ]
)
