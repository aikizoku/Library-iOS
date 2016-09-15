//
//  String+URL.swift
//  Library
//
//  Created by Yuki Hirose on 2016/09/07.
//  Copyright © 2016年 yukithehero. All rights reserved.
//

import Foundation

extension String {
    
    /**
     文字列をURLに変換する
     失敗したらダミーURLオブジェクトを返す
     */
    func toUrl() -> NSURL {
        return NSURL(string: self) ?? NSURL(string: "http://example.com/")!
    }

    /**
     文字列をURLエンコードする
     失敗したら元の文字列を返す
     */
    func urlEncode() -> String {
        return stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet()) ?? self
    }
    
    /**
     文字列をURLデコードする
     失敗したら元の文字列を返す
     */
    func urlDecode() -> String {
        return stringByRemovingPercentEncoding ?? self
    }
}
