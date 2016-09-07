//
//  Array+Safe.swift
//  Library
//
//  Created by Yuki Hirose on 2016/08/31.
//  Copyright © 2016年 yukithehero. All rights reserved.
//

extension Array {
    
    func getString(i: Int) -> String {
        return self.getString(i, defaultValue: "")
    }
    
    func getString(i: Int, defaultValue: String) -> String {
        return self[i] as? String ?? defaultValue
    }
    
    func getInt(i: Int) -> Int {
        return getInt(i, defaultValue: 0)
    }
    
    func getInt(i: Int, defaultValue: Int) -> Int {
        return self[i] as? Int ?? defaultValue
    }
    
    func getBool(i: Int) -> Bool {
        return self.getBool(i, defaultValue: false)
    }
    
    func getBool(i: Int, defaultValue: Bool) -> Bool {
        let element: Element? = self[i]
        if let element = element as? Int {
            return Bool(element)
        } else if let element = element as? String {
            if element == "1" {
                return true
            } else if (element == "true") {
                return true
            } else {
                return false
            }
        } else if let element = element as? Bool {
            return element
        } else {
            return defaultValue
        }
    }
    
    func getArray<AnyObject>(i: Int) -> Array<AnyObject> {
        return self.getArray(i, defaultValue: [])
    }
    
    func getArray<AnyObject>(i: Int, defaultValue: Array<AnyObject>) -> Array<AnyObject> {
        return self[i] as? Array<AnyObject> ?? defaultValue
    }
    
    func getDictionary<String, AnyObject>(i: Int) -> Dictionary<String, AnyObject> {
        return self.getDictionary(i, defaultValue: [:])
    }
    
    func getDictionary<String, AnyObject>(i: Int, defaultValue: Dictionary<String, AnyObject>) -> Dictionary<String, AnyObject> {
        return self[i] as? Dictionary<String, AnyObject> ?? defaultValue
    }
}
