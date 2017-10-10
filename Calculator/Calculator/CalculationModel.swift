//
//  CalculationModel.swift
//  Calculator
//
//  Created by 孙启双 on 2017/10/10.
//  Copyright © 2017年 孙启双. All rights reserved.
//

import Foundation


class CalculationModel {
    

    
    private var resultFigures : Double = 0.0
    
    var operations: Dictionary<String,Operation> = [
        "π" : Operation.Constant(M_PI),
        "℮" : Operation.Constant(M_E),
        "√" : Operation.UnaryOperation(sqrt),
        "±" : Operation.UnaryOperation({-$0}),
        "+" : Operation.BinaryOperation({$0 + $1}),
        "−" : Operation.BinaryOperation({$0 - $1}),
        "×" : Operation.BinaryOperation({$0 * $1}),
        "÷" : Operation.BinaryOperation({$0 / $1}),
        "=" : Operation.Equals
    ]

    enum Operation{
        case Constant(Double)
        case UnaryOperation((Double) -> Double)
        case BinaryOperation((Double, Double) -> Double)
        case Equals
    }
    
    
    func setOperand(operand: Double){
        resultFigures = operand
        
    }
    
    struct pendingBinaryOperationInfo {
        var binaryFunction: (Double, Double) -> Double
        var firstOperand :Double
    }
    
    private var pending :pendingBinaryOperationInfo?
    
    func performOperatio(symbol: String)  {
        
        if let operation = operations[symbol] {
            switch operation {
            case .Constant(let value): resultFigures = value
            case .UnaryOperation(let function): resultFigures = function(resultFigures)
            case.BinaryOperation(let function):pending = pendingBinaryOperationInfo(binaryFunction: function, firstOperand: resultFigures)
                
            case.Equals:
                if pending != nil {
                    resultFigures = pending!.binaryFunction(pending!.firstOperand, resultFigures)
                    pending = nil
                }
                
                break
            }
            
        }
    }
    

    
    private func calculation(title:String) -> Double{
        
        
        return 0.0
    }
    
    
    var result : Double{
        get {
            return resultFigures
        }
    }
    
    
}
