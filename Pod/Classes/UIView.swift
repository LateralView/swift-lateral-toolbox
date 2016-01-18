//
//  UIView.swift
//  Pods
//
//  Created by Leandro Tami on 1/18/16.
//
//

import UIKit

extension UIView
{
    
    public func snapshot() -> UIImage?
    {
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, self.opaque, 0.0);
        if let context = UIGraphicsGetCurrentContext() {
            self.layer.renderInContext(context)
            let img = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            return img
        } else {
            UIGraphicsEndImageContext()
            return nil
        }
    }
    
}