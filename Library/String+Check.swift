//
//  String+Check.swift
//  Library
//
//  Created by Yuki Hirose on 2016/09/07.
//  Copyright © 2016年 yukithehero. All rights reserved.
//

import Foundation

extension String {
    
    /**
     空文字でないか判定する
     */
    func isNotEmpty() -> Bool {
        return !isEmpty
    }
    
    /**
     nilでもなく、空文字でもないか判定する
     */
    static func isNotNilEmpty(string: String?) -> Bool {
        guard let string = string else {
            return false
        }
        return !string.isEmpty
    }
    
    /**
     数値かどうか判定する
     */
    func isNumeric() -> Bool {
        let sc = Scanner(string: self)
        sc.locale = Locale.current
        return sc.scanDecimal(nil) && sc.isAtEnd
    }
}
