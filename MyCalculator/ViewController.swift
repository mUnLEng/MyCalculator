//
//  ViewController.swift
//  MyCalculator
//
//  Created by Samson Pang on 22/7/16.
//  Copyright © 2016 KProductions. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    enum Operations: String {
        case Add = "+"
        case Subtract = "-"
        case Multiply = "x"
        case Divide = "/"
        case Empty = ""
    }
    
    var runningNumber  = ""
    var leftHandSide = ""
    var rightHandSide = ""
    var result = ""
    var currentOperation = Operations.Empty

    @IBOutlet weak var displayLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func  numberPressed(sender: UIButton) {
        runningNumber += sender.currentTitle!
        displayLabel.text = runningNumber
    }
    @IBAction func clearPressed(sender: UIButton) {
        currentOperation = Operations.Empty
        runningNumber = ""
        result = ""
        leftHandSide = ""
        rightHandSide = ""
        displayLabel.text = "0"
    }
    @IBAction func addPressed(sender: UIButton) {
        performOperation(.Add)
    }
    @IBAction func subtractPressed(sender: UIButton) {
        performOperation(.Subtract)
    }
    @IBAction func multiplyPressed(sender: UIButton) {
        performOperation(.Multiply)
    }
    @IBAction func dividePressed(sender: UIButton) {
        performOperation(.Divide)
    }
    @IBAction func equalPressed(sender: UIButton) {
        performOperation(currentOperation)
    }
    func performOperation(operation: Operations) {
        if currentOperation != Operations.Empty {
            if runningNumber != "" {
                rightHandSide = runningNumber
                runningNumber = ""
                if currentOperation == Operations.Add {
                    result = "\(Double(leftHandSide)! + Double(rightHandSide)!)"
                } else if currentOperation == Operations.Subtract {
                    result = "\(Double(leftHandSide)! - Double(rightHandSide)!)"
                } else  if currentOperation == Operations.Multiply {
                    result = "\(Double(leftHandSide)! * Double(rightHandSide)!)"
                } else  if currentOperation == Operations.Divide {
                    result = "\(Double(leftHandSide)! / Double(rightHandSide)!)"
                }
                leftHandSide = result
                displayLabel.text = result
            }
            currentOperation = operation
        } else {
            leftHandSide = runningNumber
            runningNumber = ""
            currentOperation = operation
        }
    }
}