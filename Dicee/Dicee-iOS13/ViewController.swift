//
//  ViewController.swift
//  Dicee-iOS13
//
//  Created by Angela Yu on 11/06/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var dice1: UIImageView!
    @IBOutlet weak var dice2: UIImageView!
    @IBOutlet weak var rollBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        dice1.image = UIImage(named: "asdf")
      
    }
    var rolledIndexLeft = 0;
    var rolledIndexRight = 3;
    @IBAction func rollDice(_ sender: UIButton) {
        let arr = [UIImage(named: "DiceOne"), UIImage(named: "DiceTwo"), UIImage(named: "DiceThree"), UIImage(named: "DiceFour"), UIImage(named: "DiceFive"), UIImage(named: "DiceSix")]
        rolledIndexLeft += 1
        rolledIndexRight += 1
        dice1.image = arr[Int.random(in: 0...5)]
        dice2.image = arr[Int.random(in: 0...5)]
    }
    
}
