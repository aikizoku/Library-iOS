//
//  Dictionary+Each.swift
//  moonshot
//
//  Created by Yuki Hirose on 2016/09/06.
//  Copyright © 2016年 Yuki Hirose. All rights reserved.
//

import Foundation

extension Dictionary {
    
    func each(closure: (key: Key, value: Value) -> Void) {
        for (key, value) in self {
            closure(key: key, value: value)
        }
    }
}