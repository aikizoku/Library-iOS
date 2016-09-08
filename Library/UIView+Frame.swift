//
//  UIView+Frame.swift
//  Library
//
//  Created by yukithehero on 2016/08/29.
//  Copyright © 2016年 yukithehero. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    var origin: CGPoint {
        get {
            return self.frame.origin
        }
        set {
            self.frame.origin = newValue
        }
    }
    
    var x: CGFloat {
        get {
            return self.frame.origin.x
        }
        set {
            self.frame.origin.x = newValue
        }
    }
    
    var y: CGFloat {
        get {
            return self.frame.origin.y
        }
        set {
            self.frame.origin.y = newValue
        }
    }
    
    var size: CGSize {
        get {
            return self.frame.size
        }
        set {
            self.frame.size = newValue
        }
    }
    
    var width: CGFloat {
        get {
            return self.frame.size.width
        }
        set {
            self.frame.size.width = newValue
        }
    }
    
    var height: CGFloat {
        get {
            return self.frame.size.height
        }
        set {
            self.frame.size.height = newValue
        }
    }
    
    func addOrigin(origin: CGPoint) {
        self.x += origin.x
        self.y += origin.y
    }
    
    func addX(x: CGFloat) {
        self.x += x
    }
    
    func addY(y: CGFloat) {
        self.y += y
    }
    
    func addSize(size: CGSize) {
        self.width += size.width
        self.height += size.height
    }
    
    func addWidth(width: CGFloat) {
        self.width += width
    }
    
    func addHeight(height: CGFloat) {
        self.height += height
    }
}
