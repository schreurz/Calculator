//
//  Calculator.swift
//  calculator
//
//  Created by Zack Schreur on 5/19/19.
//  Copyright © 2019 Zack Schreur. All rights reserved.
//

import Foundation

struct Calculator {
    func calculate(left:NSInteger, right:NSInteger, operation:String) -> NSInteger {
        var res:NSInteger = 0
        
        switch operation {
        case "+":
            res = left + right
            break
        case "−":
            res = left - right
            break
        case "×":
            res = left * right
            break
        case "÷":
            res = left / right
            break
        default:
            break
        }
        
        return res
    }
}
