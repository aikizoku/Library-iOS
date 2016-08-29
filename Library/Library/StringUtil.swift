//
//  StringUtil.swift
//  Library
//
//  Created by yukithehero on 2016/08/29.
//  Copyright © 2016年 yukithehero. All rights reserved.
//

import Foundation

class StringUtil: NSObject {
    
    // ランダム文字列(0~0,a~z,A~Z)を生成する
    static func randString(length: Int) -> String {
        let alphabet = "1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
        let upperBound = UInt32(alphabet.characters.count)
        return String((0 ..< length).map { _ -> Character in
            return alphabet[alphabet.startIndex.advancedBy(Int(arc4random_uniform(upperBound)))]
            })
    }
    
    // null判定付きの空文字判定
    static func isEmpty(string: String?) -> Bool {
        return string == nil || string!.isEmpty
    }
}
