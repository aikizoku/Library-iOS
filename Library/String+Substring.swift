//
//  String+Substring.swift
//  moonshot
//
//  Created by Yuki Hirose on 2016/09/23.
//  Copyright © 2016年 Yuki Hirose. All rights reserved.
//

import Foundation

extension String {
    
    /**
     * 指定したインデックスまでの文字列を取得する
     */
    func substringTo(i: Int) -> String {
        return substring(to: index(startIndex, offsetBy: Math.clampInt(value: i, min: 0, max: characters.count)))
    }
    
    /**
     * 指定したインデックスからの文字列を取得する
     */
    func substringFrom(i: Int) -> String {
        return substring(from: index(endIndex, offsetBy: -Math.clampInt(value: i, min: 0, max: characters.count)))
    }
    
    /**
     * 指定した範囲の文字列を取得する
     */
    func substring(start: Int, end: Int) -> String {
        let st = Math.clampInt(value: start, min: 0, max: characters.count)
        let ed = Math.clampInt(value: end, min: start, max: characters.count)
        return substring(with: index(startIndex, offsetBy: st)..<index(endIndex, offsetBy: -ed))
    }
}
