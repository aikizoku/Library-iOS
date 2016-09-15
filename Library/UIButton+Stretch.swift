//
//  UIButton+Stretch.swift
//  Library
//
//  Created by Yuki Hirose on 2016/09/06.
//  Copyright © 2016年 yukithehero. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
    
    func setStretchImageName(name: String, state: UIControlState) {
        setStretchImageName(name, state: state, capWidth: 2, capHeight: 2)
    }
    
    func setStretchImageName(name: String, state: UIControlState, capWidth: Int, capHeight: Int) {
        if let image = UIImage(named: name) {
            let stretchImage = image.stretchableImageWithLeftCapWidth(capWidth, topCapHeight: capHeight)
            setBackgroundImage(stretchImage, forState: state)
        }
    }
}
