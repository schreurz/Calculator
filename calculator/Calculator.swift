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
    private var left:Int
    private var right:Int
    private var operation:MathOperation
    private var state:CalculatorState
    
    init() {
        state = .digitPressed
        left = 0
        right = 0
        operation = .add
    }
    
    func reset() {
        state = .digitPressed
        left = 0
        right = 0
        operation = .add
    }
    
    func pressDigit(digit:Int) {
        if state == .equalsPressed {
            reset()
        }
        state = .digitPressed
        right *= 10
        right += digit
    }
    
    func pressOperation(operation:MathOperation) {
        if state == .digitPressed {
            left = self.calculate()
        }
        state = .operationPressed
        right = 0
        self.operation = operation
    }
    
    func equals() {
        state = .equalsPressed
        left = self.calculate()
        right = 0
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
    
    func getDisplay() -> String {
        var output:String
        switch state {
        case .digitPressed:
            output = String(right)
            break
        case .equalsPressed:
            output = String(left)
            break
        case .operationPressed:
            output = String(left)
            break
        }
        
        return output
    }
}
