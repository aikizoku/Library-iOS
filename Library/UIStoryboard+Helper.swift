//
//  UIStoryboard+Helper.swift
//  moonshot
//
//  Created by Yuki Hirose on 2016/09/01.
//  Copyright © 2016年 Yuki Hirose. All rights reserved.
//

import Foundation
import UIKit

extension UIStoryboard {
    
    static func instantiateViewControllerWithIdentifier<T>(storyboardName name: String, identifier: String) -> T? {
        if let viewController = UIStoryboard(name: name, bundle: NSBundle.mainBundle()).instantiateViewControllerWithIdentifier(identifier) as? T {
            return viewController
        } else {
            return nil
        }
    }
}

