//
//  NSDate+Parse.swift
//  Library
//
//  Created by Yuki Hirose on 2016/08/30.
//  Copyright © 2016年 yukithehero. All rights reserved.
//

import Foundation

extension NSDate {
    
    /**
     フォーマットを指定して、西暦or和暦に影響されずにStringに変換する
     */
    func toString(format: String) -> String {
        let fmt = NSDateFormatter()
        fmt.locale = NSLocale(localeIdentifier: "en_US_POSIX")
        fmt.dateFormat = format
        return fmt.stringFromDate(self) ?? ""
    }
}
