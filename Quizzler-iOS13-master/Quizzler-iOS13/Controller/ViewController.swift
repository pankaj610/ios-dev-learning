//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progress: UIProgressView!
    var quizStorage = QuizStorage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateQuestionUI();
    }

    @IBAction func answerQuestion(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        let isCorrect = quizStorage.checkAnswer(userAnswer: userAnswer)
     
        if(isCorrect) {
            sender.backgroundColor = .green
        } else {
            sender.backgroundColor = .red        }
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateQuestionUI), userInfo: nil, repeats: false)
        quizStorage.incrementQuestion()
        
    }
    
    @objc func updateQuestionUI() {
        questionLabel.text = quizStorage.getQuestion().question
        button1.setTitle(quizStorage.getQuestion().options[0], for: .normal)
        button2.setTitle(quizStorage.getQuestion().options[1], for: .normal)
        button1.backgroundColor = .clear
        button2.backgroundColor = .clear
        progress.progress = quizStorage.getProgress()
    }
    
}

