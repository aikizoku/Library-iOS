//
//  UIView+Corner.swift
//  moonshot
//
//  Created by Yuki Hirose on 2016/09/28.
//  Copyright © 2016年 Yuki Hirose. All rights reserved.
//

import Foundation

extension UIView {
    
    func drawRoundRect(radius: CGFloat) {
        guard let c: CGContextRef = UIGraphicsGetCurrentContext() else {
            return
        }
        CGContextSetFillColorWithColor(c, UIColor.clearColor().CGColor)
        CGContextMoveToPoint(c, CGRectGetMinX(bounds), CGRectGetMidY(bounds))
        CGContextAddArcToPoint(c, CGRectGetMinX(bounds), CGRectGetMinY(bounds), CGRectGetMidX(bounds), CGRectGetMinY(bounds), radius)
        CGContextAddArcToPoint(c, CGRectGetMaxX(bounds), CGRectGetMinY(bounds), CGRectGetMaxX(bounds), CGRectGetMidY(bounds), radius)
        CGContextAddArcToPoint(c, CGRectGetMaxX(bounds), CGRectGetMaxY(bounds), CGRectGetMidX(bounds), CGRectGetMaxY(bounds), radius)
        CGContextAddArcToPoint(c, CGRectGetMinX(bounds), CGRectGetMaxY(bounds), CGRectGetMinX(bounds), CGRectGetMidY(bounds), radius)
        CGContextClosePath(c)
        CGContextFillPath(c)
    }
}
