import Foundation

public var questionsArray: [Question] = [Question]()

public func createQuestions(){
    questionsArray.append(Question.init(content: "16 x 8"))
    
    questionsArray.append(Question.init(content: "58 x 5"))
    
    questionsArray.append(Question.init(content: "28 x 15"))
}

