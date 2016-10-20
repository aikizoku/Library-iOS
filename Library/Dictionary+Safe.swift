//
//  Dictionary+Safe.swift
//  Library
//
//  Created by Yuki Hirose on 2016/08/31.
//  Copyright © 2016年 yukithehero. All rights reserved.
//

import Foundation

extension Dictionary {
    
    /**
     要素をStringで取得する
     デフォルトは空文字が返る
     */
    func getString(key: Key) -> String {
        return getString(key: key, defaultValue: "")
    }
    
    /**
     要素をStringで取得する
     デフォルトは任意の値が返る
     */
    func getString(key: Key, defaultValue: String) -> String {
        return self[key] as? String ?? defaultValue
    }
    
    /**
     要素をIntで取得する
     デフォルトは0が返る
     */
    func getInt(key: Key) -> Int {
        return getInt(key: key, defaultValue: 0)
    }
    
    /**
     要素をIntで取得する
     デフォルトは任意の値が返る
     */
    func getInt(key: Key, defaultValue: Int) -> Int {
        let value = self[key]
        if let value = value as? Int {
            return value
        } else if let value = value as? String {
            return Int(value) ?? defaultValue
        } else if let value = value as? Bool {
            return value ? 1 : 0
        } else {
            return defaultValue
        }
    }
    
    /**
     要素をFloatで取得する
     デフォルトは0が返る
     */
    func getFloat(key: Key) -> Float {
        return getFloat(key: key, defaultValue: 0)
    }
    
    /**
     要素をFloatで取得する
     デフォルトは任意の値が返る
     */
    func getFloat(key: Key, defaultValue: Float) -> Float {
        let value = self[key]
        if let value = value as? Float {
            return value
        } else if let value = value as? String {
            return Float(value) ?? defaultValue
        } else {
            return defaultValue
        }
    }
    
    /**
     要素をDoubleで取得する
     デフォルトは0が返る
     */
    func getDouble(key: Key) -> Double {
        return getDouble(key: key, defaultValue: 0)
    }
    
    /**
     要素をDoubleで取得する
     デフォルトは任意の値が返る
     */
    func getDouble(key: Key, defaultValue: Double) -> Double {
        let value = self[key]
        if let value = value as? Double {
            return value
        } else if let value = value as? String {
            return Double(value) ?? defaultValue
        } else {
            return defaultValue
        }
    }
    
    /**
     要素をBoolで取得する
     デフォルトはfalseが返る
     */
    func getBool(key: Key) -> Bool {
        return getBool(key: key, defaultValue: false)
    }
    
    /**
     要素をBoolで取得する
     デフォルトは任意の値が返る
     */
    func getBool(key: Key, defaultValue: Bool) -> Bool {
        let value = self[key]
        if let value = value as? Bool {
            return value
        } else if let value = value as? Int {
            return Bool(NSNumber(value: value))
        } else if let value = value as? String {
            return value == "1" || value == "true"
        } else {
            return defaultValue
        }
    }
    
    /**
     要素をArrayで取得する
     デフォルトは空のArrayが返る
     */
    func getArray<T>(key: Key) -> Array<T> {
        return getArray(key: key, defaultValue: [])
    }
    
    /**
     要素をArrayで取得する
     デフォルトは任意の値が返る
     */
    func getArray<T>(key: Key, defaultValue: Array<T>) -> Array<T> {
        return self[key] as? Array<T> ?? defaultValue
    }
    
    /**
     要素をDictionaryで取得する
     デフォルトは空のDictionaryが返る
     */
    func getDictionary<String, T>(key: Key) -> Dictionary<String, T> {
        return getDictionary(key: key, defaultValue: [:])
    }
    
    /**
     要素をDictionaryで取得する
     デフォルトは任意の値が返る
     */
    func getDictionary<String, T>(key: Key, defaultValue: Dictionary<String, T>) -> Dictionary<String, T> {
        return self[key] as? Dictionary<String, T> ?? defaultValue
    }
}
