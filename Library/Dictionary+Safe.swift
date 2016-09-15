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
        return getString(key, defaultValue: "")
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
        return getInt(key, defaultValue: 0)
    }
    
    /**
     要素をIntで取得する
     デフォルトは任意の値が返る
     */
    func getInt(key: Key, defaultValue: Int) -> Int {
        return self[key] as? Int ?? defaultValue
    }
    
    /**
     要素をFloatで取得する
     デフォルトは0が返る
     */
    func getFloat(key: Key) -> Float {
        return getFloat(key, defaultValue: 0)
    }
    
    /**
     要素をFloatで取得する
     デフォルトは任意の値が返る
     */
    func getFloat(key: Key, defaultValue: Float) -> Float {
        return self[key] as? Float ?? defaultValue
    }
    
    /**
     要素をDoubleで取得する
     デフォルトは0が返る
     */
    func getDouble(key: Key) -> Double {
        return getDouble(key, defaultValue: 0)
    }
    
    /**
     要素をDoubleで取得する
     デフォルトは任意の値が返る
     */
    func getDouble(key: Key, defaultValue: Double) -> Double {
        return self[key] as? Double ?? defaultValue
    }
    
    /**
     要素をBoolで取得する
     デフォルトはfalseが返る
     */
    func getBool(key: Key) -> Bool {
        return getBool(key, defaultValue: false)
    }
    
    /**
     要素をBoolで取得する
     デフォルトは任意の値が返る
     */
    func getBool(key: Key, defaultValue: Bool) -> Bool {
        let value: Value? = self[key]
        if let value = value as? Int {
            return Bool(value)
        } else if let value = value as? String {
            if value == "1" {
                return true
            } else if (value == "true") {
                return true
            } else {
                return false
            }
        } else if let value = value as? Bool {
            return value
        } else {
            return defaultValue
        }
    }
    
    /**
     要素をArrayで取得する
     デフォルトは空のArrayが返る
     */
    func getArray<AnyObject>(key: Key) -> Array<AnyObject> {
        return getArray(key, defaultValue: [])
    }
    
    /**
     要素をArrayで取得する
     デフォルトは任意の値が返る
     */
    func getArray<AnyObject>(key: Key, defaultValue: Array<AnyObject>) -> Array<AnyObject> {
        return self[key] as? Array<AnyObject> ?? defaultValue
    }
    
    /**
     要素をDictionaryで取得する
     デフォルトは空のDictionaryが返る
     */
    func getDictionary<String, AnyObject>(key: Key) -> Dictionary<String, AnyObject> {
        return getDictionary(key, defaultValue: [:])
    }
    
    /**
     要素をDictionaryで取得する
     デフォルトは任意の値が返る
     */
    func getDictionary<String, AnyObject>(key: Key, defaultValue: Dictionary<String, AnyObject>) -> Dictionary<String, AnyObject> {
        return self[key] as? Dictionary<String, AnyObject> ?? defaultValue
    }
}
