//
//  Date+Parse.swift
//  Library
//
//  Created by Yuki Hirose on 2016/08/30.
//  Copyright © 2016年 yukithehero. All rights reserved.
//

import Foundation

extension Date {
    
    /**
     フォーマットを指定して、西暦or和暦に影響されずにStringに変換する
     */
    func toString(format: String) -> String {
        let fmt = DateFormatter()
        fmt.locale = Locale(identifier: "en_US_POSIX")
        fmt.dateFormat = format
        return fmt.string(from: self) 
    }
    
    /**
     プッシュ通知のデバイストークン文字列を取得する
     */
    func toDeviceToken() -> String {
        var token = description
        token = token.replace(target: "<", with: "")
        token = token.replace(target: ">", with: "")
        token = token.replace(target: " ", with: "")
        return token
    }
}
