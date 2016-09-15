//
//  Array+Shuffle.swift
//  Library
//
//  Created by Yuki Hirose on 2016/09/06.
//  Copyright © 2016年 yukithehero. All rights reserved.
//

import Foundation

extension Array {
    
    /**
     要素をシャッフルする
     */
    mutating func shuffle() {
        for i in 0..<count {
            let newIndex = Int(arc4random_uniform(UInt32(count - i))) + i
            if i != newIndex {
                swap(&self[i], &self[newIndex])
            }
        }
    }
}
