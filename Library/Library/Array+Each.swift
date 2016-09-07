//
//  Array+Each.swift
//  moonshot
//
//  Created by Yuki Hirose on 2016/09/06.
//  Copyright © 2016年 Yuki Hirose. All rights reserved.
//

extension Array {
    
    func each(closure: (element: Element) -> Void) {
        for element in self {
            closure(element: element)
        }
    }
    
    func each(closure: (index: Int, element: Element) -> Void) {
        let c = self.count
        for i in 0 ..< c {
            closure(index: i, element: self[i])
        }
    }
    
    func each(closure: (first: Bool, last: Bool, element: Element) -> Void) {
        let c = self.count
        let cm = c - 1
        for i in 0 ..< c {
            let first = i == 0
            let last = i == cm
            closure(first: first, last: last, element: self[i])
        }
    }
}
