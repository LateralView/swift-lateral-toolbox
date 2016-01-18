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
    
}