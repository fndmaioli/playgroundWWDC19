import Foundation

public var questionsArray: [Question] = [Question]()

public func createQuestions(){
    questionsArray.removeAll()
    questionsArray.append(Question.init(content: "17 x 24 = ?", alternatives: ["79","9","408","103","5"], rightAnswer: "408", tips: ["24=6x4 and 17=10+7", "Ignore the 4 for now, (6x10)+(6x7)"]))
    
    questionsArray.append(Question.init(content: "35 x 50", alternatives: ["1750","1900","2250","1300","2070"], rightAnswer: "1750", tips: ["50 = 5 x 10","35 = 5 x 7", "5 x 5 = 25"]))
    
}

public var messagesArray = [String]()

public func createMessages(){
    messagesArray.removeAll()
    messagesArray.append("Math builds up on previous knowledge, so having better dominance over these simple things will help a lot later on.")
    
    messagesArray.append("To be able to breakdown difficult problems into smaller ones is an important skill to have in advanced mathmatics and many other subjects.")
    
}
