//
//  NSUserDefaultsAccess.swift
//  moonshot
//
//  Created by Yuki Hirose on 2016/09/23.
//  Copyright © 2016年 Yuki Hirose. All rights reserved.
//

import Foundation

class NSUserDefaultsAccess: NSObject {
    let userDefaults = NSUserDefaults.standardUserDefaults()
    
    override init() {
        super.init()
        
        registerDefaults()
        setupProperty()
        addObserver()
    }
    
    deinit {
        removeObserver()
    }
    
    override func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutablePointer<Void>) {
        if let keyPath = keyPath {
            userDefaults.setObject(change?["new"], forKey: keyPath)
            userDefaults.synchronize()
        }
    }
    
    private func registerDefaults() {
        let dic = propertyNames.reduce([String:AnyObject]()) { (dic, key) -> [String:AnyObject] in
            var dic = dic
            dic[key] = valueForKey(key)
            return dic
        }
        userDefaults.registerDefaults(dic)
    }
    
    private func setupProperty() {
        propertyNames.forEach {
            setValue(userDefaults.objectForKey($0), forKey: $0)
        }
    }
    
    private func addObserver() {
        propertyNames.forEach {
            addObserver(self, forKeyPath: $0, options: .New, context: nil)
        }
    }
    
    private func removeObserver() {
        propertyNames.forEach {
            removeObserver(self, forKeyPath: $0)
        }
    }
    
    private var propertyNames: [String] {
        return Mirror(reflecting: self).children.flatMap({ $0.label })
    }
}
