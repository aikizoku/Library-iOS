//
//  UIApplication+Safari.swift
//  LibrarySample
//
//  Created by Yuki Hirose on 2016/10/21.
//  Copyright © 2016年 yukithehero. All rights reserved.
//

import Foundation
import SafariServices

extension UIApplication {
    
    /**
     文字列をSafariで開く
     */
    func openSafari(string: String) {
        guard string.isNotEmpty() else {
            return
        }
        openSafari(url: URL(string: string))
    }
    
    /**
     URLをSafariで開く
     */
    func openSafari(url: URL?) {
        guard let url = url else {
            return
        }
        if canOpenURL(url) {
            openURL(url)
        }
    }
    
    /**
     文字列をSafariView(iOS8はSafari)で開く
     */
    func openSafariView(parentViewController: UIViewController, string: String) {
        guard string.isNotEmpty() else {
            return
        }
        openSafariView(parentViewController: parentViewController, url: URL(string: string))
    }
    
    /**
     URLをSafariView(iOS8はSafari)で開く
     */
    func openSafariView(parentViewController: UIViewController, url: URL?) {
        guard let url = url else {
            return
        }
        if canOpenURL(url) {
            if #available(iOS 9.0, *) {
                let viewController = SFSafariViewController(url: url, entersReaderIfAvailable: true)
                parentViewController.present(viewController, animated: true, completion: nil)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
    }
    
}
