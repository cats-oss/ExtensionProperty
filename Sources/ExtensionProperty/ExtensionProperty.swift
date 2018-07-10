//
//  ExtensionProperty.swift
//  ExtensionProeprty
//
//  Created by matsuokah on 2017/10/04.
//  Copyright © 2017 matsuokah. All rights reserved.
//

import Foundation

// MARK: - ExtensionProperty
public protocol ExtensionProperty: class {
    associatedtype Key: ExtensionPropertyKey
    
    /// A getter for associate object.
    /// If propaty was not stored, return nil
    ///
    /// - Parameter key: key
    /// - Returns: value
    func getProperty<V>(key: Self.Key) -> V?

    /// A getter for associated object.
    ///
    /// - Parameters:
    ///     - key: key
    ///     - defaultValue: defaultValue
    /// - Returns: value
    func getProperty<V>(key: Self.Key, defaultValue: V) -> V

    /// A setter for associated object
    ///
    /// - Parameters:
    ///     - key: key
    ///     - newValue: A value for set
    ///     - policy: A policy for reference
    func setProperty<V>(key: Self.Key, newValue: V, policy: objc_AssociationPolicy)

    /// Remove property
    ///
    /// - Parameter key: key
    func removeProperty(key: Self.Key)
}

// MARK: - ExtensionProperty
public extension ExtensionProperty {
    public func getProperty<V>(key: Self.Key) -> V? {
        return objc_getAssociatedObject(self, key.keyPointer) as? V
    }

    public func getProperty<V>(key: Self.Key, defaultValue: V) -> V {
        if let value = objc_getAssociatedObject(self, key.keyPointer) as? V {
            return value
        }

        setProperty(key: key, newValue: defaultValue)
        return defaultValue
    }

    public func setProperty<V>(key: Self.Key, newValue: V, policy: objc_AssociationPolicy = .OBJC_ASSOCIATION_RETAIN) {
        objc_setAssociatedObject(self, key.keyPointer, newValue, policy)
    }

    public func removeProperty(key: Self.Key) {
        if let any: Any = getProperty(key: key) {
            objc_removeAssociatedObjects(any)
        }
    }
}
