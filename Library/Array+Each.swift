//
//  Array+Each.swift
//  Library
//
//  Created by Yuki Hirose on 2016/09/06.
//  Copyright © 2016年 yukithehero. All rights reserved.
//

import Foundation

extension Array {
    
    /**
     要素を順番に渡しながら繰り返す
     */
    func each(e closure: (_ element: Element) -> Void) {
        for element in self {
            closure(element)
        }
    }
    
    /**
     要素とインデックスを順番に渡しながら繰り返す
     */
    func each(ie closure: (_ i: Int, _ element: Element) -> Void) {
        let c = count
        for i in 0 ..< c {
            closure(i, self[i])
        }
    }
    
    /**
     要素と初回判定と最後判定を順番に渡しながら繰り返す
     */
    func each(fle closure: (_ first: Bool, _ last: Bool, _ element: Element) -> Void) {
        let c = count
        let li = lastIndex
        for i in 0 ..< c {
            let first = i == 0
            let last = i == li
            closure(first, last, self[i])
        }
    }
}
