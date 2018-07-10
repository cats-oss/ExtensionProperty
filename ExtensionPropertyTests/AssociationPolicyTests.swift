//
//  AssociationPolicyTests.swift
//  ExtensionPropertyTests
//
//  Created by marty-suzuki on 2018/07/11.
//  Copyright © 2018 CyberAgent, Inc. All rights reserved.
//

import ObjectiveC.runtime
import XCTest
@testable import ExtensionProperty

final class AssociationPolicyTests: XCTestCase {
    func testAssign() {
        XCTAssertEqual(AssociationPolicy.assign.objcAssociationPolicy,
                       .OBJC_ASSOCIATION_ASSIGN)
    }

    func testRetain() {
        XCTAssertEqual(AssociationPolicy.retain(.atomic).objcAssociationPolicy,
                       .OBJC_ASSOCIATION_RETAIN)
    }

    func testRetainNonatomic() {
        XCTAssertEqual(AssociationPolicy.retain(.nonatomic).objcAssociationPolicy,
                       .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }

    func testCopy() {
        XCTAssertEqual(AssociationPolicy.copy(.atomic).objcAssociationPolicy,
                       .OBJC_ASSOCIATION_COPY)
    }

    func testCopyNonatomic() {
        XCTAssertEqual(AssociationPolicy.copy(.nonatomic).objcAssociationPolicy,
                       .OBJC_ASSOCIATION_COPY_NONATOMIC)
    }
}
