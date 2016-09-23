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
    func substringTo(index: Int) -> String {
        return substringToIndex(startIndex.advancedBy(Math.clampInt(index, min: 0, max: characters.count)))
    }
    
    /**
     * 指定したインデックスからの文字列を取得する
     */
    func substringFrom(index: Int) -> String {
        return substringFromIndex(startIndex.advancedBy(Math.clampInt(index, min: 0, max: characters.count)))
    }
    
    /**
     * 指定した範囲の文字列を取得する
     */
    func substring(start: Int, end: Int) -> String {
        let st = Math.clampInt(start, min: 0, max: characters.count)
        let ed = Math.clampInt(end, min: start, max: characters.count)
        return substringWithRange(startIndex.advancedBy(st)..<startIndex.advancedBy(ed))
    }
}
