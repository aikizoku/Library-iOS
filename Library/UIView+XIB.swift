import Foundation
import UIKit

protocol NibInstantiatable {}
extension UIView: NibInstantiatable {}

extension NibInstantiatable where Self: UIView {
    
    /**
     xibから独自Viewのインスタンスを取得する
     */
    static func instantiate(withOwner ownerOrNil: Any? = nil) -> Self {
        let nib = UINib(nibName: self.className, bundle: nil)
        return nib.instantiate(withOwner: ownerOrNil, options: nil)[0] as! Self
    }
}
