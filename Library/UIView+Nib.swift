//
//  UIView+Nib.swift
//  Library
//
//  Created by Yuki Hirose on 2016/09/06.
//  Copyright © 2016年 yukithehero. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    /**
     xibから独自Viewのインスタンスを取得する
     */
    static func instance<T>(nibName nibName: String) -> T? {
        let views = UINib(nibName: nibName, bundle: nil).instantiateWithOwner(nil, options: nil)
        var view: T?
        views.each(e: { (element: AnyObject) in
            if element.dynamicType === self {
                view = element as? T
            }
        })
        return view
    }
}
