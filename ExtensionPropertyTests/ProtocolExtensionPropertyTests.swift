//
//  ProtocolExtensionPropertyTests.swift
//  ExtensionPropertyTests
//
//  Created by matsuokah on 2017/10/04.
//  Copyright © 2018 CyberAgent, Inc. All rights reserved.
//

import XCTest
@testable import ExtensionProperty

// MARK: - ExtensionPropertyKeys

extension ExtensionPropertyKeys {
    static let stringValue = ExtensionPropertyKey<String>(policy: .copy(.nonatomic))
    static let nilableStringValue = ExtensionPropertyKey<String?>(policy: .copy(.nonatomic))
    static let intValue = ExtensionPropertyKey<Int>(policy: .assign)
    static let nilableIntValue = ExtensionPropertyKey<Int?>(policy: .assign)
}

enum Const {
    static let stringDefaultValue = ""
    static let intDefaultValue: Int = 0
}

// MARK: - Animal

protocol Animal {}

extension Animal where Self: ExtensionProperty {
    var name: String {
        get {
            return getProperty(key: .stringValue, defaultValue: Const.stringDefaultValue)
        }
        set {
            setProperty(key: .stringValue, newValue: newValue)
        }
    }

    var nilableName: String? {
        get {
            return getProperty(key: .nilableStringValue)
        }
        set {
            setProperty(key: .nilableStringValue, newValue: newValue)
        }
    }

    var age: Int {
        get {
            return getProperty(key: .intValue, defaultValue: Const.intDefaultValue)
        }
        set {
            setProperty(key: .intValue, newValue: newValue)
        }
    }

    var nilableAge: Int? {
        get {
            return getProperty(key: .nilableIntValue)
        }
        set {
            setProperty(key: .nilableIntValue, newValue: newValue)
        }
    }
}

// MARK: - Dog

final class Dog: Animal {}

extension Dog: ExtensionProperty {}

// MARK: - Tests

final class ProtocolExtensionNonNilTests: XCTestCase {
    private var myDog: Dog!

    override func setUp() {
        super.setUp()
        myDog = Dog()
    }

    func testNameDefaultValue() {
        XCTAssertEqual(myDog.name, Const.stringDefaultValue)
    }

    func testSetName() {
        let name = "Autumn"
        myDog.name = name
        XCTAssertEqual(myDog.name, name, "My dog name is \(name)")
    }

    func testResetName() {
        let name = "Autumn"
        myDog.name = name
        let newName = "Winter"
        myDog.name = newName
        XCTAssertEqual(myDog.name, newName, "My dog name is \(newName)")
    }

    func testAgeDefaultValue() {
        XCTAssertEqual(myDog.age, Const.intDefaultValue)
    }

    func testSetAge() {
        let age: Int = 10
        myDog.age = age
        XCTAssertEqual(myDog.age, age, "My dog is \(age) years old.")
    }

    func testResetAge() {
        let age = 10
        myDog.age = age
        let newAge = age + 1
        myDog.age = newAge
        XCTAssertEqual(myDog.age, newAge, "My dog is \(newAge) years old.")
    }
}

final class ProtocolExtensionNilTests: XCTestCase {
    var myDog: Dog!

    override func setUp() {
        super.setUp()
        myDog = Dog()
    }

    func testNameDefaultIsNil() {
        XCTAssertNil(myDog.nilableName)
    }

    func testSetName() {
        let name = "Autumn"
        myDog.nilableName = name
        XCTAssertEqual(myDog.nilableName, name, "My dog name is \(name)")
    }

    func testResetName() {
        let name = "Autumn"
        myDog.nilableName = name
        let newName = "Winter"
        myDog.nilableName = newName
        XCTAssertEqual(myDog.nilableName, newName, "My dog name is \(newName)")
    }

    func testSetNilToName() {
        myDog.nilableName = "Autumn"
        myDog.nilableName = nil
        XCTAssertNil(myDog.nilableName)
    }

    func testAgeDefaultIsNil() {
        XCTAssertNil(myDog.nilableAge)
    }

    func testSetAge() {
        let age: Int = 10
        myDog.nilableAge = age
        XCTAssertEqual(myDog.nilableAge, age, "My dog is \(age) years old.")
    }

    func testResetAge() {
        let age = 10
        myDog.nilableAge = age
        let newAge = age + 1
        myDog.nilableAge = newAge
        XCTAssertEqual(myDog.nilableAge, newAge, "My dog is \(newAge) years old.")
    }

    func testSetNilToAge() {
        myDog.nilableAge = 10
        myDog.nilableAge = nil
        XCTAssertNil(myDog.nilableAge)
    }
}
