//
//  UIView+Frame.swift
//  Library
//
//  Created by yukithehero on 2016/08/29.
//  Copyright © 2016年 yukithehero. All rights reserved.
//

import UIKit

extension UIView {
    
    var origin: CGPoint {
        get {
            return self.frame.origin
        }
        set(origin) {
            self.frame.origin = origin
        }
    }
    
    var x: CGFloat {
        get {
            return self.frame.origin.x
        }
        set(x) {
            self.frame.origin.x = x
        }
    }
    
    var y: CGFloat {
        get {
            return self.frame.origin.y
        }
        set(y) {
            self.frame.origin.y = y
        }
    }
    
    var size: CGSize {
        get {
            return self.frame.size
        }
        set(size) {
            self.frame.size = size
        }
    }
    
    var width: CGFloat {
        get {
            return self.frame.size.width
        }
        set(width) {
            self.frame.size.width = width
        }
    }
    
    var height: CGFloat {
        get {
            return self.frame.size.height
        }
        set(height) {
            self.frame.size.height = height
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
