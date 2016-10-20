//
//  Int+Format.swift
//  Library
//
//  Created by Yuki Hirose on 2016/09/06.
//  Copyright © 2016年 yukithehero. All rights reserved.
//

import Foundation

extension Int {
    
    /**
     数値を３桁カンマ区切りにする
     */
    func thousandSeparator() -> String {
        let fmt = NumberFormatter()
        fmt.numberStyle = .decimal
        fmt.groupingSeparator = ","
        fmt.groupingSize = 3
        return fmt.string(from: NSNumber(value: self)) ?? String(self)
    }
}
