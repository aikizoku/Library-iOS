//
//  SystemUtil.swift
//  Library
//
//  Created by yukithehero on 2016/08/29.
//  Copyright © 2016年 yukithehero. All rights reserved.
//

import Foundation
import SafariServices
import UserNotifications

class System: NSObject {
    
    /**
     iPhoneか判定する
     */
    static let isPhone = { () -> Bool in
        return UIDevice.current.userInterfaceIdiom == .phone
    }()
    
    /**
     iPadか判定する
     */
    static let isPad = { () -> Bool in
        return UIDevice.current.userInterfaceIdiom == .pad
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
            if let value = child.value as? Int8, value != 0 {
                identifier.append(UnicodeScalar(UInt8(value)).escaped(asASCII: true))
            }
        }
        return identifier
    }
    
    /**
     端末のOSバージョンを取得する
     */
    static func osVersion() -> String {
        return UIDevice.current.systemVersion
    }
    
    /**
     アプリの識別子を取得する
     */
    static func bundleIdentifier() -> String {
        return Bundle.main.bundleIdentifier ?? ""
    }
    
    /**
     Info.plistから値を取得する
    */
    static func object<T>(forInfoDictionaryKey: String) -> T? {
        if let value = Bundle.main.object(forInfoDictionaryKey: forInfoDictionaryKey) as? T {
            return value
        }
        return nil
    }
    
    /**
     ビルドのバージョンを取得する
     */
    static func buildVersion() -> String {
        if let value: String = object(forInfoDictionaryKey: "CFBundleVersion") {
            return value
        } else {
            return ""
        }
    }
    
    /**
     アプリのバージョンを取得する
     */
    static func appVersion() -> String {
        if let value: String = object(forInfoDictionaryKey: "CFBundleShortVersionString") {
            return value
        } else {
            return ""
        }
    }
    
    /**
     現在設定されている端末の言語を取得する
     */
    static func currentLanguage() -> String {
        return NSLocale.preferredLanguages.first ?? ""
    }
    
    /**
     現在設定されている端末のタイムゾーンを取得する
     */
    static func currentTimeZone() -> String {
        let fmt = DateFormatter()
        fmt.timeZone = TimeZone.current
        fmt.dateFormat = "ZZZ"
        return fmt.string(from: Date())
    }
    
    /**
     リモートプッシュ通知を登録する
     */
    static func registerRemotePushNotification() {
        let application = UIApplication.shared
        if #available(iOS 10.0, *) {
            let center = UNUserNotificationCenter.current()
            center.requestAuthorization(options: [.badge, .sound, .alert], completionHandler: { (granted, error) in
                guard granted else {
                    if let error = error {
                        NSLog("%@", error.localizedDescription)
                    }
                    return
                }
                application.registerForRemoteNotifications()
            })
        } else {
            let types: UIUserNotificationType = [.badge, .sound, .alert]
            let settings = UIUserNotificationSettings(types: types, categories: nil)
            application.registerUserNotificationSettings(settings)
            application.registerForRemoteNotifications()
        }
    }
    
    /**
     端末のプッシュ通知設定が有効か判定する
     */
    static func isEnablePushNotification() -> Bool {
        return UIApplication.shared.isRegisteredForRemoteNotifications
    }
    
    /**
     プッシュ通知設定画面に遷移する
     */
    static func openPushNotificationSetting() {
        if let url = URL(string:UIApplicationOpenSettingsURLString) {
            UIApplication.shared.openURL(url)
        }
    }
    
    /**
     指定した外部アプリがインストールされているか判定する
     */
    static func canOpenExternalApp(urlScheme: String) -> Bool {
        if let url = URL(string: urlScheme) {
            return UIApplication.shared.canOpenURL(url)
        } else {
            return false
        }
    }
    
    /**
     外部アプリを開く
     */
    static func openExternalApp(urlScheme: String) {
        if let url = URL(string: urlScheme) {
            UIApplication.shared.openURL(url)
        }
    }
    
    /**
     文字列をSafariで開く
     */
    static func openSafari(string: String) {
        guard string.isNotEmpty() else {
            return
        }
        self.openSafari(url: URL(string: string))
    }
    
    /**
     URLをSafariで開く
     */
    static func openSafari(url: URL?) {
        guard let url = url else {
            return
        }
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.openURL(url)
        }
    }
    
    /**
     文字列をSafariView(iOS8はSafari)で開く
     */
    static func openSafariView(parentViewController: UIViewController, string: String) {
        guard string.isNotEmpty() else {
            return
        }
        self.openSafariView(parentViewController, url: URL(string: string))
    }
    
    /**
     URLをSafariView(iOS8はSafari)で開く
     */
    static func openSafariView(parentViewController: UIViewController, url: NSURL?) {
        guard let url = url else {
            return
        }
        if UIApplication.shared.canOpenURL(url) {
            if #available(iOS 9.0, *) {
                let viewController = SFSafariViewController(URL: url, entersReaderIfAvailable: true)
                parentViewController.presentViewController(viewController, animated: true, completion: nil)
            } else {
                UIApplication.shared.openURL(url)
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
    
    /**
     共通Pastboardにテキストを貼り付ける
     */
    static func copyPastboard(text text: String) {
        UIPasteboard.generalPasteboard().string = text
    }
    
    /**
     共通Pastboardに画像を貼り付ける
     */
    static func copyPastboard(image image: UIImage) {
        UIPasteboard.generalPasteboard().image = image
    }
    
    /**
     共通Pastboardにテキストと画像を貼り付ける
     */
    static func copyPastboard(text text: String, image: UIImage) {
        let pastboard = UIPasteboard.generalPasteboard()
        pastboard.string = text
        pastboard.image = image
    }
    
    
    
}
