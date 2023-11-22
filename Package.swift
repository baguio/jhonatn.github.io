// swift-tools-version: 5.5

import PackageDescription

let supportedPlatforms: [SupportedPlatform]? = {
    #if os(macOS)
    [
        .macOS(.v12)
    ]
    #else
    nil
    #endif
}()

let package = Package(
    name: "PublishHome",
    platforms: supportedPlatforms,
    products: [
        .executable(
            name: "PublishHome",
            targets: ["PublishHome"]
        )
    ],
    dependencies: [
        .package(name: "Publish", url: "https://github.com/johnsundell/publish.git", from: "0.9.0")
    ],
    targets: [
        .executableTarget(
            name: "PublishHome",
            dependencies: ["Publish"]),
        .testTarget(
            name: "PublishHomeTests",
            dependencies: ["PublishHome"]),
    ]
)
