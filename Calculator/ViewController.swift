//
//  ViewController.swift
//  Calculator
//
//  Created by Александр on 02.12.2021.
//

import UIKit

enum signes {
    case div
    case multi
    case plus
    case minus
    case equal
    case percent
    case plusMinus
    case none
}

var expressionString: String = ""
var firstNumber: String = "0"
var secondNumber: String = ""
var sign: signes = .none


// Функция кнопок, если вызывается в какой-то другой операции, то возвращает результат как firstNumber
func equalfunc(_ sign: signes) -> String{
    let firstNumberInt = Int(firstNumber)
    let secondNumberInt = Int(secondNumber)
    var result = 0
    switch sign {
    case .div:
        return (secondNumberInt! != 0 ? String(firstNumberInt! / secondNumberInt!) : "Ошибка")
    case .multi:
        return String(secondNumberInt! * firstNumberInt!)
    case .plus:
        return String(firstNumberInt! + secondNumberInt!)
    case .minus:
        return String(firstNumberInt! - secondNumberInt!)
    case .equal:
        return String(firstNumberInt!)
    case .percent:
        return String(firstNumberInt! * 1)
    case .plusMinus:
        return String(firstNumberInt! * -1)
    case .none:
        result = firstNumberInt! / secondNumberInt!
    }
    
    return ""
}

// Распределяем из общего потока символов первое и второе число, а также операцию
func workSpace(_ signFromButton: signes) -> String{
    if sign == .none {
        sign = signFromButton
    }
    if firstNumber.isEmpty || firstNumber == "0"{
        firstNumber = expressionString
        expressionString = ""
    }
    else if secondNumber.isEmpty {
        if expressionString.isEmpty {
            secondNumber = firstNumber
        } else {
            secondNumber = expressionString
        }
        expressionString = ""
        // Итоговый результат вновь обозначаем как первое число
        firstNumber = equalfunc(sign)
        // Второе число обнуляем
        secondNumber = ""
        sign = signFromButton
        return firstNumber
    }
    return ""
}

class ViewController: UIViewController {
    
    @IBOutlet weak var divButton2: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func zeroButton(_ sender: Any) {
        checkLabel()
        addToLabel("0")
        expressionString+="0"
    }
    @IBAction func oneButton(_ sender: Any) {
        checkLabel()
        addToLabel("1")
        expressionString+="1"
    }
    @IBAction func twoButton(_ sender: Any) {
        checkLabel()
        addToLabel("2")
        expressionString+="2"
    }
    @IBAction func threeButton(_ sender: Any) {
        checkLabel()
        addToLabel("3")
        expressionString+="3"
    }
    @IBAction func fourButton(_ sender: Any) {
        checkLabel()
        addToLabel("4")
        expressionString+="4"
    }
    @IBAction func fiveButton(_ sender: Any) {
        checkLabel()
        addToLabel("5")
        expressionString+="5"
    }
    @IBAction func sixButton(_ sender: Any) {
        checkLabel()
        addToLabel("6")
        expressionString+="6"
    }
    @IBAction func sevenButton(_ sender: Any) {
        checkLabel()
        addToLabel("7")
        expressionString+="7"
    }
    @IBAction func eightButton(_ sender: Any) {
        checkLabel()
        addToLabel("8")
        expressionString+="8"
    }
    @IBAction func nineButton(_ sender: Any) {
        checkLabel()
        addToLabel("9")
        expressionString+="9"
    }
    
    @IBAction func divButton(_ sender: Any) {
        // Вызываем Воркспейс и передаем ему нашу оперцию из енума
        label.text = workSpace(.div)
    }
    @IBAction func multiplicationButton(_ sender: Any) {
        label.text = workSpace(.multi)
    }
    @IBAction func minusButton(_ sender: Any) {
        label.text = workSpace(.minus)
    }
    @IBAction func plusButton(_ sender: Any) {
        label.text = workSpace(.plus)
    }
    @IBAction func equalsButton(_ sender: Any) {
        label.text = workSpace(.equal)
        
    }
    
    @IBAction func percentButton(_ sender: Any) {
        label.text = workSpace(.percent)
    }
    @IBAction func plusMinusButton(_ sender: Any) {
        if expressionString.isEmpty && secondNumber.isEmpty && !firstNumber.isEmpty {
            firstNumber = String(Int(firstNumber)! * -1)
            label.text = firstNumber
        } else if !expressionString.isEmpty {
            expressionString = String(Int(expressionString)! * -1)
            label.text = expressionString
        }
        //label.text = workSpace(.plusMinus)
    }
    @IBAction func allClearButton(_ sender: Any) {
        clearAll()
        expressionString = ""
        firstNumber = "0"
        secondNumber = ""
        sign = .none

    }
    
    @IBAction func pointButton(_ sender: Any) {
        checkLabel()
        addToLabel(".")
    }
    
    
    @IBOutlet weak var label: UILabel!
    
    func addToLabel(_ addText: String) {
        if label.text! == "0" && (addText != "." || addText == "0") {
            label.text! = ""
        }
        label.text! = label.text! + addText
    }
    func clearAll() {
        label.text! = "0"
    }
    func checkLabel() {
        if expressionString.isEmpty && !label.text!.isEmpty {
            label.text! = ""
        }
    }
    
}




