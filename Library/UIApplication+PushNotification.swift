//
//  UIApplication+PushNotification.swift
//  LibrarySample
//
//  Created by Yuki Hirose on 2016/10/21.
//  Copyright © 2016年 yukithehero. All rights reserved.
//

import Foundation
import UIKit
import UserNotifications

extension UIApplication {
    
    /**
     リモートプッシュ通知を登録する
     */
    func registerRemotePushNotification() {
        if #available(iOS 10.0, *) {
            let center = UNUserNotificationCenter.current()
            center.requestAuthorization(options: [.badge, .sound, .alert], completionHandler: { (granted, error) in
                guard granted else {
                    if let error = error {
                        NSLog("%@", error.localizedDescription)
                    }
                    return
                }
                self.registerForRemoteNotifications()
            })
        } else {
            let types: UIUserNotificationType = [.badge, .sound, .alert]
            let settings = UIUserNotificationSettings(types: types, categories: nil)
            registerUserNotificationSettings(settings)
            registerForRemoteNotifications()
        }
    }
    
    /**
     端末のプッシュ通知設定が有効か判定する
     */
    func isEnablePushNotification() -> Bool {
        return isRegisteredForRemoteNotifications
    }
    
    /**
     プッシュ通知設定画面に遷移する
     */
    func openPushNotificationSetting() {
        if let url = URL(string:UIApplicationOpenSettingsURLString) {
            openURL(url)
        }
    }
}
