//
//  UIImage.swift
//  Pods
//
//  Created by Leandro Tami on 1/18/16.
//
//

import UIKit

extension UIImage
{
    
    public func toBase64EncodedJPEG(quality: Float = 0.8) -> String?
    {
        if let imageData = UIImageJPEGRepresentation(self, CGFloat(quality) ) {
            let encodedData = imageData.base64EncodedDataWithOptions([.Encoding64CharacterLineLength])
            return String(data: encodedData, encoding: NSUTF8StringEncoding)
        } else {
            return nil
        }
    }

    public func toBase64EncodedPNG() -> String?
    {
        if let imageData = UIImagePNGRepresentation(self) {
            let encodedData = imageData.base64EncodedDataWithOptions([.Encoding64CharacterLineLength])
            return String(data: encodedData, encoding: NSUTF8StringEncoding)
        } else {
            return nil
        }
    }
    
}