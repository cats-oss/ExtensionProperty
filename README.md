## Extension Property

<p align="center">
  <img src="https://img.shields.io/badge/Platforms-iOS%20%7C%20tvOS%20%7C%20macOS-blue.svg?style=flat" alt="platforms" />
  <a href="https://developer.apple.com/swift">
    <img src="http://img.shields.io/badge/Language-Swift4.1-orange.svg?style=flat" alt="Swift4.1" />
  </a>
  <a href="./LICENSE">
    <img src="http://img.shields.io/badge/License-MIT-lightgray.svg?style=flat" alt="License" />
  </a>
  <br />
  <a href="https://github.com/Carthage/Carthage">
    <img src="https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat" alt="Carthage" />
  </a>
  <a href="https://github.com/apple/swift-package-manager">
    <img src="https://img.shields.io/badge/SwiftPM-compatible-4BC51D.svg?style=flat" alt="SwiftPM" />
  </a>
  <a href="http://cocoapods.org/pods/ExtensionProperty">
    <img src="https://img.shields.io/cocoapods/v/ExtensionProperty.svg?style=flat" alt="Version" />
  </a>
</p>

The utility interface for **Associated Object**.
If you use this, you can attach any variables in extension.

## Usage

```swift
protocol Animal {}

enum AnimalPropertyKeys: String, ExtensionPropertyKey {
    case name
}

final class Dog: Animal {}

extension Dog: ExtensionProperty {}

// Declare setter and getter to property
extension Animal where Self: ExtensionProperty {
    var name: String {
        get {
            return getProperty(key: AnimalPropertyKeys.name, defaultValue: "")
        }

        set {
            setProperty(key: AnimalPropertyKeys.name, newValue: newValue)
        }
    }
}

let dog = Dog()

// You can assign string to dog.name
dog.name = "Autumn"
```

Please check out and try the unit test.

## Installation

### Carthage

If you’re using [Carthage](https://github.com/Carthage/Carthage), simply add ExtensionProperty to your `Cartfile`:

```
github "cats-oss/ExtensionProperty"
```

### CocoaPods

ExtensionProperty is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'ExtensionProperty'
```

### Swift Package Manager

If you’re using [Swift Package Manager](https://github.com/apple/swift-package-manager), simply add ExtensionProperty to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/cats-oss/ExtensionProperty", from: "1.0.2")
]
```

## Requirements

* Xcode 9.3
* Swift 4.1 or greater

## LICENSE
ExtensionProperty is available under the MIT license. See the [LICENSE file](./LICENSE) for more info.
