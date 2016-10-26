import Foundation
import UIKit

extension UIScreen {
    
    /**
     画面サイズを取得する
     */
    class var size: CGSize {
        return UIScreen.main.bounds.size
    }
    
    /**
     画面の横幅を取得する
     */
    class var width: CGFloat {
        return UIScreen.main.bounds.size.width
    }
    
    /**
     画面の縦幅を取得する
     */
    class var height: CGFloat {
        return UIScreen.main.bounds.size.height
    }
}

