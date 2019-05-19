//
//  ViewController.swift
//  calculator
//
//  Created by Zack Schreur on 5/19/19.
//  Copyright © 2019 Zack Schreur. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
   
    @IBOutlet weak var leftValue: NSTextField!
    @IBOutlet weak var rightValue: NSTextFieldCell!
    @IBOutlet weak var operation: NSPopUpButton!
    @IBOutlet weak var resultValue: NSTextField!
    
    let calculator = Calculator()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    @IBAction func calculatePressed(_ sender: NSButton) {
        let res:NSInteger = calculator.calculate(
            left: leftValue.integerValue, right: rightValue.integerValue, operation: operation.selectedItem?.title ?? "")
        
        resultValue.integerValue = res
    }
}

