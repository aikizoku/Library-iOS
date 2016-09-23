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
        
        
    }
    
    private var propertyNames: [String] {
        return Mirror(reflecting: self).children.flatMap { $0.label }
    }
}
