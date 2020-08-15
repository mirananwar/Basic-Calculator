//
//  CalculatorLogic.swift
//  Basic-Calculator
//
//  Created by Mirana Abrar Anwar on 8/15/20.
//  Copyright © 2020 Mirana Anwar. All rights reserved.
//

import Foundation

struct CalculatorLogic {
    
    var isFinishedTypingNumber: Bool = true
    private var number: Double?
    private var intermediateCalculation : (n1: Double, calcMethod: String)?
    mutating func setNumber(_ number: Double){
        self.number = number
    }
    
    mutating func buttonPressLogic(symbol: String) -> Double? {
        if let n = number {
            switch symbol {
            case "+/-" :
                return n * -1
            case "%" :
                return n / 100
            case "AC" :
                return 0
            case "=" :
                return performTwoNumCalculation(n2:n)
            default:
                intermediateCalculation = (n1:n, calcMethod: symbol)

            }
        }
        return nil
        }


    private func performTwoNumCalculation(n2: Double) -> Double? {
        if let n1 = intermediateCalculation?.n1, let operation = intermediateCalculation?.calcMethod {
            switch operation {
            case "+":
                return n1 + n2
            case "×" :
                return n1 * n2
            case "-":
                return n1 - n2
            case "÷" :
                return n1 / n2
            default:
                fatalError("operation passed in doesn't match any of the cases")
            }
        }
        return nil
    }

}
