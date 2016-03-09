//
//  UIColor.swift
//  Pods
//
//  Created by Leandro Tami on 1/18/16.
//
//

import UIKit

extension UIColor
{
    
    // MARK: Properties

    public var components: (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat)
    {
        // from: http://stackoverflow.com/questions/28532564/extract-rgb-values-from-uicolor
        var r: CGFloat = 0, g: CGFloat = 0, b: CGFloat = 0, a: CGFloat = 0
        getRed(&r, green: &g, blue: &b, alpha: &a)
        return (r,g,b,a)
    }

    // MARK: Initializers

    public convenience init(hex: Int)
    {
        // from: http://stackoverflow.com/questions/24263007/how-to-use-hex-colour-values-in-swift-ios
        let components = (
            R: CGFloat((hex >> 16) & 0xff) / 255,
            G: CGFloat((hex >> 08) & 0xff) / 255,
            B: CGFloat((hex >> 00) & 0xff) / 255
        )
        self.init(red: components.R, green: components.G, blue: components.B, alpha: 1)
    }
    
    // MARK: Methods
    
    public func toImage() -> UIImage?
    {
        let rect = CGRectMake(0.0, 0.0, 1.0, 1.0)
        UIGraphicsBeginImageContext(rect.size)
        if let context = UIGraphicsGetCurrentContext() {
            CGContextSetFillColorWithColor(context, self.CGColor);
            CGContextFillRect(context, rect);
            let image = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            return image
        } else {
            UIGraphicsEndImageContext()
            return nil
        }
    }
    
    public func darker(value: CGFloat = 0.2) -> UIColor
    {
        let r = max(self.components.red - value, 0)
        let g = max(self.components.green - value, 0)
        let b = max(self.components.blue - value, 0)
        return UIColor(colorLiteralRed: Float(r),
            green: Float(g),
            blue: Float(b),
            alpha: Float(self.components.alpha)
        )
    }

    public func brighter(value: CGFloat = 0.2) -> UIColor
    {
        let r = min(self.components.red + value, 1)
        let g = min(self.components.green + value, 1)
        let b = min(self.components.blue + value, 1)
        return UIColor(colorLiteralRed: Float(r),
            green: Float(g),
            blue: Float(b),
            alpha: Float(self.components.alpha)
        )
    }

}