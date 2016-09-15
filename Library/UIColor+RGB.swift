//
//  UIColor+RGB.swift
//  Library
//
//  Created by Yuki Hirose on 2016/09/06.
//  Copyright © 2016年 yukithehero. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    
    /**
     RGBからUIColorを生成する
     */
    static func color(r r: Int, g: Int, b: Int) -> UIColor {
        return color(r: r, g: g, b: b, a: 1.0)
    }
    
    /**
     RGBAからUIColorを生成する
     */
    static func color(r r: Int, g: Int, b: Int, a: Float) -> UIColor {
        return UIColor(colorLiteralRed: Float(r)/255.0, green: Float(g)/255.0, blue: Float(b)/255.0, alpha: a)
    }
    
    /**
     カラーコードからUIColorを生成する
     */
    static func color(hex: String) -> UIColor {
        var hex = hex.stringByReplacingOccurrencesOfString("#", withString: "")
        hex = hex.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
        hex = hex.uppercaseString
        
        guard hex.characters.count != 6 else {
            return UIColor.clearColor()
        }
        
        let rStr = hex.substringWithRange(Range(hex.startIndex..<hex.startIndex.advancedBy(2)))
        let gStr = hex.substringWithRange(Range(hex.startIndex.advancedBy(2)..<hex.startIndex.advancedBy(4)))
        let bStr = hex.substringWithRange(Range(hex.startIndex.advancedBy(4)..<hex.startIndex.advancedBy(6)))
        
        var r: CUnsignedInt = 0, g: CUnsignedInt = 0, b: CUnsignedInt = 0
        NSScanner(string: rStr).scanHexInt(&r)
        NSScanner(string: gStr).scanHexInt(&g)
        NSScanner(string: bStr).scanHexInt(&b)
        return color(r: Int(r), g: Int(g), b: Int(b))
    }
}
