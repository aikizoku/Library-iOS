//
//  Array+Shuffle.swift
//  moonshot
//
//  Created by Yuki Hirose on 2016/09/06.
//  Copyright © 2016年 Yuki Hirose. All rights reserved.
//

import Foundation

extension Array {
    
    mutating func shuffle() {
        for i in 0..<count {
            let newIndex = Int(arc4random_uniform(UInt32(count - i))) + i
            if i != newIndex {
                swap(&self[i], &self[newIndex])
            }
        }
    }
}