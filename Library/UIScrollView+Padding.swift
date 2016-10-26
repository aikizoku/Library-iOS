import Foundation
import UIKit

extension UIScrollView {
    
    /**
     表示とスクロール範囲にパディングを設定する
     */
    func setPadding(top: Int, bottom: Int, left: Int, right: Int) {
        let edgeInset = UIEdgeInsetsMake(CGFloat(top), CGFloat(left), CGFloat(bottom), CGFloat(right))
        contentInset = edgeInset
        scrollIndicatorInsets = edgeInset
    }
}
