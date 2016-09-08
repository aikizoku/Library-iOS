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
     - parameter closure: 各要素に対して実行するクロージャ
     ```
     hoges.each({ hoge in
     })
     ```
     */
    func each(closure: (element: Element) -> Void) {
        for element in self {
            closure(element: element)
        }
    }
    
    /**
     要素とインデックスを順番に渡しながら繰り返す
     - parameter closure: 各要素に対して実行するクロージャ
     ```
     hoges.each({ i, hoge in
     })
     ```
     */
    func each(closure: (i: Int, element: Element) -> Void) {
        let c = count
        for i in 0 ..< c {
            closure(i: i, element: self[i])
        }
    }
    
    /**
     要素と初回判定と最後判定を順番に渡しながら繰り返す
     - parameter closure: 各要素に対して実行するクロージャ
     ```
     hoges.each({ first, last, hoge in
     if first {
     }
     if last {
     }
     println(hoge)
     })
     ```
     */
    func each(closure: (first: Bool, last: Bool, element: Element) -> Void) {
        let c = count
        let mi = c - 1
        for i in 0 ..< c {
            let first = i == 0
            let last = i == mi
            closure(first: first, last: last, element: self[i])
        }
    }
}