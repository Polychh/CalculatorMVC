//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    private var isFinishedTypingNumber: Bool = true // this variable accsees only in this class
    
    private var displayValue: Double{
        get{
            guard let number = Double(displayLabel.text!) else {
                fatalError("Cannot conver display label text to a Double")
            }
            return number
        }
        set{
            displayLabel.text = String(newValue) // change when we update displayLabel.text with newValue of displayValue
        }
    }
    
    private var calculator = CalculatorLogic() 

    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        //What should happen when a non-number button is pressed
        
        isFinishedTypingNumber = true // can add a new number after some calcButtonPressed
        
        calculator.setNumber(displayValue) // we use gettter of displayValue
        
        if let calcMethod = sender.currentTitle {
            
            if let result = calculator.calculate(symbol: calcMethod) {
                displayValue = result // work setter property of displayValue
            }
        }
    
    }
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        //What should happen when a number is entered into the keypad
      
        if let numValue = sender.currentTitle{
            
            if isFinishedTypingNumber == true{
                displayLabel.text = numValue
                isFinishedTypingNumber = false
            }else{
                
                if numValue == "."{
                    
                    let isInt = floor(displayValue) == displayValue // rounded and compare for displayValue we use getter
                    
                    if !isInt { // if isInt = false
                        return // we do not continue appending the current numValue which is "." to the display
                    }
                }
                displayLabel.text = displayLabel.text! + numValue
            }
        }
    }
}

