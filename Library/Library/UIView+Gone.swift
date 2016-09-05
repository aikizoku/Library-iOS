//
//  UIView+Gone.swift
//  moonshot
//
//  Created by Yuki Hirose on 2016/09/02.
//  Copyright © 2016年 Yuki Hirose. All rights reserved.
//

import Foundation

extension UIView: HasAssociatedObjects {
    
    private var goneConstraint: NSLayoutConstraint? {
        get {
            return self.associatedObjects["goneConstraint"] as? NSLayoutConstraint
        }
        set {
            self.associatedObjects["goneConstraint"] = newValue
        }
    }
    
    var gone: Bool {
        get {
            return goneConstraint == nil
        }
        set {
            if newValue && self.goneConstraint == nil {
                let goneConstraint =
                    NSLayoutConstraint(item: self,
                                       attribute: .Height,
                                       relatedBy: .Equal,
                                       toItem: nil,
                                       attribute: .NotAnAttribute,
                                       multiplier: 1,
                                       constant: 0)
                
                self.addConstraint(goneConstraint)
                self.goneConstraint = goneConstraint
            } else if self.goneConstraint != nil {
                self.removeConstraint(self.goneConstraint!)
                self.goneConstraint = nil
            }
        }
    }
}
