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
            self.updateValues()
        }
    }
    
    public var minValue        : Double = 0 {
        didSet {
            self.updateValues()
        }
    }
    
    public var maxValue        : Double = 1 {
        didSet {
            self.updateValues()
        }
    }
    
    public var lineWidth       : Double = 3 {
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    public var traceColor       : UIColor = UIColor.grayColor() {
        didSet {
            self.setNeedsDisplay()
        }
    }

    public var lineColor       : UIColor = UIColor.blackColor() {
        didSet {
            self.setNeedsDisplay()
        }
    }

    override public func drawRect(rect: CGRect)
    {
        let center = CGPointMake(rect.size.width / 2, rect.size.height / 2)
        let startAngle : CGFloat = CGFloat(M_PI * 1.5)
        let endAngle : CGFloat = CGFloat(startAngle) + CGFloat(M_PI * 2)
        let percent = CGFloat((progressValue - minValue) / (maxValue - minValue))
        
        // trace
        let tracePath = UIBezierPath()
        tracePath.lineWidth = CGFloat(self.lineWidth)

        tracePath.addArcWithCenter(center,
            radius: (rect.size.width / 2) - tracePath.lineWidth,
            startAngle: startAngle,
            endAngle: endAngle,
            clockwise: true
        )
        
        self.traceColor.setStroke()
        tracePath.stroke()

        // line
        let linePath = UIBezierPath()
        linePath.lineWidth = CGFloat(self.lineWidth)

        linePath.addArcWithCenter(center,
            radius: (rect.size.width / 2) - linePath.lineWidth,
            startAngle: startAngle,
            endAngle: (endAngle - startAngle) * percent + startAngle,
            clockwise: true
        )
        
        self.lineColor.setStroke()
        linePath.stroke()
    }
    
    private func updateValues()
    {
        if (progressValue > maxValue) {
            progressValue = maxValue
        }
        
        if (progressValue < minValue) {
            progressValue = minValue
        }
        
        self.setNeedsDisplay()
    }
    
}