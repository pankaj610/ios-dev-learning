//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var splitNumberLabel: UILabel!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var stepperLabel: UILabel!
    var tipSelected = 0.1
    var numberOfPeople = 2
    var billAmount = 0.0;
    var finalResult = "0.0";
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func stepperPressed(_ sender: UIStepper) {
        stepperLabel.text = String(format: "%.0f", sender.value)
        numberOfPeople = Int(sender.value)
    }
    
    @IBAction func tipChanged(_ sender: UIButton) {
        let percentage = sender.currentTitle!
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        switch(percentage) {
            case "0%":
                zeroPctButton.isSelected = true;
                tipSelected = 0.0
                break;
            case "10%":
                tenPctButton.isSelected = true;
                tipSelected = 0.1
                break;
            case "20%":
                twentyPctButton.isSelected = true;
                tipSelected = 0.2
                break;
        default:
            break
        }
       
    }
    
    @IBAction func calculatePressed(_ sender: Any) {
        let bill = billTextField.text!
        if bill != "" {
            billAmount = Double(bill)!
            billAmount = billAmount * (1 + tipSelected)
            finalResult = String(format: "%.2f", billAmount / Double(numberOfPeople))
            print(finalResult)
        }
        self.performSegue(withIdentifier: "goToResults", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResults" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.result = finalResult
            destinationVC.tip = Int(tipSelected * 100)
            destinationVC.split = numberOfPeople
        }
    }
    
}

