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
