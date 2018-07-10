//
//  ExtensionPropertyKey.swift
//  ExtensionProeprty
//
//  Created by matsuokah on 2017/10/04.
//  Copyright © 2017 matsuokah. All rights reserved.
//

import Foundation

// MARK: - ExtensionPropertyKey
public protocol ExtensionPropertyKey: RawRepresentable {
    var keyString: String { get }
}

// MARK: - ExtensionPropertyKey
public extension ExtensionPropertyKey where RawValue == String {
    var keyString: String {
        return self.rawValue
    }
}

// MARK: - ExtensionPropertyKey
/// Creator UnsafeRawPointer to use key to access associated object
internal extension ExtensionPropertyKey {
    var keyPointer: UnsafeRawPointer {
        return unsafeBitCast(Selector(self.keyString), to: UnsafeRawPointer.self)
    }
}
