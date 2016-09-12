//
//  NSMutableAttributedString+Easy.swift
//  moonshot
//
//  Created by Yuki Hirose on 2016/08/19.
//  Copyright © 2016年 Yuki Hirose. All rights reserved.
//

import Foundation
import UIKit

extension NSMutableAttributedString {
    
    // 全範囲を取得
    func allRange() -> NSRange {
        return NSRange(location: 0, length: length)
    }
    
    // 文字列を追加
    func appendString(string: String) {
        let string: NSMutableAttributedString = NSMutableAttributedString(string: string)
        appendAttributedString(string)
    }
    
    // フォントを設定
    func setFont(font: UIFont) {
        setFont(font, range: allRange())
    }
    
    func setFont(font: UIFont, range: NSRange) {
        addAttribute(NSFontAttributeName,
                     value: font,
                     range: range)
    }
    
    // カラーを設定
    func setColor(color: UIColor) {
        setColor(color, range: allRange())
    }
    
    func setColor(color: UIColor, range: NSRange) {
        addAttribute(NSForegroundColorAttributeName,
                     value: color,
                     range: range)
    }
    
    // 画像を追加
    func appendImage(image aImage: UIImage) {
        appendImage(image: aImage,
                    bounds: CGRect(origin: CGPointZero, size: aImage.size))
    }
    
    func appendImage(image aImage: UIImage, origin aOrigin: CGPoint) {
        appendImage(image: aImage,
                    bounds: CGRect(origin: aOrigin, size: aImage.size))
    }
    
    func appendImage(image aImage: UIImage, size aSize: CGSize) {
        appendImage(image: aImage,
                    bounds: CGRect(origin: CGPointZero, size: aSize))
    }
    
    func appendImage(image aImage: UIImage, bounds aBounds: CGRect) {
        let attachment: NSTextAttachment = NSTextAttachment()
        attachment.image = aImage
        attachment.bounds = aBounds
        appendAttributedString(NSAttributedString(attachment: attachment))
    }
    
    // 文字列間隔を設定
    func setLineSpace(lineSpace: CGFloat) {
        let paragraphStyle: NSMutableParagraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineSpace
        addAttribute(NSParagraphStyleAttributeName,
                     value: paragraphStyle,
                     range: allRange())
    }
}
