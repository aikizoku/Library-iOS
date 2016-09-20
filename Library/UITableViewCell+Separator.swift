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
    
    private var separatorView: UIView? {
        get {
            return associatedObjects["separatorView"] as? UIView
        }
        set {
            associatedObjects["separatorView"] = newValue
        }
    }
    
    /**
     セパレータの色を設定する
     */
    var separatorColor: UIColor {
        get {
            if let separatorColor = associatedObjects["separatorColor"] {
                return separatorColor as! UIColor
            } else {
                return UIColor.lightGrayColor()
            }
        }
        set {
            if let separatorView = separatorView {
                separatorView.backgroundColor = newValue
            }
            associatedObjects["separatorColor"] = newValue
        }
    }
    
    /**
     セパレータの高さを設定する
     */
    var separatorHeight: CGFloat {
        get {
            if let separatorHeight = associatedObjects["separatorHeight"] {
                return separatorHeight as! CGFloat
            } else {
                return 0.5
            }
        }
        set {
            if let separatorView = separatorView {
                separatorView.height = newValue
            }
            associatedObjects["separatorHeight"] = newValue
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
                if separatorView == nil {
                    let separatorView: UIView = UIView()
                    separatorView.backgroundColor = separatorColor
                    separatorView.translatesAutoresizingMaskIntoConstraints = false
                    separatorView.autoresizingMask = [.FlexibleTopMargin, .FlexibleWidth]
                    separatorView.frame = CGRect(
                        x: 0,
                        y: contentView.height - separatorHeight,
                        width: contentView.width,
                        height: separatorHeight)
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
