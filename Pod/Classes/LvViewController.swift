//
//  LvViewController.swift
//  Pods
//
//  Created by Leandro Tami on 2/10/16.
//
//

import UIKit

public class LvViewController: UIViewController
{
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint?
    
    override public func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.startObservingKeyboardEvents()
    }
    
    override public func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        self.stopObservingKeyboardEvents()
    }
 
    private func startObservingKeyboardEvents() {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShowNotification:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHideNotification:", name: UIKeyboardWillHideNotification, object: nil)
    }
    
    private func stopObservingKeyboardEvents() {
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIKeyboardWillHideNotification, object: nil)
    }
    
    func keyboardWillShowNotification(notification: NSNotification) {
        updateBottomLayoutConstraintWithNotification(notification)
    }
    
    func keyboardWillHideNotification(notification: NSNotification) {
        updateBottomLayoutConstraintWithNotification(notification)
    }
    
    private func updateBottomLayoutConstraintWithNotification(notification: NSNotification)
    {
        if let constraint = self.bottomConstraint
        {
            let userInfo = notification.userInfo!
            let animationDuration = (userInfo[UIKeyboardAnimationDurationUserInfoKey] as! NSNumber).doubleValue
            let keyboardEndFrame = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue()
            let convertedKeyboardEndFrame = view.convertRect(keyboardEndFrame, fromView: view.window)
            let rawAnimationCurve = (notification.userInfo![UIKeyboardAnimationCurveUserInfoKey] as! NSNumber).unsignedIntValue << 16
            let animationCurve = UIViewAnimationOptions.init(rawValue: UInt(rawAnimationCurve))
            constraint.constant = CGRectGetMaxY(view.bounds) - CGRectGetMinY(convertedKeyboardEndFrame)
            
            UIView.animateWithDuration(animationDuration,
                delay: 0.0,
                options: [.BeginFromCurrentState, animationCurve],
                animations: {
                    self.view.layoutIfNeeded()
                },
                completion: nil)
        }
    }
    
}