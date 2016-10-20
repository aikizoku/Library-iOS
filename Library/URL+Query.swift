//
//  NSURL+Query.swift
//  Library
//
//  Created by Yuki Hirose on 2016/08/31.
//  Copyright © 2016年 yukithehero. All rights reserved.
//

import Foundation

extension URL {
    
    /**
     QueryをDictionaryに分解する
     */
    var queryParams: [String : String] {
        var results: [String : String] = [:]
        guard let urlComponents = URLComponents(string: absoluteString!), let items = urlComponents.queryItems else {
            return results
        }
        for item in items {
            results[item.name] = item.value
        }
        return results
    }
}
