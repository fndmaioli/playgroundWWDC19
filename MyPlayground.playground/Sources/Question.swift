import Foundation

public class Question {
    
    public var content: String
    public var alternatives: [String]
    public var rightAnswer: String
    public var tips: [String]
    
    public init(content: String, alternatives: [String], rightAnswer: String, tips: [String]){
        self.content = content
        self.alternatives = alternatives
        self.rightAnswer = rightAnswer
        self.tips = tips
    }
    
    public func verifyAnswer(selected: String) -> Bool{
        return selected == self.rightAnswer
    }
    
    
}
