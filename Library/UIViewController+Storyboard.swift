import Foundation
import UIKit

protocol StoryBoardInstantiatable {}
extension UIViewController: StoryBoardInstantiatable {}

extension StoryBoardInstantiatable where Self: UIViewController {
    
    /**
     Storyboardからinstanceを取得する短縮形
     */
    static func instantiate() -> Self {
        let storyboard = UIStoryboard(name: self.className, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: self.className) as! Self
    }
    
    /**
     Storyboardからinstanceを取得する短縮形（Storyboardの名前を指定）
     */
    static func instantiate(withStoryboard storyboard: String) -> Self {
        let storyboard = UIStoryboard(name: storyboard, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: self.className) as! Self
    }
}
