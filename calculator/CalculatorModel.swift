//
//  CalculatorModel.swift
//  calculator
//
//  Created by 1 on 2022/05/05.
//

import Foundation
class CalculatorModel {
    //저장하는구간 계산기 디스플레이 저장후 연산
    private var accmulator : Double = 0.0
    private var lastOperation : String?

    func setOperand(operand: Double){
        if lastOperation == "+"{
            lastOperation = nil
            accmulator = accmulator + operand
        } else {
            accmulator = operand
        }
    }
    
    func performOperation(symbol: String) {
        switch symbol{
        case "π":
            accmulator = Double.pi
        case "√":
            accmulator = sqrt(accmulator)
        case "+":
            lastOperation = symbol
            
        default:
            break
        }
    }

    var result: Double {
        get {
            return accmulator
        }
    }
}

