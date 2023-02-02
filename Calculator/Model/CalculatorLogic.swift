//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by USER on 19.11.2022.
//  Copyright © 2022 London App Brewery. All rights reserved.
//

import Foundation


struct CalculatorLogic {
    
    private var number: Double? // for displayValue
    
    private var intermediateCalculation: (n1: Double, calcMethod: String)? // it is optional because can gave not values for this tuple when we initialize CalculatorLogic
    
    mutating func setNumber(_ number: Double){ // because number is private, this func can set value for number from other classes
        self.number = number
    }
    
    mutating func calculate(symbol: String) -> Double?{ // Double? and we can return nil
        
        if let n = number{ // to check validation nil or not (number is optional)
            switch symbol {
            case "+/-":
                return n * -1 // update displayLabel.text with new value
            case "%":
                return n / 100
            case "AC":
                return 0
            case "=":
                return performTwoNumCalculation(n2: n) // n2 = n because when user pressed = it is means that we already pressen on the second number
            default:
                intermediateCalculation = (n1: n, calcMethod: symbol)
            }
        }
        return nil
    }
    
    private func performTwoNumCalculation(n2: Double) -> Double? {
        
        if let n1 = intermediateCalculation?.n1, //  check it is nil o not because user can just pressed = without pressing som numbers
           let operation = intermediateCalculation?.calcMethod{  // if intermediateCalculation is not nil grab n1 out of it
            switch operation {
            case "+":
                return n1 + n2
            case "-":
                return n1 - n2
            case "×":
                return n1 * n2
            case "÷":
                return n1 / n2
            default:
                fatalError("Operation past in does not match any of the cases")
            }
        }
        return nil // if for example the first user pressed = without pressing numbers
    }
}
