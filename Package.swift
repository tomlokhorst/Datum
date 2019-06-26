// swift-tools-version:5.0
import PackageDescription

let package = Package(
  name: "Datum",
  products: [
    .library(name: "Datum", targets: ["Datum"]),
  ],
  dependencies: [],
  targets: [
    .target(name: "Datum"),
    .testTarget(name: "DatumTests", dependencies: ["Datum"]),
  ]
)

