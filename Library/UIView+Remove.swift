import Foundation
import UIKit

extension UIView {
    
    /**
     全てのSubViewを取り除く
     */
    func removeAllSubviews() {
        subviews.each { (view) in
            view.removeFromSuperview()
        }
    }
}
