import Foundation
import UIKit
import PlaygroundSupport

public class QuestionViewController : UIViewController {
    
    public var frames: [CGRect] = [CGRect]()
    public var tipLabel: UILabel = UILabel(frame: CGRect(x: 175, y: 200, width: 370, height: 75))
    public var question: Question?
    public var numAlternatives: Int = 6
    public var tips: [String] = [String]()
    public var indexTips: Int = 0
    public var lastTipButton: UIButton = UIButton(frame: CGRect(x: 10, y: 200, width: 150, height: 75))
    
    public override func loadView() {
        let view = UIView()

        let backgroundImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 720, height: 1080))
        backgroundImageView.image = UIImage(named: "general_background.png")
        view.addSubview(backgroundImageView)
        
        let question = questionsArray.remove(at: 0)
        
        self.question = question
        self.frames = createRandomFrames()
        let content = UILabel()
        content.frame = CGRect(x: 160, y: 90, width: 400, height: 75)
        content.text = question.content
        content.textColor = UIColor(red: 41.0/255, green: 8.0/255, blue: 149.0/255, alpha: 1.0)
        content.font = UIFont(name: "Chalkboard SE", size: 42)
        content.textAlignment = NSTextAlignment.center
        view.addSubview(content)
        
        self.tipLabel.text = ""
        self.tipLabel.textColor = UIColor(red: 41.0/255, green: 8.0/255, blue: 149.0/255, alpha: 1.0)
        self.tipLabel.font = UIFont(name: "Chalkboard SE", size: 30)
        self.tipLabel.textAlignment = NSTextAlignment.center
        view.addSubview(self.tipLabel)
        
        self.lastTipButton.backgroundColor = .red
        self.lastTipButton.setTitle("Last tip", for: .normal)
        self.lastTipButton.titleLabel?.font = UIFont(name: "Chalkboard SE", size: 22)
        self.lastTipButton.layer.cornerRadius = 12
        self.lastTipButton.layer.borderWidth = 2
        self.lastTipButton.layer.borderColor = UIColor(red: 145.0/255, green: 69.0/255, blue: 176.0/255, alpha: 1.0).cgColor
        self.lastTipButton.backgroundColor = UIColor(red: 222.0/255, green: 185.0/255, blue: 255.0/255, alpha: 1.0)
        self.lastTipButton.setTitleColor(UIColor(red: 41.0/255, green: 8.0/255, blue: 149.0/255, alpha: 1.0), for: .normal)
        self.lastTipButton.addTarget(self, action: #selector(lastTipButtonClicked(_:)), for: .touchUpInside)
        self.lastTipButton.isHidden = true
        view.addSubview(self.lastTipButton)
        
        let nextTipButton = UIButton(frame: CGRect(x: 560, y: 200, width: 150, height: 75))
        nextTipButton.backgroundColor = .red
        nextTipButton.setTitle("Get a tip", for: .normal)
        nextTipButton.titleLabel?.font = UIFont(name: "Chalkboard SE", size: 22)
        nextTipButton.layer.cornerRadius = 12
        nextTipButton.layer.borderWidth = 2
        nextTipButton.layer.borderColor = UIColor(red: 145.0/255, green: 69.0/255, blue: 176.0/255, alpha: 1.0).cgColor
        nextTipButton.backgroundColor = UIColor(red: 222.0/255, green: 185.0/255, blue: 255.0/255, alpha: 1.0)
        nextTipButton.setTitleColor(UIColor(red: 41.0/255, green: 8.0/255, blue: 149.0/255, alpha: 1.0), for: .normal)
        nextTipButton.addTarget(self, action: #selector(nextTipButtonClicked(_:)), for: .touchUpInside)
        view.addSubview(nextTipButton)
        
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
        self.tips.append("")
        self.view = view
    }
    
    @objc public func lastTipButtonClicked(_ sender: AnyObject?) {
        if let tipText = self.tipLabel.text as? String {
            self.tipLabel.text = self.tips[self.indexTips]
            
            if self.tipLabel.text == "" {
                self.lastTipButton.isHidden = true
            }
            else {
                self.indexTips -= 1
            }
        }
    }
    
    @objc public func nextTipButtonClicked(_ sender: AnyObject?) {
        if let tipText = self.tipLabel.text as? String, let equationText = self.question?.content as? String {
            if tipText == ""{
                sender?.setTitle("Next tip", for: .normal)
                let tip = createTip(content: equationText)
                self.tips.append(tip)
                self.tipLabel.text = tip
                self.lastTipButton.isHidden = false
            }
            else if tipText == self.tips[self.tips.count-1]{
                let tip = createTip(content: tipText)
                if tip != tipText {
                    self.tips.append(tip)
                    self.tipLabel.text = tip
                    self.indexTips += 1
                }
            } else {
                self.tipLabel.text = self.tips[indexTips+2]
                self.indexTips += 1
            }
        }
    }
    
    @objc public func buttonAlternativeClicked(_ sender: AnyObject?) {
        
        if let button = sender as? AlternativeButton, let text = button.titleLabel?.text, let myquestion = self.question {
            
            let label = UILabel(frame: button.frame)
            label.text = ""
            label.numberOfLines = 0
            label.textColor = UIColor(red: 41.0/255, green: 8.0/255, blue: 149.0/255, alpha: 1.0)
            label.font = UIFont(name: "Chalkboard SE", size: 20)
            label.adjustsFontSizeToFitWidth = true
            label.textAlignment = NSTextAlignment.center
            label.alpha = 0.0
            self.view.addSubview(label)
            
            if myquestion.verifyAnswer(selected: text) {
                let messageView = MessageViewController()
                self.present(messageView, animated: true, completion: nil)
            }
            else {
                switch (self.numAlternatives) {
                case 6: label.text = "Don't mind"
                case 5: label.text = "Keep thinking!"
                case 4: label.text = "Keep trying"
                case 3: label.text = "You got this!"
                case 2: label.text = "Only one left now"
                default: label.text = "Don't stop"
                }
                self.numAlternatives -= 1
                
                self.fadeAnimation(sender: button, label: label, buttonTip: nil)
            }
            
        }
        
    }
    
    @objc public func leaveToHomeButtonClicked(_ sender: AnyObject?) {
        questionsArray.removeAll()
        messagesArray.removeAll()
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
