//
//  Int+Format.swift
//  moonshot
//
//  Created by Yuki Hirose on 2016/09/13.
//  Copyright © 2016年 Yuki Hirose. All rights reserved.
//

import Foundation

extension Int {
    
    func thousandSeparator() -> String {
        let fmt = NSNumberFormatter()
        fmt.numberStyle = .DecimalStyle
        fmt.groupingSeparator = ","
        fmt.groupingSize = 3
        return fmt.stringFromNumber(NSNumber(integer: self)) ?? String(self)
    }
}
