import Foundation

public var questionsArray: [Question] = [Question]()

public func createQuestions(){
    questionsArray.removeAll()
//    questionsArray.append(Question.init(content: "17 x 24"))
    
    questionsArray.append(Question.init(content: "35 x 50"))
}

public var messagesArray = [String]()

public func createMessages(){
    messagesArray.removeAll()
    messagesArray.append("Math builds up on previous knowledge, so having better dominance over these simple things will help a lot later on.")
    
    messagesArray.append("To be able to breakdown difficult problems into smaller ones is an important skill to have in advanced mathmatics and many other subjects.")
    
}
