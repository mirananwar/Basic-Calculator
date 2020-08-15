//
//  ViewController.swift
//  Basic-Calculator
//
//  Created by Mirana Abrar Anwar on 8/15/20.
//  Copyright © 2020 Mirana Anwar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    private var isFinishedTypingNumber: Bool = true
     var displayValue: Double {
        get {
            guard let number = Double(displayLabel.text!) else {
                fatalError("Can't conv the text to double")
            }
            return number
            
        }
        set {
            displayLabel.text = String(newValue)
        }
    }
    
    private var calcLogic = CalculatorLogic()
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        //What should happen when a non-number button is pressed
        isFinishedTypingNumber = true
        calcLogic.setNumber(displayValue)
               
               if let calcMethod = sender.currentTitle {
                   if let result = calcLogic.buttonPressLogic(symbol: calcMethod) {
                       displayValue = result
                   }
    }
    }

    
    @IBAction func numButtonPressed(_ sender: UIButton) {
//        What should happen when a number is entered into the keypad
        if let numValue =  sender.currentTitle {
            if isFinishedTypingNumber {
                displayLabel.text = numValue
                isFinishedTypingNumber = false
            } else {
                if numValue == "." {
                        let isInt = floor(displayValue) == displayValue
                    if !isInt {
                        // this just ends the function and no longer appends
                        return
                    }
                }
                displayLabel.text = displayLabel.text! + numValue
            }
        }
    }

}


