//
//  Double+Delay.swift
//  Library
//
//  Created by Yuki Hirose on 2016/09/07.
//  Copyright © 2016年 yukithehero. All rights reserved.
//

import Foundation

extension Double {
    
    /**
     指定の秒数だけ待ってから実行する
     */
    func setTimeout(closure: @escaping () -> Void) {
        let delay = self * Double(NSEC_PER_SEC)
        let time  = DispatchTime.now() + Double(Int64(delay)) / Double(NSEC_PER_SEC)
        DispatchQueue.main.asyncAfter(deadline: time, execute: closure)
    }
}
