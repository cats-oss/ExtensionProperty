//
//  NSObjectExtensionPropertyTests.swift
//  ExtensionPropertyTests
//
//  Created by marty-suzuki on 2018/07/11.
//  Copyright © 2018 CyberAgent, Inc. All rights reserved.
//

import XCTest
import Foundation
@testable import ExtensionProperty

final class NSObjectExtensionPropertyTests: XCTestCase {
    fileprivate class Ferret: NSObject {}

    private var myFerret: Ferret!

    override func setUp() {
        super.setUp()

        myFerret = Ferret()
    }
    
    func testNameDefaultValue() {
        XCTAssertEqual(myFerret.name, Ferret.Const.nameDefaultValue)
    }

    func testSetName() {
        let name: NSString = "Autumn"
        myFerret.name = name
        XCTAssertEqual(myFerret.name, name, "My ferret name is \(name)")
    }

    func testResetName() {
        let name: NSString = "Autumn"
        myFerret.name = name
        let newName: NSString = "Winter"
        myFerret.name = newName
        XCTAssertEqual(myFerret.name, newName, "My ferret name is \(newName)")
    }

    func testAgeDefaultValue() {
        XCTAssertEqual(myFerret.age, Ferret.Const.ageDefaultValue)
    }

    func testSetAge() {
        let age = NSNumber(value: Int(10))
        myFerret.age = age
        XCTAssertEqual(myFerret.age, age, "My ferret is \(age.intValue) years old.")
    }

    func testResetAge() {
        let age = NSNumber(value: Int(10))
        myFerret.age = age
        let newAge = NSNumber(value: age.intValue + 1)
        myFerret.age = newAge
        XCTAssertEqual(myFerret.age, newAge, "My ferret is \(newAge.intValue) years old.")
    }
}

extension NSObjectExtensionPropertyTests.Ferret: ExtensionProperty {
    enum Const {
        static let nameDefaultValue: NSString = ""
        static let ageDefaultValue = NSNumber(value: Int(0))
    }

    @objc var name: NSString {
        get {
            return getProperty(\.name, defaultValue: Const.nameDefaultValue, policy: .copy(.nonatomic))
        }
        set {
            setProperty(\.name, newValue: newValue, policy: .copy(.nonatomic))
        }
    }

    @objc var age: NSNumber {
        get {
            return getProperty(\.age, defaultValue: Const.ageDefaultValue, policy: .copy(.nonatomic))
        }
        set {
            setProperty(\.age, newValue: newValue, policy: .copy(.nonatomic))
        }
    }
}
