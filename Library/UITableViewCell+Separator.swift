//
//  UITableViewCell+Separator.swift
//  LibrarySample
//
//  Created by yukithehero on 2016/09/20.
//  Copyright © 2016年 yukithehero. All rights reserved.
//

import Foundation
import UIKit

extension UITableViewCell {
    
    private var theSeparatorView: UIView? {
        get {
            return associatedObjects["theSeparatorView"] as? UIView
        }
        set {
            associatedObjects["theSeparatorView"] = newValue
        }
    }
    
    /**
     セパレータの色を設定する
     */
    var theSeparatorColor: UIColor {
        get {
            if let theSeparatorColor = associatedObjects["theSeparatorColor"] {
                return theSeparatorColor as! UIColor
            } else {
                return UIColor.lightGrayColor()
            }
        }
        set {
            if let theSeparatorView = theSeparatorView {
                theSeparatorView.backgroundColor = newValue
            }
            associatedObjects["theSeparatorColor"] = newValue
        }
    }
    
    /**
     セパレータの高さを設定する
     */
    var theSeparatorHeight: CGFloat {
        get {
            if let theSeparatorHeight = associatedObjects["theSeparatorHeight"] {
                return theSeparatorHeight as! CGFloat
            } else {
                return 0.5
            }
        }
        set {
            if let theSeparatorView = theSeparatorView {
                theSeparatorView.height = newValue
            }
            associatedObjects["theSeparatorHeight"] = newValue
        }
    }
    
    /**
     セパレータを設定する
     */
    var separator: Bool {
        get {
            if let separator = associatedObjects["separator"] {
                return separator as! Bool
            } else {
                return false
            }
        }
        set {
            associatedObjects["separator"] = newValue
            if newValue {
                if theSeparatorView == nil {
                    let theSeparatorView: UIView = UIView()
                    theSeparatorView.backgroundColor = theSeparatorColor
                    theSeparatorView.translatesAutoresizingMaskIntoConstraints = false
                    theSeparatorView.autoresizingMask = [.FlexibleTopMargin, .FlexibleWidth]
                    theSeparatorView.frame = CGRect(
                        x: 0,
                        y: contentView.height - theSeparatorHeight,
                        width: contentView.width,
                        height: theSeparatorHeight)
                    contentView.addSubview(theSeparatorView)
                    self.theSeparatorView = theSeparatorView
                }
            } else {
                if theSeparatorView != nil {
                    theSeparatorView!.removeFromSuperview()
                    theSeparatorView = nil
                }
            }
        }
    }

}
