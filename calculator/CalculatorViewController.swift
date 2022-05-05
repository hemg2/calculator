//
//  ViewController.swift
//  calculator
//
//  Created by 1 on 2022/05/03.
//

import UIKit

class CalculatorViewController: UIViewController {
    // MARK: -IBOutlet
    @IBOutlet private weak var display: UILabel!
    private var model : CalculatorModel = CalculatorModel()
    private var isTypingDigit: Bool = false
    private var displayValue: Double {
        get {
            guard let text = display.text else { return 0 }
            return  Double(text) ?? 0
            // ?? 확인하기
        }
        set {
            display.text = "\(newValue)"
        }
    }
    // MARK: -IBAction
    @IBAction private func performOperation(_ sender: UIButton) {
        
        guard let operation = sender.titleLabel?.text else { return }
        //연산 하기전의 숫자를 저장하는 구간
        model.setOperand(operand: displayValue)
        model.performOperation(symbol: operation)
        displayValue = model.result
        isTypingDigit = false
        
        //          //guard 를쓰는건 옵셔널이 나와서
        //            guard let text = display.text,
        //                    let double = Double (text)  else {return}
        //            // 텍스트 문자여서 실수인 더블 을 바꾼다 그래서 이렇게 처리한다 "(\sqrt(double))"
        //            display.text = "\(sqrt(double))"
        
        

    }
    
    @IBAction private func touchDigit(_ sender: UIButton) {
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
