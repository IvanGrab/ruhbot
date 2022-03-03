// swift-tools-version:4.0.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ListBot",
    dependencies: [
        .package(url: "https://github.com/zmeyc/telegram-bot-swift.git", from: Version(2, 0, 0))
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "ListBot",
            dependencies: ["TelegramBotSDK"]),
    ]
)
