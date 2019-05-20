//
//  ViewController.swift
//  calculator
//
//  Created by Zack Schreur on 5/19/19.
//  Copyright © 2019 Zack Schreur. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    @IBOutlet weak var outputField: NSTextField!
    var calculator:Calculator = Calculator()
    
    func addDigit(digit:Int) {
        calculator.pressDigit(digit: digit)
        outputField.stringValue = calculator.getDisplay()
    }
    
    func setOperation(op:MathOperation) {
        calculator.pressOperation(operation: op)
        outputField.stringValue = calculator.getDisplay()
    }
    
    func updateDisplay() {
        outputField.stringValue = calculator.getDisplay()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        outputField.integerValue = 0
        outputField.isEditable = false
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    // IBActions
    @IBAction func equalsPressed(_ sender: Any) {
        calculator.equals()
        updateDisplay()
    }
    @IBAction func clearPressed(_ sender: Any) {
        calculator.reset()
        updateDisplay()
    }
    @IBAction func zeroPressed(_ sender: Any) {
        addDigit(digit: 0)
    }
    @IBAction func onePressed(_ sender: Any) {
        addDigit(digit: 1)
    }
    @IBAction func twoPressed(_ sender: Any) {
        addDigit(digit: 2)
    }
    @IBAction func threePressed(_ sender: Any) {
        addDigit(digit: 3)
    }
    @IBAction func fourPressed(_ sender: Any) {
        addDigit(digit: 4)
    }
    @IBAction func fivePressed(_ sender: Any) {
        addDigit(digit: 5)
    }
    @IBAction func sixPressed(_ sender: Any) {
        addDigit(digit: 6)
    }
    @IBAction func sevenPressed(_ sender: Any) {
        addDigit(digit: 7)
    }
    @IBAction func eightPressed(_ sender: Any) {
        addDigit(digit: 8)
    }
    @IBAction func ninePressed(_ sender: Any) {
        addDigit(digit: 9)
    }
    @IBAction func plusPressed(_ sender: Any) {
        setOperation(op: .add)
    }
    @IBAction func minusPressed(_ sender: Any) {
        setOperation(op: .subtract)
    }
    @IBAction func multiplyPressed(_ sender: Any) {
        setOperation(op: .multiply)
    }
    @IBAction func dividePressed(_ sender: Any) {
        setOperation(op: .divide)
    }
}

