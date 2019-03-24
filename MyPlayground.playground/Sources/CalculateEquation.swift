import Foundation
import GameplayKit

public func getMultDivResult(content: String) -> String{
    var equation = content.lowercased()
    var number1 = ""
    var number2 = ""
    var calculateMult = false
    var calculateDiv = false
    var result = ""
    var eqStart: String.Index = String.Index(encodedOffset: 0)
    var eqFinish: String.Index = String.Index(encodedOffset: 0)
    while equation.contains(Character("x")) || equation.contains(Character("/")){
        
        for (i,c) in equation.enumerated(){
            let char = String(c)
            if char != " "{
                if char >= "0" && char <= "9" {
                    if number1 == "" && (!calculateMult && !calculateDiv) {
                        eqStart = String.Index.init(encodedOffset: i)
                    }
                    if String.Index.init(encodedOffset: i) == equation.index(before: equation.endIndex) {
                        eqFinish = String.Index.init(encodedOffset: i)
                    }
                    number1 += char
                } else {
                    if calculateMult {
                        eqFinish = String.Index.init(encodedOffset: i-1)
                        result = calculateSimpleResult(number1: number1, number2: number2, operation: "x")
                        calculateMult = false
                        number1 = ""
                        break
                    } else if calculateDiv {
                        eqFinish = String.Index.init(encodedOffset: i-1)
                        result = calculateSimpleResult(number1: number2, number2: number1, operation: "/")
                        calculateDiv = false
                        number1 = ""
                        break
                    }
                    number2 = number1
                    number1 = ""
                    if char == "x" {
                        calculateMult = true
                    } else if char == "/" {
                        calculateDiv = true
                    }
                }
            }
        }
        if calculateMult {
            result = calculateSimpleResult(number1: number1, number2: number2, operation: "x")
            calculateMult = false
        } else if calculateDiv {
            result = calculateSimpleResult(number1: number2, number2: number1, operation: "/")
            calculateDiv = false
        }
        equation.replaceSubrange(eqStart...eqFinish, with: result)
    }
    if equation.contains(Character("+")) || equation.contains(Character("-")){
        return getSumSubtResult(content: equation)
    }
    return equation
}

public func getSumSubtResult(content: String) -> String{
    var result: String
    let equation = content.lowercased()
    var number1 = ""
    var number2 = ""
    var operation = ""
    
    for c in equation {
        let char = String(c)
        if char != " "{
            if char >= "0" && char <= "9" {
                number1 += char
            }
            else{
                if number1 != "" && number2 != "" && operation != ""{
                    number2 = calculateSimpleResult(number1: number1, number2: number2, operation: operation)
                    number1 = ""
                    operation = char
                }
                else {
                    operation = char
                    number2 = number1
                    number1 = ""
                }
            }
        }
    }
    if number2 != "" && operation != ""{
        if number1 == ""{
            result = number2
            return result
        }
        else{
            return calculateSimpleResult(number1: number1, number2: number2, operation: operation)
        }
    }
    return "No result found"
}


public func calculateSimpleResult(number1: String, number2: String, operation: String) -> String{
    if let num1 = Int(number1), let num2 = Int(number2) {
        if operation == "x" {
            return String(num1 * num2)
        } else if operation == "/" {
            return String(num1 / num2)
        } else if operation == "+" {
            return String(num1 + num2)
        }else if operation == "-" {
            return String(num2 - num1)
        }
    }
    return "No result found"
}

public func getNumbers(equation: String) -> [String] {
    var numbersArray = [String]()
    var number = ""
    for (i,c) in equation.enumerated() {
        let char = String(c)
        if char != " " {
            if char >= "0" && char <= "9" {
                number += char
            }
            else {
                numbersArray.append(number)
                number = ""
            }
        }
    }
    numbersArray.append(number)
    return numbersArray
}

public func getAlternatives(equation: String, rightAnswer: String) -> [String]{
    
    var alternativesArray = [String]()
    alternativesArray.append(rightAnswer)
    var numbersArray = getNumbers(equation: equation)
    var alternative: Int
    
    if let correctNum = Int(rightAnswer) {
        
        let distribution = GKShuffledDistribution(lowestValue: 0, highestValue: numbersArray.count-1)
        var randomMultiplier = GKShuffledDistribution(lowestValue: 1, highestValue: 5)
        var randomOperation = Int.random(in: 1...2)
        for _ in 0..<5{
            
            if let number = numbersArray[distribution.nextInt()] as? String, let num = Int(number){
                if randomOperation == 1 {
                    alternative = correctNum + (num * randomMultiplier.nextInt())
                } else {
                    alternative = correctNum - (num * randomMultiplier.nextInt())
                }
                alternativesArray.append(String(alternative))
                randomOperation = Int.random(in: 1...2)
            }
        }
        return alternativesArray
    }
    return alternativesArray
}


