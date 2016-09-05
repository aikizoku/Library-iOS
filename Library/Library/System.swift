//
//  SystemUtil.swift
//  Library
//
//  Created by yukithehero on 2016/08/29.
//  Copyright © 2016年 yukithehero. All rights reserved.
//

import SafariServices

class System: NSObject {
    
    // 端末の名前（プラットフォームコード）を取得する
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
    
    // 端末のOSバージョンを取得する
    static func osVersion() -> String {
        return UIDevice.currentDevice().systemVersion
    }
    
    // アプリの識別子を取得する
    static func bundleIdentifier() -> String {
        return NSBundle.mainBundle().bundleIdentifier ?? ""
    }
    
    // ビルドのバージョンを取得する
    static func buildVersion() -> String {
        return NSBundle.mainBundle().objectForInfoDictionaryKey("CFBundleVersion") as? String ?? ""
    }
    
    // アプリのバージョンを取得する
    static func appVersion() -> String {
        return NSBundle.mainBundle().objectForInfoDictionaryKey("CFBundleShortVersionString") as? String ?? ""
    }
    
    // 端末の言語を取得する
    static func language() -> String {
        return NSLocale.preferredLanguages().first ?? ""
    }
    
    // 端末のタイムゾーンを取得する
    static func timeZone() -> String {
        let fmt = NSDateFormatter.init()
        fmt.timeZone = NSTimeZone.defaultTimeZone()
        fmt.dateFormat = "ZZZ"
        return fmt.stringFromDate(NSDate.init())
    }
    
    // リモートプッシュ通知を登録する
    static func registerRemotePushNotification() {
        let types: UIUserNotificationType = [.Badge, .Sound, .Alert]
        let settings = UIUserNotificationSettings(forTypes: types, categories: nil)
        let application = UIApplication.sharedApplication()
        application.registerUserNotificationSettings(settings)
        application.registerForRemoteNotifications()
    }
    
    // プッシュ通知が有効か判定する
    static func isEnablePushNotification() -> Bool {
        return UIApplication.sharedApplication().isRegisteredForRemoteNotifications()
    }
    
    // プッシュ通知設定画面に遷移する
    static func openPushNotificationSetting() {
        if let url = NSURL(string:UIApplicationOpenSettingsURLString) {
            UIApplication.sharedApplication().openURL(url)
        }
    }
    
    // 外部アプリがインストールされているか判定する
    static func isOpenExternalApp(urlScheme: String) -> Bool {
        if let url = NSURL.init(string: urlScheme) {
            return UIApplication.sharedApplication().canOpenURL(url)
        } else {
            return false
        }
    }
    
    // 外部アプリを開く
    static func openExternalApp(urlScheme: String) {
        if let url = NSURL.init(string: urlScheme) {
            UIApplication.sharedApplication().openURL(url)
        }
    }
    
    // URLをSafariで開く
    static func openSafari(url: String) {
        if let u = NSURL.init(string: url) {
            UIApplication.sharedApplication().openURL(u)
        }
    }
    
    // URLをSafariView(iOS8はSafari)で開く
    static func openSafariView(parentViewController: UIViewController, url: String) {
        if let u = NSURL.init(string: url) {
            if #available(iOS 9.0, *) {
                let viewController = SFSafariViewController.init(URL: u, entersReaderIfAvailable: true)
                parentViewController.presentViewController(viewController, animated: true, completion: nil)
            } else {
                UIApplication.sharedApplication().openURL(u)
            }
        }
    }
}
