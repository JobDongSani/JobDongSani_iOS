//
//  Extension.swift
//  Hackathon2021
//
//  Created by Ji-hoon Ahn on 2021/11/21.
//

import UIKit

private let standard: CGFloat = 375
private let bound = UIScreen.main.bounds

extension UILabel {
    func dynamicFont(fontSize size: CGFloat, fontName: String , textStyle: UIFont.TextStyle = .body){
        let resize = bound.width * (size/standard)
        let f = UIFont(name: fontName, size: resize)!
        self.adjustsFontForContentSizeCategory = true
        self.font = UIFontMetrics(forTextStyle: textStyle).scaledFont(for: f)
    }
}
extension UITextField {
    func dynamicFont(fontSize size: CGFloat, fontName: String, textStyle: UIFont.TextStyle = .body){
        let resize = bound.width * (size/standard)
        let f = UIFont(name: fontName, size: resize)!
        self.adjustsFontForContentSizeCategory = true
        self.font = UIFontMetrics(forTextStyle: textStyle).scaledFont(for: f)
    }
}
extension UITextView {
    func dynamicFont(fontSize size: CGFloat, fontName: String , textStyle: UIFont.TextStyle = .body){
        let resize = bound.width * (size/standard)
        let f = UIFont(name: fontName, size: resize)!
        self.adjustsFontForContentSizeCategory = true
        self.font = UIFontMetrics(forTextStyle: textStyle).scaledFont(for: f)
    }
}
extension UIButton {
    func dynamicFont(fontSize size: CGFloat, fontName: String , textStyle: UIFont.TextStyle = .body){
        let resize = bound.width * (size/standard)
        let f = UIFont(name: fontName, size: resize)!
        self.titleLabel?.adjustsFontForContentSizeCategory = true
        self.titleLabel?.font = UIFontMetrics(forTextStyle: textStyle).scaledFont(for: f)
    }
}
extension UIFont {
    func dynamicFont(fontSize size : CGFloat, fontName : String ) -> UIFont{
        let resize = bound.width * (size/standard)
        let f = UIFont(name: fontName, size: resize)!
        return f
    }
}

//MARK: - Color
extension UIColor{
    static func rgb(red: CGFloat ,green: CGFloat,blue:CGFloat) -> UIColor{
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
    static func rgba(red: CGFloat ,green: CGFloat,blue:CGFloat, alpha:CGFloat) -> UIColor{
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: alpha)
    }
    static let JobDongSani_7471E7 = UIColor.rgb(red: 116, green: 113, blue: 231)
    static let JobDongSani_7190FF = UIColor.rgb(red: 113, green: 144, blue: 255)
    static let JobDongSani_868686 = UIColor.rgb(red: 134, green: 134, blue: 134)
    static let JobDongSani_808080 = UIColor.rgb(red: 128, green: 128, blue: 128)
}

// MARK: - view gradient color extension
extension UIView {
    @discardableResult
    func applyGradient(colors: [UIColor]) -> CAGradientLayer {
        return self.applyGradient(colors: colors, locations: nil)
    }
    
    @discardableResult
    func applyGradient(colors: [UIColor], locations: [NSNumber]?) -> CAGradientLayer {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = colors.map { $0.cgColor }
        gradient.locations = locations
        self.layer.insertSublayer(gradient, at: 0)
        return gradient
    }
}

//MARK: - label gradient extension
extension UILabel{
    public func updateGradientTextColor_horizontal(gradientColors: [UIColor] = [UIColor(white: 0, alpha: 0.95), UIColor(white: 0, alpha: 0.6)]){
        let size = CGSize(width: intrinsicContentSize.width, height: 1)
        
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        
        defer { UIGraphicsEndImageContext()}
        guard let context = UIGraphicsGetCurrentContext() else {return}
        var colors: [CGColor] = []
        for color in gradientColors{
            colors.append(color.cgColor)
        }
        guard let gradient = CGGradient(colorsSpace: CGColorSpaceCreateDeviceRGB(),
                                        colors: colors as CFArray,
                                        locations: nil) else {return }
        
        context.drawLinearGradient(
            gradient,
            start: CGPoint.zero,
            end: CGPoint(x: size.width, y:0),
            options: []
        )
        if let image = UIGraphicsGetImageFromCurrentImageContext(){
            self.textColor = UIColor(patternImage: image)
        }
    }
    public func updateGradientTextColor_vertical(gradientColors: [UIColor] = [UIColor(white: 0, alpha: 0.95), UIColor(white: 0, alpha: 0.6)]){
        let size = CGSize(width: intrinsicContentSize.width, height: intrinsicContentSize.height)
        
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
          
        defer { UIGraphicsEndImageContext()}
        guard let context = UIGraphicsGetCurrentContext() else {return}
        var colors: [CGColor] = []
        for color in gradientColors{
            colors.append(color.cgColor)
        }
        guard let gradient = CGGradient(colorsSpace: CGColorSpaceCreateDeviceRGB(),
                                        colors: colors as CFArray,
                                        locations: nil) else {return }
        
        context.drawLinearGradient(
            gradient,
            start: CGPoint.zero,
            end: CGPoint(x: 0, y: size.height),
            options: []
        )
        if let image = UIGraphicsGetImageFromCurrentImageContext(){
            self.textColor = UIColor(patternImage: image)
        }
    }
   
}

//MARK: - Shadow extension
extension CALayer {
func applySketchShadow(color: UIColor = .black,alpha: Float = 0.5,x:CGFloat,y:CGFloat,blur: CGFloat,spread: CGFloat = 0){
        shadowColor = color.cgColor
        shadowOpacity = alpha
        shadowOffset = CGSize(width: x, height: y)
        shadowRadius = blur/UIScreen.main.scale
        masksToBounds = false
    
        if spread == 0 {
            shadowPath = nil
        }else {
            let dx = -spread
            let rect = bounds.insetBy(dx: dx, dy: dx)
            shadowPath = UIBezierPath(rect: rect).cgPath
        }
    }
}
extension NSMutableAttributedString {
    func setColorForText(textToFind: String, withColor color: UIColor) {
        let range: NSRange = self.mutableString.range(of: textToFind, options: .caseInsensitive)
        self.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: range)
        }
    func setFontForText(textToFind: String, withFont font: UIFont
    ){
        let range : NSRange = self.mutableString.range(of: textToFind,options: .caseInsensitive)
        self.addAttribute(NSAttributedString.Key.font, value: font, range: range)
    }
}
