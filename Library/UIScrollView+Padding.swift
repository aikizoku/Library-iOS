//
//  UIScrollView+Padding.swift
//  moonshot
//
//  Created by Yuki Hirose on 2016/09/16.
//  Copyright © 2016年 Yuki Hirose. All rights reserved.
//

import Foundation
import UIKit

extension UIScrollView {
    
    /**
     表示とスクロール範囲にパディングを設定する
     */
    func setPadding(top top: Int, bottom: Int, left: Int, right: Int) {
        let edgeInset = UIEdgeInsetsMake(CGFloat(top), CGFloat(left), CGFloat(bottom), CGFloat(right))
        contentInset = edgeInset
        scrollIndicatorInsets = edgeInset
    }
}
