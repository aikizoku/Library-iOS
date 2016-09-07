//
//  NSDate+Parse.swift
//  Library
//
//  Created by Yuki Hirose on 2016/08/30.
//  Copyright © 2016年 yukithehero. All rights reserved.
//

extension NSDate {
    
    // Stringに変換する
    func toString(format: String) -> NSString {
        let fmt = NSDateFormatter.init()
        fmt.locale = NSLocale.init(localeIdentifier: "en_US_POSIX")
        fmt.dateFormat = format
        return fmt.stringFromDate(self) ?? ""
    }
}
