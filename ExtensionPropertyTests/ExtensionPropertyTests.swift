//
//  ExtensionPropertyTests.swift
//  ExtensionPropertyTests
//
//  Created by matsuokah on 2017/10/04.
//  Copyright © 2017 matsuokah. All rights reserved.
//

import XCTest
@testable import ExtensionProperty

// MARK: - Definitions
protocol Animal { }

enum AnimalPropertyKeys: String, ExtensionPropertyKey {
    case name
}

final class Dog: Animal { }

extension Dog: ExtensionProperty {}

extension Animal where Self: ExtensionProperty {
    typealias Key = AnimalPropertyKeys
    var name: String {
        get {
            return getProperty(key: .name, defaultValue: "")
        }

        set {
            setProperty(key: .name, newValue: newValue)
        }
    }
}

// MARK: - Tests
class ExtensionPropertyTests: XCTestCase {

    var myDog = Dog()

    func testApplyName() {
        let name = "Autumn"
        myDog.name = name
        XCTAssertEqual(myDog.name, name, "My dog name is \(name)")
    }

    func testRename() {
        let name = "Autumn"
        myDog.name = name
        let newName = "Winter"
        myDog.name = newName
        XCTAssertEqual(myDog.name, newName, "My dog name is \(newName)")
    }
}
