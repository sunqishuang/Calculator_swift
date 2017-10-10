//
//  ViewController.swift
//  Calculator
//
//  Created by 孙启双 on 2017/10/9.
//  Copyright © 2017年 孙启双. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var displayLabel: UILabel!
    

    
    private let model = CalculationModel()
    
    private var userIsInTheMiddleOfTyping = false
    
    let arr = ["0","1","2","3","4","5","6","7","8","9","AC"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        
    }

    
    var displayValue : Double {
        get {
            return Double(displayLabel.text!)!
        }
        
        set {
            displayLabel.text = String(newValue)
        }
    }
    
    
    //数字按钮
    @IBAction func buttonClick(_ sender: UIButton) {
        
        let title = sender.currentTitle!
        
        if userIsInTheMiddleOfTyping {
             let textCurrentlyInDisplay = displayLabel.text!
            displayLabel.text = textCurrentlyInDisplay + title
        }else{
            displayLabel.text = title;
        }
        
        userIsInTheMiddleOfTyping = true
    }
    
    //运算符按钮
    @IBAction func OperationClick(_ sender: UIButton) {

        if userIsInTheMiddleOfTyping {
            model.setOperand(operand: displayValue)
        }
        userIsInTheMiddleOfTyping = false

        
        if let mathMaticalSymbol = sender.currentTitle{
            model.performOperatio(symbol: mathMaticalSymbol)
        }
        displayValue = model.result
        
    }
    
    //置0
    @IBAction func ACFunction(_ sender: UIButton) {
        
        displayValue = 0
        userIsInTheMiddleOfTyping = false
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

