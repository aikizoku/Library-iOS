//
//  Array+LastIndex.swift
//  LibrarySample
//
//  Created by yukithehero on 2016/09/16.
//  Copyright © 2016年 yukithehero. All rights reserved.
//

import Foundation

extension Array {
    
    /**
     最後のIndexを取得する
     */
    var lastIndex: Int {
        get {
            return count == 0 ? 0 : count - 1
        }
    }
}
