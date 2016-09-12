//
//  String+Encode.swift
//  Library
//
//  Created by Yuki Hirose on 2016/09/07.
//  Copyright © 2016年 yukithehero. All rights reserved.
//

import Foundation

extension String {
    
    // URLエンコードする
    func urlEncode() -> String {
        return stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet()) ?? self
    }
    
    // URLデコードする
    func urlDecode() -> String {
        return stringByRemovingPercentEncoding ?? self
    }
}
