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

func multiOpperation(_ a: Int, _ b: Int) -> String {
    return String(a*b)
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
        result = firstNumberInt! / secondNumberInt!
        return String(result)
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
        return equalfunc()
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
        addToLabel("0")
        expressionString+="0"
    }
    @IBAction func oneButton(_ sender: Any) {
        addToLabel("1")
        expressionString+="1"
    }
    @IBAction func twoButton(_ sender: Any) {
        addToLabel("2")
        expressionString+="2"
    }
    @IBAction func threeButton(_ sender: Any) {
        addToLabel("3")
        expressionString+="3"
    }
    @IBAction func fourButton(_ sender: Any) {
        addToLabel("4")
        expressionString+="4"
    }
    @IBAction func fiveButton(_ sender: Any) {
        addToLabel("5")
        expressionString+="5"
    }
    @IBAction func sixButton(_ sender: Any) {
        addToLabel("6")
        expressionString+="6"
    }
    @IBAction func sevenButton(_ sender: Any) {
        addToLabel("7")
        expressionString+="7"
    }
    @IBAction func eightButton(_ sender: Any) {
        addToLabel("8")
        expressionString+="8"
    }
    @IBAction func nineButton(_ sender: Any) {
        addToLabel("9")
        expressionString+="9"
    }
    
    @IBAction func divButton(_ sender: Any) {
        // Вызываем Воркспейс и передаем ему нашу оперцию из енума
        label.text = workSpace(.div)
    }
    @IBAction func multiplicationButton(_ sender: Any) {
    }
    @IBAction func minusButton(_ sender: Any) {
    }
    @IBAction func plusButton(_ sender: Any) {
    }
    @IBAction func equalsButton(_ sender: Any) {
        
    }
    
    @IBAction func percentButton(_ sender: Any) {
    }
    @IBAction func plusMinusButton(_ sender: Any) {
    }
    @IBAction func allClearButton(_ sender: Any) {
        clearAll()
        expressionString = ""
        // добавить обнуление чисел
    }
    
    @IBAction func pointButton(_ sender: Any) {
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
    
}




