//
//  calculatorTests.swift
//  calculatorTests
//
//  Created by Zack Schreur on 5/19/19.
//  Copyright © 2019 Zack Schreur. All rights reserved.
//

import XCTest
@testable import calculator

class calculatorTests: XCTestCase {
    var calculator:Calculator = Calculator()
    let left:Int = 43
    let right:Int = 12
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        calculator.reset()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func setNumber(val:Int) {
        let val_s:String = String(val)
        for digit in val_s {
            calculator.pressDigit(digit: Int(String(digit))!)
        }
    }
    
    func testInitialDispay() {
        XCTAssertEqual("0", calculator.getDisplay())
    }

    func testAddDigit() {
        let output:String = "1937201372"
        for digit in output {
            calculator.pressDigit(digit: Int(String(digit))!)
        }
        
        XCTAssert(output == calculator.getDisplay())
    }
    
    func testAddTwoNumbers() {
        setNumber(val: left)
        calculator.pressOperation(operation: .add)
        setNumber(val: right)
        calculator.equals()
        XCTAssert(String(left + right) == calculator.getDisplay())
    }
    
    func testMultiplyTwoNumbers() {
        setNumber(val: left)
        calculator.pressOperation(operation: .multiply)
        setNumber(val: right)
        calculator.equals()
        XCTAssert(String(left * right) == calculator.getDisplay())
    }
    
    func testSubtractTwoNumbers() {
        setNumber(val: left)
        calculator.pressOperation(operation: .subtract)
        setNumber(val: right)
        calculator.equals()
        XCTAssert(String(left - right) == calculator.getDisplay())
    }
    
    func testDivideTwoNumbers() {
        setNumber(val: left)
        calculator.pressOperation(operation: .divide)
        setNumber(val: right)
        calculator.equals()
        XCTAssert(String(left / right) == calculator.getDisplay())
    }

}
