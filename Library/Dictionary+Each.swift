//
//  Dictionary+Each.swift
//  Library
//
//  Created by Yuki Hirose on 2016/09/06.
//  Copyright © 2016年 yukithehero. All rights reserved.
//

import Foundation

extension Dictionary {
    
    /**
     KeyとValueを取得しながら繰り返す
     */
    func each(closure: (_ key: Key, _ value: Value) -> Void) {
        for (key, value) in self {
            closure(key, value)
        }
    }
}
