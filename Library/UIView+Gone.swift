//
//  UIView+Gone.swift
//  Library
//
//  Created by Yuki Hirose on 2016/09/06.
//  Copyright © 2016年 yukithehero. All rights reserved.
//

import Foundation
import UIKit

import Foundation

extension UIView: HasAssociatedObjects {
    
    /**
     AndroidのView.GONE（hiddenしてトルツメ）を再現する
     */
    private var goneConstraint: NSLayoutConstraint? {
        get {
            return associatedObjects["goneConstraint"] as? NSLayoutConstraint
        }
        set {
            associatedObjects["goneConstraint"] = newValue
        }
    }
    
    var gone: Bool {
        get {
            return goneConstraint == nil
        }
        set {
            if newValue && goneConstraint == nil {
                let goneConstraint =
                    NSLayoutConstraint(item: self,
                                       attribute: .Height,
                                       relatedBy: .Equal,
                                       toItem: nil,
                                       attribute: .NotAnAttribute,
                                       multiplier: 1,
                                       constant: 0)
                
                addConstraint(goneConstraint)
                self.goneConstraint = goneConstraint
                hidden = true
            } else if goneConstraint != nil {
                removeConstraint(goneConstraint!)
                goneConstraint = nil
                hidden = false
            }
        }
    }
}
