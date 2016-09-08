//
//  String+Check.swift
//  Library
//
//  Created by Yuki Hirose on 2016/09/07.
//  Copyright © 2016年 yukithehero. All rights reserved.
//

import Foundation

extension String {
    
    // 空文字判定
    func isNotEmpty(string: String) -> Bool {
        return !string.isEmpty
    }
    
    // nil判定 && 空文字判定
    static func isNotNilEmpty(string: String?) -> Bool {
        if let string = string {
            return !string.isEmpty
        } else {
            return false
        }
    }
    
    // 数値かどうか判定する
    func isNumeric() -> Bool {
        let sc = NSScanner.init(string: self)
        sc.locale = NSLocale.currentLocale()
        return sc.scanDecimal(nil) && sc.atEnd
    }
}
