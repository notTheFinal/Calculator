//
//  ViewController.swift
//  Calculator
//
//  Created by Александр on 02.12.2021.
//

import UIKit

func divOpperation(_ a: Int, _ b: Int) -> String {
    return (b != 0 ? String(a/b) : "Ошибка")
}


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
var firstNumber: String = ""
var secondNumber: String = ""
var sign: signes = .none

// Функция кнопки равно, если вызывается в какой-то другой операции, то возвращает результат как firstNumber
func equalfunc() -> String{
    let firstNumberInt = Int(firstNumber)
    let secondNumberInt = Int(secondNumber)
    var result = 0
    switch sign {
    case .div:
        return (secondNumberInt! != 0 ? String(firstNumberInt! / secondNumberInt!) : "Ошибка")
    case .multi:
        result = firstNumberInt! * secondNumberInt!
    case .plus:
        result = firstNumberInt! + secondNumberInt!
    case .minus:
        result = firstNumberInt! - secondNumberInt!
    case .equal:
        result = firstNumberInt!
    case .percent:
        result = firstNumberInt!
    case .plusMinus:
        result = firstNumberInt! * -1
    case .none:
        result = firstNumberInt! / secondNumberInt!
    }
    
    return ""
}

// Распределяем из общего потока символов первое и второе число, а также операцию
func workSpace(_ signFromButton: signes) -> String{
    if firstNumber.isEmpty {
        firstNumber = expressionString
        expressionString = ""
        sign = signFromButton
    }
    else if secondNumber.isEmpty {
        secondNumber = expressionString
        expressionString = ""
        // Итоговый результат вновь обозначаем как первое число
        firstNumber = equalfunc()
        // Второе число обнуляем
        secondNumber = ""
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
        print(firstNumber)
        print(secondNumber)
        print("-------")

        
        
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
        label.text = workSpace(.plusMinus)
    }
    @IBAction func allClearButton(_ sender: Any) {
        clearAll()
        expressionString = ""
        firstNumber = ""
        secondNumber = ""

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




