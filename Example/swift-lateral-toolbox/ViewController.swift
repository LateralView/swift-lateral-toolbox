//
//  ViewController.swift
//  swift-lateral-toolbox
//
//  Created by Leandro Tami on 01/18/2016.
//  Copyright (c) 2016 Leandro Tami. All rights reserved.
//

import UIKit
import swift_lateral_toolbox

class ViewController: UIViewController {

    @IBOutlet weak var progressIndicator: UILabel!
    @IBOutlet weak var radialProgressView: LvRadialProgressView!
    
    private var timer: NSTimer!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        radialProgressView.minValue = 0
        radialProgressView.maxValue = 100
        radialProgressView.progressValue = 0
        timer = NSTimer.scheduledTimerWithTimeInterval(0.2,
            target: self,
            selector: "tick",
            userInfo: nil,
            repeats: true
        )
                
    }
    
    func tick()
    {
        let value = radialProgressView.progressValue + 1
        radialProgressView.progressValue = value
        progressIndicator.text = "\(value)%"
    }
    

}

