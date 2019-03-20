import Foundation
import UIKit

public class QuestionView: UIView {
    
    public var frames: [CGRect] = [CGRect]()
    public var tipsLabel: UILabel = UILabel()
    public var question: Question?
    public var numTips: Int = 0
    public var numAlternatives: Int = 0
    public var currentTipButton: TipButton?
    
    public override init(frame: CGRect){
        super.init(frame: frame)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public init(question: Question, frame: CGRect){
        super.init(frame: frame)
        self.question = question
        self.frames = createRandomFrames()
        let content = UILabel()
        content.frame = CGRect(x: 210, y: 50, width: 200, height: 50)
        content.text = question.content
        content.textAlignment = NSTextAlignment.center
        content.textColor = .black
        self.addSubview(content)
        
        self.numTips = question.tips.count
        self.numAlternatives = question.alternatives.count
        tipsLabel.text = "Tips left: \(numTips)"
        tipsLabel.frame = CGRect(x: 20, y: 65, width: 100, height: 50)
        self.addSubview(tipsLabel)
        
        var buttonAlternative: AlternativeButton
        for alternative in question.alternatives {
            buttonAlternative = AlternativeButton.init(buttonTitle: alternative, frame: self.getFrame())
            buttonAlternative.addTarget(self, action: #selector(buttonAlternativeClicked(_:)), for: .touchUpInside)
            self.addSubview(buttonAlternative)
        }
        
        let tip = question.tips.remove(at: 0)
        let buttonTip = TipButton.init(content: tip, frame: self.getFrame())
        buttonTip.addTarget(self, action: #selector(buttonTipClicked(_:)), for: .touchUpInside)
        self.addSubview(buttonTip)
        self.currentTipButton = buttonTip
    }
    
    @objc public func buttonAlternativeClicked(_ sender: AnyObject?) {
        if let button = sender as? AlternativeButton, let text = button.titleLabel?.text, let myquestion = self.question {
            
            self.numAlternatives -= 1
            let label = UILabel(frame: button.frame)
            label.numberOfLines = 0
            label.adjustsFontSizeToFitWidth = true
            label.textAlignment = NSTextAlignment.center
            label.alpha = 0.0
            self.addSubview(label)
            
            if myquestion.verifyAnswer(selected: text) {
                label.text = "Congratulations"
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
                else if numAlternatives == myquestion.alternatives.count-1 {
                    label.text = "Don't mind, keep trying!"
                } else {
                    label.text = "Don't be afraid of using the Tips, we're all here to learn.=)"
                }
            }
            
            self.fadeAnimation(sender: button, label: label, buttonTip: nil)
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
            label.alpha = 0.0
            self.addSubview(label)
            
            if self.numTips > 0 {
                let tip = question.tips.remove(at: 0)
                let buttonTip = TipButton.init(content: tip, frame: self.getFrame())
                buttonTip.addTarget(self, action: #selector(buttonTipClicked(_:)), for: .touchUpInside)
                buttonTip.alpha = 0.0
                self.addSubview(buttonTip)
                self.currentTipButton = buttonTip
                self.fadeAnimation(sender: button, label: label, buttonTip: buttonTip)
            }
            else {
                self.currentTipButton = nil
                self.fadeAnimation(sender: button, label: label, buttonTip: nil)
            }
        }
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
