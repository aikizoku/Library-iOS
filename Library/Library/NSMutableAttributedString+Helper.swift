//
//  NSMutableAttributedString+Easy.swift
//  moonshot
//
//  Created by Yuki Hirose on 2016/08/19.
//  Copyright © 2016年 Yuki Hirose. All rights reserved.
//

extension NSMutableAttributedString {
    
    // 全範囲を取得
    func allRange() -> NSRange {
        return NSRange.init(location: 0, length: self.length)
    }
    
    // 文字列を追加
    func appendString(string: String) {
        let string: NSMutableAttributedString = NSMutableAttributedString.init(string: string)
        self.appendAttributedString(string)
    }
    
    // フォントを設定
    func setFont(font: UIFont) {
        self.setFont(font, range: self.allRange())
    }
    
    func setFont(font: UIFont, range: NSRange) {
        self.addAttribute(NSFontAttributeName,
                          value: font,
                          range: range)
    }
    
    // カラーを設定
    func setColor(color: UIColor) {
        self.setColor(color, range: self.allRange())
    }
    
    func setColor(color: UIColor, range: NSRange) {
        self.addAttribute(NSForegroundColorAttributeName,
                          value: color,
                          range: range)
    }
    
    // 画像を追加
    func appendImage(image aImage: UIImage) {
        self.appendImage(image: aImage,
                         bounds: CGRect.init(origin: CGPointZero, size: aImage.size))
    }
    
    func appendImage(image aImage: UIImage, origin aOrigin: CGPoint) {
        self.appendImage(image: aImage,
                         bounds: CGRect.init(origin: aOrigin, size: aImage.size))
    }
    
    func appendImage(image aImage: UIImage, size aSize: CGSize) {
        self.appendImage(image: aImage,
                         bounds: CGRect.init(origin: CGPointZero, size: aSize))
    }
    
    func appendImage(image aImage: UIImage, bounds aBounds: CGRect) {
        let attachment: NSTextAttachment = NSTextAttachment()
        attachment.image = aImage
        attachment.bounds = aBounds
        self.appendAttributedString(NSAttributedString.init(attachment: attachment))
    }
    
    // 文字列間隔を設定
    func setLineSpace(lineSpace: CGFloat) {
        let paragraphStyle: NSMutableParagraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineSpace
        self.addAttribute(NSParagraphStyleAttributeName,
                          value: paragraphStyle,
                          range: self.allRange())
    }
}
