//
//  ExtensionPropertyKey.swift
//  ExtensionProeprty
//
//  Created by matsuokah on 2017/10/04.
//  Copyright © 2018 CyberAgent, Inc. All rights reserved.
//

import ObjectiveC.runtime

open class ExtensionPropertyKeys {
    fileprivate init () {}
}

/// Represents key of objc AssociatedObject
public final class ExtensionPropertyKey<Value>: ExtensionPropertyKeys {
    let pointer = UnsafeMutablePointer<UInt8>.allocate(capacity: 1)
    let policy: objc_AssociationPolicy

    public init(policy: AssociationPolicy) {
        self.policy = policy.objcAssociationPolicy
        super.init()
    }
}
