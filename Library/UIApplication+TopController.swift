import Foundation
import UIKit

extension UIApplication {
    
    /**
     最前面のUIViewControllerを取得する
     */
    var topViewController: UIViewController? {
        guard var topViewController = keyWindow?.rootViewController else {
            return nil
        }
        
        while let presentedViewController = topViewController.presentedViewController {
            topViewController = presentedViewController
        }
        return topViewController
    }
    
    /**
     最前面のUINavigationControllerを取得する
     */
    var topNavigationController: UINavigationController? {
        return topViewController as? UINavigationController
    }
}
