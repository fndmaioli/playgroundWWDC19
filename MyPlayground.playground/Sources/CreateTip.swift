import Foundation

public func createTip(content: String) -> String{
    let equation = content.lowercased()
    var number1 = ""
    var number2 = -1
    var operationCurrentNumber = "+"
    var operation = ""
    var lastOperation = ""
    
    for c in equation {
        let char = String(c)
        if char != " " && char != "(" && char != ")"{
            if char >= "0" && char <= "9" {
                number1 += char
            }
            else{
                if char == "+" || char == "-" { operation = "+" }
                else if char == "x" || char == "/" { operation = "x" }
                
                if let number = Int(number1){
                    if operation == "x" || lastOperation == "x" {
                        if number > number2 {
                            number2 = number
                            operationCurrentNumber = "x"
                        } else if operationCurrentNumber == "+" {
                            number2 = number
                            operationCurrentNumber = "x"
                        }
                    } else if number > number2 {
                        number2 = number
                        operationCurrentNumber = "+"
                    }
                }
                lastOperation = operation
                number1 = ""
            }
        }
    }
    if let number = Int(number1){
        if operation == "x" || lastOperation == "x" {
            if number > number2 {
                number2 = number
                operationCurrentNumber = "x"
            } else if operationCurrentNumber == "+" {
                number2 = number
                operationCurrentNumber = "x"
            }
        } else if number > number2 && operationCurrentNumber != "x"{
            number2 = number
            operationCurrentNumber = "+"
        }
        
    }
    
    let newEquationPart =  breakDownNumber(number: String(number2), operation: operationCurrentNumber)
    var newEquation = ""
    number1 = ""
    for c in equation {
        let char = String(c)
        if char != " "{
            if char >= "0" && char <= "9" {
                number1 += char
            }
            else {
                if number1 == String(number2) {
                    newEquation += newEquationPart + char
                } else {
                    newEquation += number1 + char
                }
                number1 = ""
            }
        }
    }
    if number1 == String(number2) {
        newEquation += newEquationPart
        number1 = ""
    } else {
        newEquation += number1
        number1 = ""
    }
    
    return newEquation
}

public func breakDownSum(number: String) -> String {
    if let num = Int(number) {
        let num1 = (num/10) * 10
        let num2 = num % 10
        if num1 == 0 {
            return "\(num2)"
        } else if num2 == 0{
            return "\(num1)"
        } else {
            return "(\(num1)+\(num2))"
        }
    }
    return "Something happened"
}

public func breakDownNumber(number: String, operation: String) -> String{
    if let num = Int(number) {
        if operation == "+" {
            return breakDownSum(number: number)
        }
        var num1 = 0
        var num2 = num
        for i in 1...num/2{
            if num%i == 0 {
                if abs(num2-num1) > abs(i-num/i) {
                    num1 = i
                    num2 = num/i
                }
            }
        }
        if num1 == 1 && num2 == num {
            return breakDownSum(number: number)
        }
        return "(\(num1)x\(num2))"
    }
    return "Something happened"
}
