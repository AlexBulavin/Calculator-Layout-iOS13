//
//  ViewController.swift
//  Calculator Layout iOS13
//
//  Created by Angela Yu on 01/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentDisplay = "0"
    var currentValue = 0
    var memory1Value = 0
    var memory2Value = 0
    var oper = "0"
    var expectation = 1 //0 если нажата кнопка = и 1 в остальных случаях
    var decemal = 0 //0 если число целое и 1 если десятичное
    
        override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var displayLable: UILabel!
    @IBAction func buttonClicked(_ sender: UIButton) {
        
        //displayLable.text = "\(sender.currentTitle!)"
        let clickedButton = sender.currentTitle!
        
        switch clickedButton {
        case "0", "1", "2", "3", "4", "5", "6", "7", "8", "9":
            if expectation == 0 {
            currentValue = Int(clickedButton)!
            currentDisplay = String(currentValue)
                displayLable.text = currentDisplay
                expectation = 1
            }
            else {
                
            currentValue = Int(currentDisplay + clickedButton)!
            currentDisplay = String(currentValue)
                displayLable.text = currentDisplay
            }
            
        case "+", "-", "×", "÷", "%" :
            oper = clickedButton
            memory1Value = currentValue
            currentValue = 0
            currentDisplay = String(currentValue) + clickedButton
            displayLable.text = currentDisplay
                       
        case "+/-":
            currentValue = currentValue * -1
            currentDisplay = String(currentValue)
            displayLable.text = currentDisplay
            
        case "AC":
            currentValue = 0
            currentDisplay = String(currentValue)
            displayLable.text = currentDisplay
            
        case "=":
            switch oper {
            case "+":
                currentValue = currentValue + memory1Value
                currentDisplay = String(currentValue)
                displayLable.text = currentDisplay
                expectation = 0
            case "-":
                currentValue = memory1Value - currentValue
                currentDisplay = String(currentValue)
                displayLable.text = currentDisplay
                expectation = 0
            case "×":
                currentValue = currentValue * memory1Value
                currentDisplay = String(currentValue)
                displayLable.text = currentDisplay
                expectation = 0
            case "÷":
                currentValue = memory1Value / currentValue
                currentDisplay = String(currentValue)
                displayLable.text = currentDisplay
                expectation = 0
            case "%":
                currentValue = (memory1Value*100 / currentValue)
                currentDisplay = String(currentValue)
                displayLable.text = currentDisplay
                expectation = 0
                
            default: break}
            
//        case "."
//                currentValue = (memory1Value*100 / currentValue)
                currentDisplay = String(currentValue) + "."
                displayLable.text = currentDisplay
                expectation = 0
                decemal = 1
            
        default: break

        }
        
    }
    
}

