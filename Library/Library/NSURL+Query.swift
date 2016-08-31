//
//  NSURL+Query.swift
//  Library
//
//  Created by Yuki Hirose on 2016/08/31.
//  Copyright © 2016年 yukithehero. All rights reserved.
//

import Foundation

extension NSURL {
    
    // Queryを分解する
    var queryItems: [String : String] {
        var results: [String : String] = [:]
        guard let urlComponents = NSURLComponents(string: self.absoluteString), let items = urlComponents.queryItems else {
            return results
        }
        for item in items {
            results[item.name] = item.value
        }
        return results
    }
}