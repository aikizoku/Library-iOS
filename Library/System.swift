//
//  SystemUtil.swift
//  Library
//
//  Created by yukithehero on 2016/08/29.
//  Copyright © 2016年 yukithehero. All rights reserved.
//

import Foundation
import SafariServices

class System: NSObject {
    
    /**
     iPhoneか判定する
     */
    static let isPhone = { () -> Bool in
        return UIDevice.currentDevice().userInterfaceIdiom == .Phone
    }()
    
    /**
     iPadか判定する
     */
    static let isPad = { () -> Bool in
        return UIDevice.currentDevice().userInterfaceIdiom == .Pad
    }()
    
    /**
     端末の名前（プラットフォームコード）を取得する
     */
    static func deviceName() -> String {
        var systemInfo = utsname()
        uname(&systemInfo)
        let mirror = Mirror(reflecting: systemInfo.machine)
        var identifier = ""
        for child in mirror.children {
            if let value = child.value as? Int8 where value != 0 {
                identifier.append(UnicodeScalar(UInt8(value)))
            }
        }
        return identifier
    }
    
    /**
     端末のOSバージョンを取得する
     */
    static func osVersion() -> String {
        return UIDevice.currentDevice().systemVersion
    }
    
    /**
     アプリの識別子を取得する
     */
    static func bundleIdentifier() -> String {
        return NSBundle.mainBundle().bundleIdentifier ?? ""
    }
    
    /**
     ビルドのバージョンを取得する
     */
    static func buildVersion() -> String {
        return NSBundle.mainBundle().objectForInfoDictionaryKey("CFBundleVersion") as? String ?? ""
    }
    
    /**
     アプリのバージョンを取得する
     */
    static func appVersion() -> String {
        return NSBundle.mainBundle().objectForInfoDictionaryKey("CFBundleShortVersionString") as? String ?? ""
    }
    
    /**
     現在設定されている端末の言語を取得する
     */
    static func currentLanguage() -> String {
        return NSLocale.preferredLanguages().first ?? ""
    }
    
    /**
     現在設定されている端末のタイムゾーンを取得する
     */
    static func currentTimeZone() -> String {
        let fmt = NSDateFormatter()
        fmt.timeZone = NSTimeZone.defaultTimeZone()
        fmt.dateFormat = "ZZZ"
        return fmt.stringFromDate(NSDate())
    }
    
    /**
     リモートプッシュ通知を登録する
     */
    static func registerRemotePushNotification() {
        let types: UIUserNotificationType = [.Badge, .Sound, .Alert]
        let settings = UIUserNotificationSettings(forTypes: types, categories: nil)
        let application = UIApplication.sharedApplication()
        application.registerUserNotificationSettings(settings)
        application.registerForRemoteNotifications()
    }
    
    /**
     端末のプッシュ通知設定が有効か判定する
     */
    static func isEnablePushNotification() -> Bool {
        return UIApplication.sharedApplication().isRegisteredForRemoteNotifications()
    }
    
    /**
     プッシュ通知設定画面に遷移する
     */
    static func openPushNotificationSetting() {
        if let url = NSURL(string:UIApplicationOpenSettingsURLString) {
            UIApplication.sharedApplication().openURL(url)
        }
    }
    
    /**
     指定した外部アプリがインストールされているか判定する
     */
    static func isOpenExternalApp(urlScheme: String) -> Bool {
        if let url = NSURL(string: urlScheme) {
            return UIApplication.sharedApplication().canOpenURL(url)
        } else {
            return false
        }
    }
    
    /**
     外部アプリを開く
     */
    static func openExternalApp(urlScheme: String) {
        if let url = NSURL(string: urlScheme) {
            UIApplication.sharedApplication().openURL(url)
        }
    }
    
    /**
     URLをSafariで開く
     */
    static func openSafari(url: String) {
        if let u = NSURL(string: url) {
            UIApplication.sharedApplication().openURL(u)
        }
    }
    
    /**
     URLをSafariView(iOS8はSafari)で開く
     */
    static func openSafariView(parentViewController: UIViewController, url: String) {
        if let u = NSURL(string: url) {
            if #available(iOS 9.0, *) {
                let viewController = SFSafariViewController(URL: u, entersReaderIfAvailable: true)
                parentViewController.presentViewController(viewController, animated: true, completion: nil)
            } else {
                UIApplication.sharedApplication().openURL(u)
            }
        }
    }
    
    /**
     画面サイズを取得する
     */
    static func screenSize() -> CGSize {
        return UIScreen.mainScreen().bounds.size
    }
    
    /**
     画面の幅を取得する
     */
    static func screenWidth() -> CGFloat {
        return screenSize().width
    }
    
    /**
     画面の高さを取得する
     */
    static func screenHeight() -> CGFloat {
        return screenSize().height
    }
    
}
