//
//  SystemUtil.swift
//  Library
//
//  Created by yukithehero on 2016/08/29.
//  Copyright © 2016年 yukithehero. All rights reserved.
//

import Foundation
import UIKit

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
}
