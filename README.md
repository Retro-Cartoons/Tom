# Tom

[![CI Status](https://github.com/Retro-Cartoons/Tom/workflows/Tom%20CI/badge.svg?branch=main)](https://github.com/Retro-Cartoons/Tom/actions)
[![Version](https://img.shields.io/cocoapods/v/Tom.svg)](https://github.com/Retro-Cartoons/Tom)
[![SPM](https://img.shields.io/badge/spm-v1.0.0-blue.svg)](https://swift.org/package-manager)
[![License](https://img.shields.io/cocoapods/l/Tom.svg)](https://github.com/Retro-Cartoons/Tom)
[![Platform](https://img.shields.io/cocoapods/p/Tom.svg)](https://github.com/Retro-Cartoons/Tom)

- [Demo](#demo)
- [Requirements](#requirements)
- [Installation](#installation)
  - [Cocoapods](#cocoapods)
  - [SPM](#swift-package-manager)
- [Usage](#usage)
  - [XIB](#xib)
  - [Programmatically](#programmatically)
- [License](#license)

## Demo

![GIF](https://media.giphy.com/media/OoC14F1Xz8QzmnCAeO/giphy.gif)

## Requirements

- iOS 13.0+
- Xcode 11+
- Swift 5.1+

## Installation

### Cocoapods

```ruby
pod 'Tom'
```
### Swift Package Manager

**Swift Package Manager (requires Xcode 11)**
Add package into Project settings -> Swift Packages -> Repo URL
1. File > Swift Packages > Add Package Dependency
2. Add `https://github.com/Retro-Cartoons/Tom.git`

_OR_

Update `dependencies` in `Package.swift`
```swift
dependencies: [
    .package(url: "https://github.com/Retro-Cartoons/Tom.git", .upToNextMajor(from: "1.0.0"))
]
```

## Usage

**Properties**
```swift
lineCount: Int = 8
lineColor: UIColor = .black
lineSpacing: CGFloat = 8
minLineThickness: CGFloat = 8
animationSpeed: Double = 0.25
Vertical: Bool = false
```

### XIB

![StoryboardImplementation](https://live.staticflickr.com/65535/51152721631_949e468489_m.jpg)

### Programmatically

```swift
TomView(configuration: .init(lineCount: 20, lineColor: .black))
```

## License

Tom is available under the MIT license. See the LICENSE file for more info.
