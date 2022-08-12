//
//  QuizStorage.swift
//  Quizzler-iOS13
//
//  Created by Pankaj on 13/08/22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation
struct QuizStorage {
    let quiz = [
        Question(question: "4 + 2 = 6", answer: "True", options: ["True", "False"]),
        Question(question: "4 - 2 = ?", answer: "2", options: ["1", "2"]),
        Question(question: "6 - 6 = ?", answer: "0", options: ["0", "1"]),
        Question(question: "5 + 2 = 7.0", answer: "True", options: ["True", "False"]),
//        ["", "True", "False"],
//        ["", "1", "2"],
//        ["", "0", "-1"]
    ]
    var questionNumber = 0
    
     func checkAnswer(userAnswer: String) -> Bool {
        if(quiz[questionNumber].answer == userAnswer) {
            return true
        } else {
            return false
        }
        
    }
    
    mutating func incrementQuestion() {
        if(questionNumber == quiz.count - 1) {
            questionNumber = 0
        } else {
            questionNumber += 1
        }
    }
    
    func getQuestion() -> Question {
        return quiz[questionNumber]
    }
    
    func getProgress() -> Float {
        return Float(questionNumber+1) / Float(quiz.count)
    }
}
