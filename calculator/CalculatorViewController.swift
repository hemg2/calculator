//
//  ViewController.swift
//  calculator
//
//  Created by 1 on 2022/05/03.
//

import UIKit

class CalculatorViewController: UIViewController {
    // MARK: -IBOutlet
    @IBOutlet weak var display: UILabel!
    var isTypingDigit: Bool = false
    
    // MARK: -IBAction
    @IBAction func performOperation(_ sender: UIButton) {
        
        guard let operation = sender.titleLabel?.text else { return }
        
        if operation == "π" {
            display.text = String(Double.pi)
        }
        isTypingDigit = false
    }
    
    @IBAction func touchDigit(_ sender: UIButton) {
        guard let digit = sender.titleLabel?.text,
              let textCutrrentlyInDisplay = display.text
        else { return }
        
        if isTypingDigit{
            display.text = textCutrrentlyInDisplay + digit
        } else {
            display.text = digit
        }
        isTypingDigit = true
    }
}
