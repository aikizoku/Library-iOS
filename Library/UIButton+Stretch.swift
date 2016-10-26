import Foundation
import UIKit

extension UIButton {
    
    /**
     ボタンにStretchしたimageを追加する
     デフォルトは2px
     */
    func setStretchImageName(name: String, state: UIControlState) {
        setStretchImage(name: name, state: state, capWidth: 2, capHeight: 2)
    }
    
    /**
     ボタンに任意の値でStretchしたimageを追加する
     */
    func setStretchImage(name: String, state: UIControlState, capWidth: Int, capHeight: Int) {
        if let image = UIImage(named: name) {
            let stretchImage = image.stretchableImage(withLeftCapWidth: capWidth, topCapHeight: capHeight)
            setBackgroundImage(stretchImage, for: state)
        }
    }
}
