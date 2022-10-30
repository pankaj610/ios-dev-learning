//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var timerLabel: UILabel!
    private var timeObj = Timer()
    @IBOutlet weak var timer: UILabel!
    private var timeLeft = 0
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBAction func buttonClicked(_ sender: UIButton) {
        timeLeft = 30
        timeObj.invalidate()
        timeObj = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        if self.timeLeft > 0 {
            timeLeft -= 1;
            print("\(timeLeft) Time Left")
            timer.text = "\(timeLeft)"
            progressBar.progress = Float(30-timeLeft) / 30;
        } else {
            timeObj.invalidate()
        }
       
    }
    
}
