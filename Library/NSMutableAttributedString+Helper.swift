//
//  NSMutableAttributedString+Easy.swift
//  Library
//
//  Created by Yuki Hirose on 2016/09/06.
//  Copyright © 2016年 yukithehero. All rights reserved.
//

import Foundation
import UIKit

extension NSMutableAttributedString {
    
    /**
     文字列の全範囲を取得する
     */
    func allRange() -> NSRange {
        return NSRange(location: 0, length: length)
    }
    
    /**
     文字列を追加する
     */
    func appendString(string: String) {
        let string = NSMutableAttributedString(string: string)
        append(string)
    }
    
    /**
     フォントを設定する
     */
    func set(font: UIFont) {
        set(font: font, range: allRange())
    }
    
    func set(font: UIFont, range: NSRange) {
        addAttribute(NSFontAttributeName,
                     value: font,
                     range: range)
    }
    
    func set(font: UIFont, string: String) {
        self.string.range
        guard let range = self.string.range(of: string) else {
            return
        }
        addAttribute(NSFontAttributeName,
                     value: font,
                     range: range.toNSRange())
    }
    
    /**
     カラーを設定する
     */
    func set(color: UIColor) {
        set(color: color, range: allRange())
    }
    
    func set(color: UIColor, range: NSRange) {
        addAttribute(NSForegroundColorAttributeName,
                     value: color,
                     range: range)
    }
    
    func set(color: UIColor, string: String) {
        guard let range = self.string.range(of: string) else {
            return
        }
        addAttribute(NSForegroundColorAttributeName,
                     value: color,
                     range: range.toNSRange())
    }
    
    /**
     画像を追加する
     */
    func appendImage(image aImage: UIImage) {
        appendImage(image: aImage,
                    bounds: CGRect(origin: CGPoint.zero, size: aImage.size))
    }
    
    func appendImage(image aImage: UIImage, origin aOrigin: CGPoint) {
        appendImage(image: aImage,
                    bounds: CGRect(origin: aOrigin, size: aImage.size))
    }
    
    func appendImage(image aImage: UIImage, size aSize: CGSize) {
        appendImage(image: aImage,
                    bounds: CGRect(origin: CGPoint.zero, size: aSize))
    }
    
    func appendImage(image aImage: UIImage, bounds aBounds: CGRect) {
        let attachment: NSTextAttachment = NSTextAttachment()
        attachment.image = aImage
        attachment.bounds = aBounds
        append(NSAttributedString(attachment: attachment))
    }
    
    /**
     文字列間隔を設定する
     */
    func setLineSpace(lineSpace: CGFloat) {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineSpace
        addAttribute(NSParagraphStyleAttributeName,
                     value: paragraphStyle,
                     range: allRange())
    }
}
