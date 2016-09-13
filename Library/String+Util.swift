//
//  String+Util.swift
//  moonshot
//
//  Created by Yuki Hirose on 2016/09/13.
//  Copyright © 2016年 Yuki Hirose. All rights reserved.
//

import Foundation

extension String {
    
    // トリミング
    func trim() -> String {
        return stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
    }
    
    // 文字列のリプレイス
    func replace(target: String, with: String) -> String {
        return stringByReplacingOccurrencesOfString(target, withString: with)
    }
}
