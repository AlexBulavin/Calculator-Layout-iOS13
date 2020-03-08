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
    var currentValue = 0.00
    var memory1Value = 0.00
    var memory2Value = 0.00
    var oper = "0"
    var expectation = 1 //0 если нажата кнопка = и 1 в остальных случаях
    var decimal = 0 //0 если при наборе числа не была нажата точка и 1 если была нажата
    var decimalMemo = 0 //0 если при наборе числа не была нажата точка и 1 если была нажата
    var decimalRange = 1.00 //счетчик разрядности числа
    var addedOrSubtractedValue = 0.00
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayLable.text = String (0)
    }
    @IBOutlet weak var displayLable: UILabel!
    @IBAction func buttonClicked(_ sender: UIButton) {
        
        //displayLable.text = "\(sender.currentTitle!)"
        let clickedButton = sender.currentTitle!
        
        switch clickedButton {
        case "0", "1", "2", "3", "4", "5", "6", "7", "8", "9":
            if String(currentValue).count > 12 {displayLable.font = UIFont.systemFont(ofSize: 30.0)} //Проверяем количество символов в строке currentValue. Если больше 12, уменьшаем размер шрифта
            if decimal == 0 {currentValue = currentValue * 10 + Double(clickedButton)!
                currentDisplay = String(Int(currentValue))
                displayLable.text = currentDisplay
                addedOrSubtractedValue = currentValue
            }
            else
            { decimalRange = decimalRange/10
                currentValue = currentValue + Double(clickedButton)! * decimalRange
                currentDisplay = String(currentValue)
                displayLable.text = currentDisplay
                addedOrSubtractedValue = currentValue
            }
            
        case "+", "-", "×", "÷", "%" :
            oper = clickedButton
            memory1Value = currentValue
            currentValue = 0
            decimalMemo = decimal
            decimal = 0
            decimalRange = 1.00
            currentDisplay = String(Int(currentValue))
            displayLable.text = currentDisplay
            //addedOrSubtractedValue = currentValue
            
        case "+/-":
            currentValue = currentValue * -1
            if String(currentValue).count > 12 {displayLable.font = UIFont.systemFont(ofSize: 30.0)}
            if decimal == 1 {
                currentDisplay = String(currentValue)}
            else {currentDisplay = String(Int(currentValue))}
            displayLable.text = currentDisplay
            
        case "AC":
            if String(currentValue).count > 11 {displayLable.font = UIFont.systemFont(ofSize: 50.0)}
            currentValue = 0
            decimal = 0
            decimalRange = 1.00
            addedOrSubtractedValue = 0.00
            memory1Value = 0.00
            currentDisplay = String(Int(currentValue))
            displayLable.text = currentDisplay
            
        case "=":
            if String(currentValue).count > 11 {displayLable.font = UIFont.systemFont(ofSize: 30.0)}
            switch oper {
            case "+":
                currentValue = memory1Value + addedOrSubtractedValue
                if decimal == 1 || decimalMemo == 1 {
                    currentDisplay = String(currentValue)}
                else {currentDisplay = String(Int(currentValue))}
                displayLable.text = currentDisplay
                expectation = 0
                if decimalMemo == 1 {decimal = decimalMemo}
                memory1Value = currentValue
            case "-":
                currentValue = memory1Value - addedOrSubtractedValue
                if decimal == 1 || decimalMemo == 1 {
                    currentDisplay = String(currentValue)}
                else {currentDisplay = String(Int(currentValue))}
                displayLable.text = currentDisplay
                expectation = 0
                if decimalMemo == 1 {decimal = decimalMemo}
                memory1Value = currentValue
            case "×":
                currentValue = addedOrSubtractedValue * memory1Value
                if decimal == 1 || decimalMemo == 1 {
                    currentDisplay = String(currentValue)}
                else {currentDisplay = String(Int(currentValue))}
                displayLable.text = currentDisplay
                expectation = 0
                if decimalMemo == 1 {decimal = decimalMemo}
                memory1Value = currentValue
            case "÷":
                currentValue = memory1Value / addedOrSubtractedValue
                if currentValue > (memory1Value).truncatingRemainder(dividingBy: addedOrSubtractedValue)
                { decimal = 1}
                if decimal == 1 || decimalMemo == 1 {
                    currentDisplay = String(currentValue)}
                else {currentDisplay = String(Int(currentValue))}
                displayLable.text = currentDisplay
                expectation = 0
                if decimalMemo == 1 {decimal = decimalMemo}
                memory1Value = currentValue
            case "%":
                currentValue = (memory1Value*100 / addedOrSubtractedValue)
                if decimal == 1 || decimalMemo == 1 {
                    currentDisplay = String(currentValue)}
                else {currentDisplay = String(Int(currentValue))}
                displayLable.text = currentDisplay
                expectation = 0
                if decimalMemo == 1 {decimal = decimalMemo}
                memory1Value = currentValue
            default: break}
            
            
        case ".":
            if decimal == 0 {
                decimal = 1
                currentDisplay = String(Int(currentValue)) + "."
                displayLable.text = currentDisplay
            }
            
        default: break
            
        }
        
    }
    
}

