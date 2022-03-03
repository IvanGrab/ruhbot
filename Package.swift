// swift-tools-version:4.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ListBot",
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
//        .package(url: "https://github.com/BiAtoms/Request.swift.git", from: Version(2, 3, 0)),
//        .package(url: "https://github.com/PerfectlySoft/Perfect-CURL.git", from: Version(3, 0, 0)),
//        .package(url: "https://github.com/Alamofire/Alamofire.git", from: Version(5,5,0)),
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
