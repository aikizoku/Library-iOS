//
//  UIApplication+External.swift
//  LibrarySample
//
//  Created by Yuki Hirose on 2016/10/21.
//  Copyright © 2016年 yukithehero. All rights reserved.
//

import Foundation
import UIKit

extension UIApplication {
    
    /**
     指定した外部アプリがインストールされているか判定する
     */
    func canOpenExternalApp(url: String) -> Bool {
        if let url = URL(string: url) {
            return canOpenURL(url)
        } else {
            return false
        }
    }
    
    /**
     外部アプリを開く
     */
    func openExternalApp(url: String) {
        if let url = URL(string: url) {
            openURL(url)
        }
    }
}
