//
//  Int+Each.swift
//  Library
//
//  Created by Yuki Hirose on 2016/09/07.
//  Copyright © 2016年 yukithehero. All rights reserved.
//

extension Int {
    
    func each(closure: (i: Int) -> Void) {
        for i in 0 ..< self {
            closure(i: i)
        }
    }
}
