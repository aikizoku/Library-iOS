//
//  UIStoryboard+Helper.swift
//  Library
//
//  Created by Yuki Hirose on 2016/09/06.
//  Copyright © 2016年 yukithehero. All rights reserved.
//

import Foundation
import UIKit

extension UIStoryboard {
    
    /**
     instantiateViewControllerWithIdentifierの短縮
     */
    static func instantiateViewController<T>(storyboardName name: String, identifier: String) -> T? {
        guard let viewController = UIStoryboard(name: name, bundle: NSBundle.mainBundle()).instantiateViewControllerWithIdentifier(identifier) as? T else {
            return nil
        }
        return viewController
    }
}

