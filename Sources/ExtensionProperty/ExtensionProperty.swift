//
//  ExtensionProperty.swift
//  ExtensionProeprty
//
//  Created by matsuokah on 2017/10/04.
//  Copyright © 2018 CyberAgent, Inc. All rights reserved.
//

import ObjectiveC.runtime

/// Provide setter and setter for AssociatedObject
public protocol ExtensionProperty: class {
    
    /// A getter for associate object.
    /// If propaty was not stored, return nil
    ///
    /// - Parameter key: ExtensionPropertyKey<Value>
    /// - Returns: Value.Wrapped?
    func getProperty<Value: OptionalType>(key: ExtensionPropertyKey<Value>) -> Value.Wrapped?

    /// A getter for associated object.
    ///
    /// - Parameters:
    ///     - key: ExtensionPropertyKey<Value>
    ///     - defaultValue: defaultValue
    /// - Returns: Value
    func getProperty<Value>(key: ExtensionPropertyKey<Value>, defaultValue: Value) -> Value

    /// A setter for associated object
    ///
    /// - Parameters:
    ///     - key: ExtensionPropertyKey<Value>
    ///     - newValue: A value for set
    func setProperty<Value>(key: ExtensionPropertyKey<Value>, newValue: Value)

    /// Remove all properties
    func removeAllProperties()
}

public extension ExtensionProperty {
    public func getProperty<Value: OptionalType>(key: ExtensionPropertyKey<Value>) -> Value.Wrapped? {
        return objc_getAssociatedObject(self, key.pointer) as? Value.Wrapped
    }

    public func getProperty<Value>(key: ExtensionPropertyKey<Value>, defaultValue: Value) -> Value {
        if let value = objc_getAssociatedObject(self, key.pointer) as? Value {
            return value
        }

        setProperty(key: key, newValue: defaultValue)
        return defaultValue
    }

    public func setProperty<Value>(key: ExtensionPropertyKey<Value>, newValue: Value) {
        objc_setAssociatedObject(self, key.pointer, newValue, key.policy)
    }

    public func removeAllProperties() {
        objc_removeAssociatedObjects(self)
    }
}
