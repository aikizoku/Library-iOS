//
//  Range+Parse.swift
//  moonshot
//
//  Created by Yuki Hirose on 2016/09/12.
//  Copyright © 2016年 Yuki Hirose. All rights reserved.
//

import Foundation

extension Range {
    
    func toNSRange() -> NSRange {
        let s = Int(String(startIndex))!
        let e = Int(String(endIndex))!
        return NSMakeRange(s, e - s)
    }
}