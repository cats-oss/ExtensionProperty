## Extension Property

The utility interface for **Associated Object**.
If you use this, you can attach any variables in extension. 

## Requirements

* Xcode 9.3
* Swift 4.0 or greater

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

## LICENSE
ExtensionProperty is available under the MIT license. See the [LICENSE file](./LICENSE) for more info.
