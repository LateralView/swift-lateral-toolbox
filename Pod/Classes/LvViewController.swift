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
    
    public var hidesKeyboardOnTap: Bool = false {
        didSet {
            
            guard let tapGestureRecognizer = self.tapGestureRecognizer else {
                return
            }
            
            if hidesKeyboardOnTap {
                self.view.addGestureRecognizer(tapGestureRecognizer)
            } else {
                self.view.removeGestureRecognizer(tapGestureRecognizer)
            }
            
        }
    }
    
    private var tapGestureRecognizer: UITapGestureRecognizer?
    
    // MARK: Overriden methods

    override public func viewDidLoad() {
        super.viewDidLoad()
        tapGestureRecognizer = UITapGestureRecognizer(target: self.view, action: Selector("endEditing:"))
    }
    
    override public func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.startObservingKeyboardEvents()
    }
    
    override public func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        self.stopObservingKeyboardEvents()
    }
    
    // MARK: Public methods

    func keyboardWillShowNotification(notification: NSNotification) {
        updateBottomLayoutConstraintWithNotification(notification)
    }
    
    func keyboardWillHideNotification(notification: NSNotification) {
        updateBottomLayoutConstraintWithNotification(notification)
    }
    
    
    // MARK: Private methods
    
    private func startObservingKeyboardEvents() {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShowNotification:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHideNotification:", name: UIKeyboardWillHideNotification, object: nil)
    }
    
    private func stopObservingKeyboardEvents() {
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIKeyboardWillHideNotification, object: nil)
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