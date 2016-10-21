//
//  UIView+Remove.swift
//  LibrarySample
//
//  Created by Yuki Hirose on 2016/10/21.
//  Copyright © 2016年 yukithehero. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    func removeAllSubviews() {
        subviews.each { (view) in
            view.removeFromSuperview()
        }
    }
}
