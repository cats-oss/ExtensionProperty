//
//  ExtensionPropertyTests.swift
//  ExtensionPropertyTests
//
//  Created by marty-suzuki on 2018/07/11.
//  Copyright © 2018 CyberAgent, Inc. All rights reserved.
//

import XCTest
@testable import ExtensionProperty

final class ExtensionPropertyTests: XCTestCase {
    fileprivate final class Cat {}

    private var myCat: Cat!

    override func setUp() {
        super.setUp()
        myCat = Cat()
    }

    func testNameDefaultValue() {
        XCTAssertEqual(myCat.name, Cat.Const.nameDefaultValue)
    }

    func testSetName() {
        let name = "Autumn"
        myCat.name = name
        XCTAssertEqual(myCat.name, name, "My cat name is \(name)")
    }

    func testResetName() {
        let name = "Autumn"
        myCat.name = name
        let newName = "Winter"
        myCat.name = newName
        XCTAssertEqual(myCat.name, newName, "My cat name is \(newName)")
    }

    func testAgeDefaultValue() {
        XCTAssertEqual(myCat.age, Cat.Const.ageDefaultValue)
    }

    func testSetAge() {
        let age: Int = 10
        myCat.age = age
        XCTAssertEqual(myCat.age, age, "My cat is \(age) years old.")
    }

    func testResetAge() {
        let age = 10
        myCat.age = age
        let newAge = age + 1
        myCat.age = newAge
        XCTAssertEqual(myCat.age, newAge, "My cat is \(newAge) years old.")
    }
}

extension ExtensionPropertyTests.Cat: ExtensionProperty {
    enum Const {
        static let name = ExtensionPropertyKey<String>(policy: .copy(.nonatomic))
        static let age = ExtensionPropertyKey<Int>(policy: .assign)

        static let nameDefaultValue = ""
        static let ageDefaultValue: Int = 0
    }

    var name: String {
        get {
            return getProperty(key: Const.name, defaultValue: Const.nameDefaultValue)
        }
        set {
            setProperty(key: Const.name, newValue: newValue)
        }
    }

    var age: Int {
        get {
            return getProperty(key: Const.age, defaultValue: Const.ageDefaultValue)
        }
        set {
            setProperty(key: Const.age, newValue: newValue)
        }
    }
}
