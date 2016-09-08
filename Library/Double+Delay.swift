//
//  Double+Delay.swift
//  Library
//
//  Created by Yuki Hirose on 2016/09/07.
//  Copyright © 2016年 yukithehero. All rights reserved.
//

import Foundation

extension Double {
    
    func setTimeout(closure: () -> Void) {
        let time = dispatch_time(DISPATCH_TIME_NOW, Int64(self * Double(NSEC_PER_SEC)))
        dispatch_after(time, dispatch_get_main_queue(), closure)
    }
}
