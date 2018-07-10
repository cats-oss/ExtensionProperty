//
//  AssociationPolicy.swift
//  ExtensionProperty
//
//  Created by marty-suzuki on 2018/07/11.
//  Copyright © 2018 CyberAgent, Inc. All rights reserved.
//

import ObjectiveC.runtime

/// Wrapper of objc_AssociationPolicy
public enum AssociationPolicy {
    public enum Atomicity {
        case atomic
        case nonatomic
    }

    /// Specifies a weak reference to the associated object.
    case assign

    /// Specifies a strong reference to the associated object.
    /// The association is not made atomically.
    case retain(Atomicity)


    /// Specifies that the associated object is copied.
    /// The association is not made atomically.
    case copy(Atomicity)
}

extension AssociationPolicy {
    var objcAssociationPolicy: objc_AssociationPolicy {
        switch self {
        case .assign:
            return .OBJC_ASSOCIATION_ASSIGN
        case .copy(.atomic):
            return .OBJC_ASSOCIATION_COPY
        case .copy(.nonatomic):
            return .OBJC_ASSOCIATION_COPY_NONATOMIC
        case .retain(.atomic):
            return .OBJC_ASSOCIATION_RETAIN
        case .retain(.nonatomic):
            return .OBJC_ASSOCIATION_RETAIN_NONATOMIC
        }
    }
}
