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
    let firstNumberInt = Double(firstNumber)
    let secondNumberInt = Double(secondNumber)
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
        return String(firstNumberInt! * 0.01)
    case .plusMinus:
        return String(firstNumberInt! * -1)
    case .none:
        return ""
    }
}

// Распределяем из общего потока символов первое и второе число, а также операцию
func workSpace(_ signFromButton: signes) -> String{
    let formatter = NumberFormatter()
    formatter.minimumFractionDigits = 0
    formatter.maximumFractionDigits = 2
    if sign == .none{
        sign = signFromButton
    }
//    else if sign == .equal && signFromButton != sign {
//        firstNumber = expressionString
//    }
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
        return String(format: "%g", Double(firstNumber)!)
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
        clearLabel()
        expressionString+="0"
        checkLabel("number")
        addToLabel("0")
    }
    @IBAction func oneButton(_ sender: Any) {
        clearLabel()
        expressionString+="1"
        checkLabel("number")
        addToLabel("1")
    }
    @IBAction func twoButton(_ sender: Any) {
        clearLabel()
        expressionString+="2"
        checkLabel("number")
        addToLabel("2")
    }
    @IBAction func threeButton(_ sender: Any) {
        clearLabel()
        expressionString+="3"
        checkLabel("number")
        addToLabel("3")
    }
    @IBAction func fourButton(_ sender: Any) {
        clearLabel()
        expressionString+="4"
        checkLabel("number")
        addToLabel("4")
    }
    @IBAction func fiveButton(_ sender: Any) {
        clearLabel()
        expressionString+="5"
        checkLabel("number")
        addToLabel("5")
    }
    @IBAction func sixButton(_ sender: Any) {
        clearLabel()
        expressionString+="6"
        checkLabel("number")
        addToLabel("6")
    }
    @IBAction func sevenButton(_ sender: Any) {
        clearLabel()
        expressionString+="7"
        checkLabel("number")
        addToLabel("7")
    }
    @IBAction func eightButton(_ sender: Any) {
        clearLabel()
        expressionString+="8"
        checkLabel("number")
        addToLabel("8")
    }
    @IBAction func nineButton(_ sender: Any) {
        clearLabel()
        expressionString+="9"
        checkLabel("number")
        addToLabel("9")
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
        if expressionString.isEmpty && secondNumber.isEmpty && !firstNumber.isEmpty {
            firstNumber = String(Double(firstNumber)! * 0.01)
            label.text = firstNumber
        } else if !expressionString.isEmpty {
            expressionString = String(Double(expressionString)! * 0.01)
            label.text = expressionString
        }
    }
    @IBAction func plusMinusButton(_ sender: Any) {
        if expressionString.isEmpty && secondNumber.isEmpty && !firstNumber.isEmpty {
            firstNumber = String(Double(firstNumber)! * -1)
            label.text = firstNumber
        } else if !expressionString.isEmpty {
            expressionString = String(Double(expressionString)! * -1)
            label.text = expressionString
        }
    }
    @IBAction func allClearButton(_ sender: Any) {
        clearAll()


    }
    
    @IBAction func pointButton(_ sender: Any) {
        if label.text! == "0" && expressionString.isEmpty {
            expressionString += "0"
        }
        clearLabel()
        if !label.text!.contains(".") {
            expressionString+="."
            addToLabel(".")
        }
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
        expressionString = ""
        firstNumber = "0"
        secondNumber = ""
        sign = .none
    }
    func clearLabel() {
        if expressionString.isEmpty && !label.text!.isEmpty {
            label.text! = ""
        }
    }
    func checkLabel(_ symbol: String) {
        if sign == .equal && expressionString == "number" {
            firstNumber = "0"
            secondNumber = ""
            sign = .none
        }
    }
    
}
