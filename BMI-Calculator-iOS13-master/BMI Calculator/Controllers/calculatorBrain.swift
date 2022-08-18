//
//  calculatorBrain.swift
//  BMI Calculator
//
//  Created by Pankaj on 19/08/22.
//  Copyright © 2022 Angela Yu. All rights reserved.
//

import Foundation
import UIKit

struct CalculatorBrain {
    var bmi: BMI?
    
    mutating func calculateBmi(height: Float, weight: Float) {
        let bmiValue = weight / (height * height)
 
        if(bmiValue < 18.5) {
            bmi = BMI(value: bmiValue, advise: "Eat more pies!", color: .blue)
        } else if(bmiValue < 24.9) {
            bmi = BMI(value: bmiValue, advise: "Fit as a fiddle!", color: .green)
        } else {
            bmi = BMI(value: bmiValue, advise: "Eat less pies!", color: .red)
        }
    }
    
    func getBmiValue() -> String {
        return String(format: "%.2f", bmi?.value ?? 0.0)
    }
    
    func getAdvise() -> String {
        return bmi?.advise ?? "No advice"
    }
    
    func getColor() -> UIColor {
        return bmi?.color ?? .white
    }
}
