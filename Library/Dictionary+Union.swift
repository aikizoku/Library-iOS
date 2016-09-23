//
//  Dictionary+Union.swift
//  moonshot
//
//  Created by Yuki Hirose on 2016/09/23.
//  Copyright © 2016年 Yuki Hirose. All rights reserved.
//

import Foundation

extension Dictionary {
    
    /**
     * 配列を結合する（上書き）
     */
    func extend(dictionary: Dictionary) -> Dictionary {
        var this = self
        dictionary.each { (key, value) in
            this[key] = value
        }
        return this
    }
    
    /**
     * 自身に配列を結合する（上書き）
     */
    mutating func extended(dictionary: Dictionary) {
        dictionary.each { (key, value) in
            self[key] = value
        }
    }
    
    /**
     * 配列を結合する（上書きしない）
     */
    func safety(dictionary: Dictionary) -> Dictionary {
        var this = self
        dictionary.each { (key, value) in
            if this[key] == nil {
                this[key] = value
            }
        }
        return this
    }
    
    /**
     * 自身に配列を結合する（上書きしない）
     */
    mutating func safetied(dictionary: Dictionary) {
        each { (key, value) in
            if self[key] == nil {
                self[key] = value
            }
        }
    }
}

