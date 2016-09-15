//
//  String+Util.swift
//  Library
//
//  Created by Yuki Hirose on 2016/09/06.
//  Copyright © 2016年 yukithehero. All rights reserved.
//

import Foundation

extension String {
    
    /**
     文字列をトリミングする
     */
    func trim() -> String {
        return stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
    }
    
    /**
     文字列を指定文字列で全て置換する
     */
    func replace(target: String, with: String) -> String {
        return stringByReplacingOccurrencesOfString(target, withString: with)
    }
}
