//
//  ResultViewController.swift
//  BMI Calculator
//
//  Created by Pankaj on 19/08/22.
//  Copyright © 2022 Angela Yu. All rights reserved.
//

import Foundation
import UIKit

class ResultViewController: UIViewController {
    var bmiString: String?
    var advice: String?
    var color: UIColor?
    
    @IBOutlet weak var adviceLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    override func viewDidLoad() {
        resultLabel.text = bmiString
        adviceLabel.text = advice
        view.backgroundColor = color
    }
    
    @IBAction func recalculatePressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
