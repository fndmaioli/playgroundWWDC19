import Foundation
import UIKit
import PlaygroundSupport

public class QuestionViewController : UIViewController {
    
    public var frames: [CGRect] = [CGRect]()
    public var tipsLabel: UILabel = UILabel()
    public var question: Question?
    public var numTips: Int = 0
    public var numAlternatives: Int = 0
    public var currentTipButton: TipButton?
    
    public override func loadView() {
        let view = UIView()

        let backgroundImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 720, height: 1080))
        backgroundImageView.image = UIImage(named: "general_background.png")
        view.addSubview(backgroundImageView)
        
        let question = questionsArray.remove(at: 0)
        
        self.question = question
        self.frames = createRandomFrames()
        let content = UILabel()
        content.frame = CGRect(x: 260, y: 50, width: 200, height: 100)
        content.text = question.content
        content.textColor = UIColor(red: 106.0/255, green: 125.0/255, blue: 254.0/255, alpha: 1.0)
        content.font = UIFont(name: "Chalkboard SE", size: 35)
        content.textAlignment = NSTextAlignment.center
        view.addSubview(content)
        
        self.numTips = question.tips.count
        self.numAlternatives = question.alternatives.count
        tipsLabel.text = "Tips left: \(numTips)"
        tipsLabel.frame = CGRect(x: 600, y: 47, width: 100, height: 50)
        tipsLabel.font = UIFont(name: "Chalkboard SE", size: 20)
        view.addSubview(tipsLabel)
        
        let leaveToHomeButton = UIButton(frame: CGRect(x: 15, y: 42, width: 50, height: 50))
        leaveToHomeButton.addTarget(self, action: #selector(leaveToHomeButtonClicked(_:)), for: .touchUpInside)
        leaveToHomeButton.setImage(UIImage(named: "home_icon.png"), for: .normal)
        view.addSubview(leaveToHomeButton)
        
        var buttonAlternative: AlternativeButton
        for alternative in question.alternatives {
            buttonAlternative = AlternativeButton.init(buttonTitle: alternative, frame: self.getFrame())
            buttonAlternative.addTarget(self, action: #selector(buttonAlternativeClicked(_:)), for: .touchUpInside)
            view.addSubview(buttonAlternative)
        }
        
        let tip = question.tips.remove(at: 0)
        let buttonTip = TipButton.init(content: tip, frame: self.getFrame())
        buttonTip.addTarget(self, action: #selector(buttonTipClicked(_:)), for: .touchUpInside)
        view.addSubview(buttonTip)
        self.currentTipButton = buttonTip
        
        self.view = view
    }
    
    @objc public func buttonAlternativeClicked(_ sender: AnyObject?) {
        
        if let button = sender as? AlternativeButton, let text = button.titleLabel?.text, let myquestion = self.question {
            
            self.numAlternatives -= 1
            let label = UILabel(frame: button.frame)
            label.numberOfLines = 0
            label.adjustsFontSizeToFitWidth = true
            label.textAlignment = NSTextAlignment.center
            label.alpha = 0.0
            self.view.addSubview(label)
            
            if myquestion.verifyAnswer(selected: text) {
                let messageView = MessageViewController()
                self.present(messageView, animated: true, completion: nil)
            }
            else {
                if numAlternatives - 1 == numTips{
                    if self.currentTipButton != nil {
                        self.buttonTipClicked(self.currentTipButton)
                        label.text = "Try using this tip!"
                    } else {
                        label.text = "Only one alternative left now!"
                    }
                }
                else if numAlternatives == myquestion.alternatives.count-1 || self.numTips == 0{
                    label.text = "Don't mind, keep thinking!"
                } else if self.numTips > 0 {
                    label.text = "Don't be afraid of using the Tips, we're all here to learn.=)"
                }
                self.fadeAnimation(sender: button, label: label, buttonTip: nil)
            }
            
        }
        
    }
    
    @objc public func buttonTipClicked(_ sender: AnyObject?) {
        if let button = sender as? TipButton, let question = self.question {
            
            self.numTips -= 1
            self.tipsLabel.text = "Tips left: \(self.numTips)"
            
            let label = UILabel(frame: button.frame)
            label.text = button.content
            label.numberOfLines = 0
            label.adjustsFontSizeToFitWidth = true
            label.textAlignment = NSTextAlignment.center
            label.alpha = 0.0
            self.view.addSubview(label)
            
            if self.numTips > 0 {
                let tip = question.tips.remove(at: 0)
                let buttonTip = TipButton.init(content: tip, frame: self.getFrame())
                buttonTip.addTarget(self, action: #selector(buttonTipClicked(_:)), for: .touchUpInside)
                buttonTip.alpha = 0.0
                self.view.addSubview(buttonTip)
                self.currentTipButton = buttonTip
                self.fadeAnimation(sender: button, label: label, buttonTip: buttonTip)
            }
            else {
                self.currentTipButton = nil
                self.fadeAnimation(sender: button, label: label, buttonTip: nil)
            }
        }
    }
    
    @objc public func leaveToHomeButtonClicked(_ sender: AnyObject?) {
        let viewController = InitialViewController()
        viewController.preferredContentSize = CGSize(width: 720, height: 1080)
        PlaygroundPage.current.liveView = viewController
    }
    
    public func fadeAnimation(sender: UIButton, label: UILabel, buttonTip: TipButton?){
        UIView.animate(withDuration: 0.5, animations: {
            sender.alpha = 0.0
        }) { _ in
            sender.removeFromSuperview()
            UIView.animate(withDuration: 0.7, animations: {
                label.alpha = 1.0
                if buttonTip != nil {
                    buttonTip!.alpha = 1.0
                }
            })
        }
    }
    
    public func getFrame() -> CGRect {
        return self.frames.removeFirst()
    }
    
}
