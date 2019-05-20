//
//  Calculator.swift
//  calculator
//
//  Created by Zack Schreur on 5/19/19.
//  Copyright © 2019 Zack Schreur. All rights reserved.
//

import Foundation

enum CalculatorState {
    case digitPressed
    case operationPressed
    case equalsPressed
}

class Calculator {
    var left:Int
    var right:Int
    var operation:MathOperation
    var display:String
    
    private var state:CalculatorState {
        didSet {
            updateDisplay()
        }
    }
    
    init() {
        left = 0
        right = 0
        operation = .add
        state = .digitPressed
        display = "0"
    }
    
    func reset() {
        left = 0
        right = 0
        operation = .add
        state = .digitPressed
    }
    
    func pressDigit(digit:Int) {
        if state == .equalsPressed {
            reset()
        }
        right *= 10
        right += digit
        state = .digitPressed
    }
    
    func pressOperation(operation:MathOperation) {
        if state == .digitPressed {
            left = self.calculate()
        }
        right = 0
        self.operation = operation
        state = .operationPressed
    }
    
    func equals() {
        left = self.calculate()
        right = 0
        state = .equalsPressed
    }
    
    private func calculate() -> Int {
        var res:Int
        switch operation {
        case .add:
            res = left + right
        case .subtract:
            res = left - right
        case .multiply:
            res = left * right
        case .divide:
            res = left / right
        }
        
        return res
    }
    
    func updateDisplay() {
        switch state {
        case .digitPressed:
            display = String(right)
            break
        case .equalsPressed:
            display = String(left)
            break
        case .operationPressed:
            display = String(left)
            break
        }
    }
    
    func getDisplay() -> String {
        return display
    }
}
