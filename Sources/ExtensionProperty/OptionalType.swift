//
//  OptionalType.swift
//  ExtensionProperty
//
//  Created by marty-suzuki on 2018/07/11.
//  Copyright © 2018 CyberAgent, Inc. All rights reserved.
//

/// Represent Optinal
public protocol OptionalType {
    associatedtype Wrapped
}

extension Optional: OptionalType {}
