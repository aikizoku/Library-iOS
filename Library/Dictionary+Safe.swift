//
//  Dictionary+Safe.swift
//  Library
//
//  Created by Yuki Hirose on 2016/08/31.
//  Copyright © 2016年 yukithehero. All rights reserved.
//

extension Dictionary {
    
    func getString(key: Key) -> String {
        return self.getString(key, defaultValue: "")
    }
    
    func getString(key: Key, defaultValue: String) -> String {
        return self[key] as? String ?? defaultValue
    }
    
    func getInt(key: Key) -> Int {
        return getInt(key, defaultValue: 0)
    }
    
    func getInt(key: Key, defaultValue: Int) -> Int {
        return self[key] as? Int ?? defaultValue
    }
    
    func getBool(key: Key) -> Bool {
        return self.getBool(key, defaultValue: false)
    }
    
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
    
    func getArray<AnyObject>(key: Key) -> Array<AnyObject> {
        return self.getArray(key, defaultValue: [])
    }
    
    func getArray<AnyObject>(key: Key, defaultValue: Array<AnyObject>) -> Array<AnyObject> {
        return self[key] as? Array<AnyObject> ?? defaultValue
    }
    
    func getDictionary<String, AnyObject>(key: Key) -> Dictionary<String, AnyObject> {
        return self.getDictionary(key, defaultValue: [:])
    }
    
    func getDictionary<String, AnyObject>(key: Key, defaultValue: Dictionary<String, AnyObject>) -> Dictionary<String, AnyObject> {
        return self[key] as? Dictionary<String, AnyObject> ?? defaultValue
    }
}
