//
//  UIView+Nib.swift
//  moonshot
//
//  Created by Yuki Hirose on 2016/09/07.
//  Copyright © 2016年 Yuki Hirose. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
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
