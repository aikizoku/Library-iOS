import Foundation
import UIKit

extension UIColor {
    
    /**
     RGBからUIColorを生成する
     
     UIColor.color(r: 100, g: 100, b: 100)
     */
    static func color(r: Int, g: Int, b: Int) -> UIColor {
        return color(r: r, g: g, b: b, a: 1.0)
    }
    
    /**
     RGBAからUIColorを生成する
     
     UIColor.color(r: 100, g: 100, b: 100, a:0.5)
     */
    static func color(r: Int, g: Int, b: Int, a: Float) -> UIColor {
        return UIColor(colorLiteralRed: Float(r)/255.0, green: Float(g)/255.0, blue: Float(b)/255.0, alpha: a)
    }
    
    /**
     カラーコードからUIColorを生成する
     
     UIColor.color(hex: "#FFA500")
     UIColor.color(hex: "FFA500")
     */
    static func color(hex: String) -> UIColor {
        return color(hex: hex, alpha: 1)
    }
    
    static func color(hex: String, alpha: Float) -> UIColor {
        var hex = hex.replace(target: "#", with: "")
        hex = hex.trim
        hex = hex.uppercased()
        
        guard hex.characters.count == 6 else {
            return UIColor.clear
        }
        
        let rStr = hex.substring(start: 0, length: 2)
        let gStr = hex.substring(start: 2, length: 2)
        let bStr = hex.substring(start: 4, length: 2)
        
        var r: CUnsignedInt = 0, g: CUnsignedInt = 0, b: CUnsignedInt = 0
        Scanner(string: rStr).scanHexInt32(&r)
        Scanner(string: gStr).scanHexInt32(&g)
        Scanner(string: bStr).scanHexInt32(&b)
        return color(r: Int(r), g: Int(g), b: Int(b), a: alpha)
    }
}
