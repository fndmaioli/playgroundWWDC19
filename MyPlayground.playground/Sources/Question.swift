import Foundation

public class Question {
    
    public var content: String
    public var alternatives: [String]
    public var rightAnswer: String
    
    public init(content: String){
        self.content = content
        let rightAnswer = getMultDivResult(content: content)
        self.rightAnswer = rightAnswer
        self.alternatives = getAlternatives(equation: content, rightAnswer: rightAnswer)
    }
    
    public func verifyAnswer(selected: String) -> Bool{
        return selected == self.rightAnswer
    }
    
    
}
