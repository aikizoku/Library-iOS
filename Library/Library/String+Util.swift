//
//  String+Encrypt.swift
//  Library
//
//  Created by yukithehero on 2016/08/30.
//  Copyright © 2016年 yukithehero. All rights reserved.
//

import Foundation

extension String {
    
    func urlEncode() -> String {
        let enc: String? = self.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())
        return enc != nil ? enc! : self
    }
    
    func urlDecode() -> String {
        let dec: String? = self.stringByRemovingPercentEncoding;
        return dec != nil ? dec! : self
    }
    
    func isNumeric() -> Bool {
        let sc: NSScanner = NSScanner.init(string: self)
        sc.locale = NSLocale.currentLocale()
        return sc.scanDecimal(nil) && sc.atEnd
    }
    
    func toDate(format: String) -> NSDate? {
        let fmt: NSDateFormatter = NSDateFormatter.init()
        fmt.locale = NSLocale.init(localeIdentifier: "en_US_POSIX")
        fmt.dateFormat = format
        return fmt.dateFromString(self)
    }
}