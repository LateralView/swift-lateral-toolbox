//
//  UIViewController.swift
//  Pods
//
//  Created by Leandro Tami on 1/27/16.
//
//

import Foundation
import UIKit

extension UIViewController
{
 
    func alert(
        title: String = "",
        message: String,
        completion: (() -> ())? = nil
        )
    {
        let alert = UIAlertController(title: title,
            message: message,
            preferredStyle: UIAlertControllerStyle.Alert
        )
        
        alert.addAction(UIAlertAction(
            title: NSLocalizedString("OK", comment:""),
            style: .Default,
            handler: { (action) -> Void in
                completion?()
            }
            )
        )
        
        self.presentViewController(alert, animated: true, completion: nil)
    }    
    
}