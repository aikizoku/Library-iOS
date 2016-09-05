//
//  String+Encrypt.swift
//  Library
//
//  Created by yukithehero on 2016/08/30.
//  Copyright © 2016年 yukithehero. All rights reserved.
//

extension String {
    
    // ランダム文字列(0~0,a~z,A~Z)を生成する
    static func rand(length: Int) -> String {
        let alphabet = "1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
        let upperBound = UInt32(alphabet.characters.count)
        return String((0 ..< length).map { _ -> Character in
            return alphabet[alphabet.startIndex.advancedBy(Int(arc4random_uniform(upperBound)))]
            })
    }
    
    // nil判定付きの空文字判定
    static func isNotNilEmpty(string: String?) -> Bool {
        if let string = string {
            return !string.isEmpty
        } else {
            return false
        }
    }
    
    // URLエンコードする
    func urlEncode() -> String {
        return self.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet()) ?? self
    }
    
    // URLデコードする
    func urlDecode() -> String {
        return self.stringByRemovingPercentEncoding ?? self
    }
    
    // 数値かどうか判定する
    func isNumeric() -> Bool {
        let sc = NSScanner.init(string: self)
        sc.locale = NSLocale.currentLocale()
        return sc.scanDecimal(nil) && sc.atEnd
    }
    
    // Dateに変換する
    func toDate(format: String) -> NSDate? {
        let fmt = NSDateFormatter.init()
        fmt.locale = NSLocale.init(localeIdentifier: "en_US_POSIX")
        fmt.dateFormat = format
        return fmt.dateFromString(self)
    }
}