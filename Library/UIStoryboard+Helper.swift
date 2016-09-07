//
//  UIStoryboard+Helper.swift
//  moonshot
//
//  Created by Yuki Hirose on 2016/09/01.
//  Copyright © 2016年 Yuki Hirose. All rights reserved.
//

import UIKit

extension UIStoryboard {
    
    static func storyboard(name: String) -> UIStoryboard {
        return UIStoryboard.init(name: name, bundle: NSBundle.mainBundle())
    }
}

