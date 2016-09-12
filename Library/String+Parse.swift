//
//  String+Parse.swift
//  Library
//
//  Created by Yuki Hirose on 2016/09/07.
//  Copyright © 2016年 yukithehero. All rights reserved.
//

import Foundation

extension String {
    
    // Dateに変換する
    func toDate(format: String) -> NSDate? {
        let fmt = NSDateFormatter()
        fmt.locale = NSLocale(localeIdentifier: "en_US_POSIX")
        fmt.dateFormat = format
        return fmt.dateFromString(self)
    }
}
