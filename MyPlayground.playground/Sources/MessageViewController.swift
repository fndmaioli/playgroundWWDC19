import Foundation
import UIKit
import PlaygroundSupport

public class MessageViewController: UIViewController {
    
    public override func loadView() {
        let view = UIView()
        
        let backgroundImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 720, height: 1080))
        backgroundImageView.image = UIImage(named: "numbers_background.png")
        view.addSubview(backgroundImageView)
        
        var messageLabelFrame: CGRect = CGRect(x: 210, y: 300, width: 300, height: 200)
        if questionsArray.isEmpty {
            let congratsLabel = UILabel(frame: CGRect(x: 135, y: 200, width: 450, height: 200))
            congratsLabel.text = "CONGRATULATIONS"
            congratsLabel.textColor = UIColor(red: 41.0/255, green: 8.0/255, blue: 149.0/255, alpha: 1.0)
            congratsLabel.numberOfLines = 0
            congratsLabel.adjustsFontSizeToFitWidth = true
            let congratsFont = UIFont(name: "Marker Felt", size: 50)
            congratsLabel.font = congratsFont
            congratsLabel.textAlignment = NSTextAlignment.center
            view.addSubview(congratsLabel)
            
            messageLabelFrame = CGRect(x: 210, y: 380, width: 300, height: 200)
        }
        
        let titleLabel = UILabel(frame: messageLabelFrame)
        titleLabel.text = messagesArray.remove(at: 0)
        titleLabel.textColor = UIColor(red: 41.0/255, green: 8.0/255, blue: 149.0/255, alpha: 1.0)
        titleLabel.numberOfLines = 0
        titleLabel.adjustsFontSizeToFitWidth = true
        let titleFont = UIFont(name: "Chalkboard SE", size: 30)
        titleLabel.font = titleFont
        titleLabel.textAlignment = NSTextAlignment.center
        view.addSubview(titleLabel)
        
        let leaveToHomeButton = UIButton(frame: CGRect(x: 15, y: 40, width: 50, height: 50))
        leaveToHomeButton.addTarget(self, action: #selector(leaveToHomeButtonClicked(_:)), for: .touchUpInside)
        leaveToHomeButton.setImage(UIImage(named: "home_icon.png"), for: .normal)
        view.addSubview(leaveToHomeButton)
        
        view.addSubview(verifyQuestions())
        
        self.view = view
    }
    
    public func verifyQuestions() -> UIView {
        
        if questionsArray.isEmpty {
            let doneLabel = UILabel(frame: CGRect(x: 235, y: 630, width: 250, height: 60))
            doneLabel.text = "You successfully answered all questions!!"
            doneLabel.textColor = UIColor(red: 41.0/255, green: 8.0/255, blue: 149.0/255, alpha: 1.0)
            doneLabel.numberOfLines = 0
            doneLabel.adjustsFontSizeToFitWidth = true
            let doneFont = UIFont(name: "Marker Felt", size: 30)
            doneLabel.font = doneFont
            doneLabel.textAlignment = NSTextAlignment.center
            
            return doneLabel
        }
        
        let nextQuestionButton = UIButton(frame: CGRect(x: 235, y: 630, width: 250, height: 60))
        nextQuestionButton.setTitle("Go to next question", for: .normal)
        nextQuestionButton.titleLabel?.font = UIFont(name: "Chalkboard SE", size: 18)
        nextQuestionButton.layer.cornerRadius = 12
        nextQuestionButton.layer.borderWidth = 2
        nextQuestionButton.layer.borderColor = UIColor(red: 145.0/255, green: 69.0/255, blue: 176.0/255, alpha: 1.0).cgColor
        nextQuestionButton.backgroundColor = UIColor(red: 222.0/255, green: 185.0/255, blue: 255.0/255, alpha: 1.0)
        nextQuestionButton.setTitleColor(UIColor(red: 41.0/255, green: 8.0/255, blue: 149.0/255, alpha: 1.0), for: .normal)
        nextQuestionButton.addTarget(self, action: #selector(NextQuestionButtonClicked(_:)), for: .touchUpInside)
        
        return nextQuestionButton
    }
    
    @objc public func leaveToHomeButtonClicked(_ sender: AnyObject?) {
        questionsArray.removeAll()
        messagesArray.removeAll()
        let viewController = InitialViewController()
        viewController.preferredContentSize = CGSize(width: 720, height: 1080)
        PlaygroundPage.current.liveView = viewController
    }
    
    @objc public func NextQuestionButtonClicked(_ sender: AnyObject?) {
        let questionView = QuestionViewController()
        self.present(questionView, animated: true, completion: nil)
    }
    
    
}

