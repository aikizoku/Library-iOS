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
    
    /**
     Viewのoriginを直接指定する
     */
    var origin: CGPoint {
        get {
            return frame.origin
        }
        set {
            frame.origin = newValue
        }
    }
    
    /**
     Viewのxを直接指定する
     */
    var x: CGFloat {
        get {
            return frame.origin.x
        }
        set {
            frame.origin.x = newValue
        }
    }
    
    /**
     Viewのyを直接指定する
     */
    var y: CGFloat {
        get {
            return frame.origin.y
        }
        set {
            frame.origin.y = newValue
        }
    }
    
    /**
     Viewのsizeを直接指定する
     */
    var size: CGSize {
        get {
            return frame.size
        }
        set {
            frame.size = newValue
        }
    }
    
    /**
     Viewのwidthを直接指定する
     */
    var width: CGFloat {
        get {
            return frame.size.width
        }
        set {
            frame.size.width = newValue
        }
    }
    
    /**
     Viewのheightを直接指定する
     */
    var height: CGFloat {
        get {
            return frame.size.height
        }
        set {
            frame.size.height = newValue
        }
    }
    
    /**
     Viewのoriginを加算する
     */
    func addOrigin(origin: CGPoint) {
        x += origin.x
        y += origin.y
    }
    
    /**
     Viewのxを加算する
     */
    func addX(x: CGFloat) {
        self.x += x
    }
    
    /**
     Viewのyを加算する
     */
    func addY(y: CGFloat) {
        self.y += y
    }
    
    /**
     Viewのsizeを加算する
     */
    func addSize(size: CGSize) {
        width += size.width
        height += size.height
    }
    
    /**
     Viewのwidthを加算する
     */
    func addWidth(width: CGFloat) {
        self.width += width
    }
    
    /**
     Viewのheightを加算する
     */
    func addHeight(height: CGFloat) {
        self.height += height
    }
}
