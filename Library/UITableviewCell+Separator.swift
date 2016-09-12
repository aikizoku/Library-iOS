//
//  UITableviewCell+Separator.swift
//  Library
//
//  Created by Yuki Hirose on 2016/08/30.
//  Copyright © 2016年 yukithehero. All rights reserved.
//

import Foundation
import UIKit

extension UITableViewCell {
    
    private var separatorView: UIView? {
        get {
            return associatedObjects["separatorView"] as? UIView
        }
        set {
            associatedObjects["separatorView"] = newValue
        }
    }
    
    // セパレータの色を設定
    var separatorColor: UIColor {
        get {
            return self.separatorColor ?? UIColor.lightGrayColor()
        }
        set {
            associatedObjects["separatorColor"] = newValue
        }
    }
    
    // セパレータを設定
    var separator: Bool {
        get {
            return self.separator
        }
        set {
            self.separator = newValue
            if newValue {
                if separatorView == nil {
                    let separatorView: UIView = UIView.init()
                    separatorView.backgroundColor = separatorColor
                    separatorView.addConstraint(
                        NSLayoutConstraint(
                            item: separatorView,
                            attribute: .Leading,
                            relatedBy: .Equal,
                            toItem: contentView,
                            attribute: .Leading,
                            multiplier: 1.0,
                            constant: 0))
                    separatorView.addConstraint(
                        NSLayoutConstraint(
                            item: separatorView,
                            attribute: .Bottom,
                            relatedBy: .Equal,
                            toItem: contentView,
                            attribute: .Bottom,
                            multiplier: 1.0,
                            constant: 0))
                    separatorView.addConstraint(
                        NSLayoutConstraint(
                            item: separatorView,
                            attribute: .Trailing,
                            relatedBy: .Equal,
                            toItem: contentView,
                            attribute: .Trailing,
                            multiplier: 1.0,
                            constant: 0))
                    separatorView.addConstraint(
                        NSLayoutConstraint(
                            item: separatorView,
                            attribute: .Height,
                            relatedBy: .Equal,
                            toItem: nil,
                            attribute: .Height,
                            multiplier: 1.0,
                            constant: 1))
                    contentView.addSubview(separatorView)
                    self.separatorView = separatorView
                }
            } else {
                if separatorView != nil {
                    separatorView!.removeFromSuperview()
                    separatorView = nil
                }
            }
        }
    }
}
