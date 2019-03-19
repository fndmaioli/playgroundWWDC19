import Foundation
import UIKit

public class QuestionView: UIView {
    
    public var frames: [CGRect] = [CGRect]()
    public var question: Question?
    
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
        content.frame = CGRect(x: 210, y: 50, width: 300, height: 50)
        content.text = question.content
        content.textAlignment = NSTextAlignment.center
        content.textColor = .black
        self.addSubview(content)
    
        var buttonAlternative: AlternativeButton
        for alternative in question.alternatives {
            buttonAlternative = AlternativeButton.init(buttonTitle: alternative, frame: self.getFrame())
            buttonAlternative.addTarget(self, action: #selector(buttonAlternativeClicked(_:)), for: .touchUpInside)
            self.addSubview(buttonAlternative)
        }
        
        var buttonTip: TipButton
        for tip in question.tips {
            buttonTip = TipButton.init(content: tip, frame: self.getFrame())
            buttonTip.addTarget(self, action: #selector(buttonTipClicked(_:)), for: .touchUpInside)
            self.addSubview(buttonTip)
        }
        
    }
    
    @objc public func buttonAlternativeClicked(_ sender: AnyObject?) {
        if let button = sender as? AlternativeButton, let text = button.titleLabel?.text, let question = self.question {
            if question.verifyAnswer(selected: text) {
                
                button.setBackgroundImage(nil, for: .normal)
                button.setTitle("Congratulations", for: .normal)
                button.titleLabel?.sizeToFit()
                
                print("BBBBBBBBBB")
                if button.state == .highlighted {
                    print("IT`S highlighted")
                }
            }
            else {
                print("AAAAAAAAAA")
                
                
                button.setBackgroundImage(nil, for: .normal)
                button.setTitle("Don`t be afraid of using the Tips, we're all here to learn!", for: .normal)
                button.titleLabel?.sizeToFit()
            }
        }
        
    }
    
    @objc public func buttonTipClicked(_ sender: AnyObject?) {
        if let button = sender as? TipButton, let question = self.question {
            button.setBackgroundImage(nil, for: .normal)
            button.setTitle(button.content, for: .normal)
            button.titleLabel?.sizeToFit()
        }
    }
    
    
    
    public func getFrame() -> CGRect {
        return self.frames.removeFirst()
    }
    
    
    
    
    
}
