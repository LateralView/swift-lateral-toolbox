//
//  LvRadialProgressView.swift
//  Pods
//
//  Created by Leandro Tami on 2/13/16.
//
//

import UIKit

public class LvRadialProgressView: UIView
{
    
    public var progressValue   : Double = 0.5 {
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    public var minValue        : Double = 0 {
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    public var maxValue        : Double = 1 {
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    public var lineWidth       : Double = 3 {
        didSet {
            self.setNeedsDisplay()
        }
    }
    
//    var fillColor       : UIColor = UIColor.blackColor()

    override public func drawRect(rect: CGRect)
    {
        let center = CGPointMake(rect.size.width / 2, rect.size.height / 2)
        let startAngle : CGFloat = CGFloat(M_PI * 1.5)
        let endAngle : CGFloat = CGFloat(startAngle) + CGFloat(M_PI * 2)
        let percent = CGFloat((progressValue - minValue) / (maxValue - minValue))
        
        let path = UIBezierPath()
        path.lineWidth = CGFloat(self.lineWidth)

        path.addArcWithCenter(center,
            radius: (rect.size.width / 2) - path.lineWidth,
            startAngle: startAngle,
            endAngle: (endAngle - startAngle) * percent + startAngle,
            clockwise: true
        )
        
        UIColor.redColor().setStroke()
        UIColor.greenColor().setFill()
        path.stroke()
    }
    
}