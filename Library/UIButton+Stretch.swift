//
//  UIButton+Stretch.swift
//  moonshot
//
//  Created by Yuki Hirose on 2016/09/05.
//  Copyright © 2016年 Yuki Hirose. All rights reserved.
//


extension UIButton {
    
    func setStretchImageName(name: String, state: UIControlState) {
        self.setStretchImageName(name, state: state, capWidth: 2, capHeight: 2)
    }
    
    func setStretchImageName(name: String, state: UIControlState, capWidth: Int, capHeight: Int) {
        if let image = UIImage.init(named: name) {
            let stretchImage = image.stretchableImageWithLeftCapWidth(capWidth, topCapHeight: capHeight)
            self.setBackgroundImage(stretchImage, forState: state)
        }
    }
}
