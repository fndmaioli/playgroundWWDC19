import Foundation
import UIKit
import PlaygroundSupport

public class MyViewController : UIViewController {
    
    public override func loadView() {
        let view = UIView()

        let backgroundImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 720, height: 1080))
        backgroundImageView.image = UIImage(named: "general_background.png")
        view.addSubview(backgroundImageView)
        
        let question1 = Question.init(content: "17 x 24 = ?", alternatives: ["79","9","408","103","5"], rightAnswer: "408", tips: ["i don`t know too", "do something alone for once"])
        
        let questionView = QuestionView.init(question: question1, frame: CGRect(x: 0, y: 0, width: 720, height: 1080))
        view.addSubview(questionView)
        
        self.view = view
    }
    
}
