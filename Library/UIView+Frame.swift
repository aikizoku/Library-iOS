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
            return frame.origin
        }
        set {
            frame.origin = newValue
        }
    }
    
    var x: CGFloat {
        get {
            return frame.origin.x
        }
        set {
            frame.origin.x = newValue
        }
    }
    
    var y: CGFloat {
        get {
            return frame.origin.y
        }
        set {
            frame.origin.y = newValue
        }
    }
    
    var size: CGSize {
        get {
            return frame.size
        }
        set {
            frame.size = newValue
        }
    }
    
    var width: CGFloat {
        get {
            return frame.size.width
        }
        set {
            frame.size.width = newValue
        }
    }
    
    var height: CGFloat {
        get {
            return frame.size.height
        }
        set {
            frame.size.height = newValue
        }
    }
    
    func addOrigin(origin: CGPoint) {
        x += origin.x
        y += origin.y
    }
    
    func addX(x: CGFloat) {
        self.x += x
    }
    
    func addY(y: CGFloat) {
        self.y += y
    }
    
    func addSize(size: CGSize) {
        width += size.width
        height += size.height
    }
    
    func addWidth(width: CGFloat) {
        self.width += width
    }
    
    func addHeight(height: CGFloat) {
        self.height += height
    }
}
