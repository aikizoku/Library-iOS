//
//  Range+Parse.swift
//  Library
//
//  Created by Yuki Hirose on 2016/09/06.
//  Copyright © 2016年 yukithehero. All rights reserved.
//

import Foundation

extension Range {
    
    /**
     NSRangeに変換する
     */
    func toNSRange() -> NSRange {
        let s = Int(String(startIndex))!
        let e = Int(String(endIndex))!
        return NSMakeRange(s, e - s)
    }
}
