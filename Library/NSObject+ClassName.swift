//
//  NSObject+ClassName.swift
//  LibrarySample
//
//  Created by Yuki Hirose on 2016/10/21.
//  Copyright © 2016年 yukithehero. All rights reserved.
//

import Foundation

extension NSObject {
    
    /**
     クラス名を取得する
     */
    class var className: String {
        return String(describing: self)
    }
    var className: String {
        return type(of: self).className
    }
}
