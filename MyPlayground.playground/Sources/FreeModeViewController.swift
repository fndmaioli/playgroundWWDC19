import Foundation
import UIKit
import PlaygroundSupport

public class FreeModeViewController: UIViewController {
    
    public var equationLabel: UILabel = UILabel(frame: CGRect(x: 110, y: 250, width: 500, height: 90))
    
    public override func loadView() {
        let view = UIView()
        
        let backgroundImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 720, height: 1080))
        backgroundImageView.image = UIImage(named: "general_background.png")
        view.addSubview(backgroundImageView)
        
        let titleLabel = UILabel(frame: CGRect(x: 210, y: 100, width: 300, height: 100))
        titleLabel.text = "Digit an equation you want to learn"
        titleLabel.textColor = UIColor(red: 41.0/255, green: 8.0/255, blue: 149.0/255, alpha: 1.0)
        titleLabel.numberOfLines = 0
        titleLabel.adjustsFontSizeToFitWidth = true
        let titleFont = UIFont(name: "Marker Felt", size: 30)
        titleLabel.font = titleFont
        titleLabel.textAlignment = NSTextAlignment.center
        view.addSubview(titleLabel)
        
        self.equationLabel.text = ""
        self.equationLabel.textColor = UIColor(red: 41.0/255, green: 8.0/255, blue: 149.0/255, alpha: 1.0)
        self.equationLabel.adjustsFontSizeToFitWidth = true
        self.equationLabel.font = UIFont(name: "Marker Felt", size: 50)
        self.equationLabel.textAlignment = NSTextAlignment.center
        view.addSubview(self.equationLabel)
        
        view.addSubview(self.createButton(frame: CGRect(x: 235, y: 465, width: 65, height: 65), number: "7"))
        view.addSubview(self.createButton(frame: CGRect(x: 305, y: 465, width: 65, height: 65), number: "8"))
        view.addSubview(self.createButton(frame: CGRect(x: 375, y: 465, width: 65, height: 65), number: "9"))
        view.addSubview(self.createButton(frame: CGRect(x: 235, y: 535, width: 65, height: 65), number: "4"))
        view.addSubview(self.createButton(frame: CGRect(x: 305, y: 535, width: 65, height: 65), number: "5"))
        view.addSubview(self.createButton(frame: CGRect(x: 375, y: 535, width: 65, height: 65), number: "6"))
        view.addSubview(self.createButton(frame: CGRect(x: 235, y: 605, width: 65, height: 65), number: "1"))
        view.addSubview(self.createButton(frame: CGRect(x: 305, y: 605, width: 65, height: 65), number: "2"))
        view.addSubview(self.createButton(frame: CGRect(x: 375, y: 605, width: 65, height: 65), number: "3"))
        view.addSubview(self.createButton(frame: CGRect(x: 445, y: 465, width: 65, height: 65), number: "/"))
        view.addSubview(self.createButton(frame: CGRect(x: 445, y: 535, width: 65, height: 65), number: "x"))
        view.addSubview(self.createButton(frame: CGRect(x: 445, y: 605, width: 65, height: 65), number: "-"))
        view.addSubview(self.createButton(frame: CGRect(x: 445, y: 675, width: 65, height: 65), number: "+"))
        view.addSubview(self.createButton(frame: CGRect(x: 235, y: 675, width: 135, height: 65), number: "0"))
        view.addSubview(self.createButton(frame: CGRect(x: 375, y: 675, width: 65, height: 65), number: "X"))
        
        let confirmQuestionButton = UIButton(frame: CGRect(x: 228, y: 800, width: 275, height: 80))
        confirmQuestionButton.setTitle("Go to Question", for: .normal)
        confirmQuestionButton.titleLabel?.font = UIFont(name: "Chalkboard SE", size: 20)
        confirmQuestionButton.layer.cornerRadius = 12
        confirmQuestionButton.layer.borderWidth = 2
        confirmQuestionButton.layer.borderColor = UIColor(red: 145.0/255, green: 69.0/255, blue: 176.0/255, alpha: 1.0).cgColor
        confirmQuestionButton.setTitleColor(UIColor(red: 41.0/255, green: 8.0/255, blue: 149.0/255, alpha: 1.0), for: .normal)
        confirmQuestionButton.backgroundColor = UIColor(red: 222.0/255, green: 185.0/255, blue: 255.0/255, alpha: 1.0)
        confirmQuestionButton.addTarget(self, action: #selector(confirmQuestionButtonClicked(_:)), for: .touchUpInside)
        
        view.addSubview(confirmQuestionButton)
        
        
        let goBackButton = UIButton(frame: CGRect(x: 15, y: 40, width: 50, height: 50))
        goBackButton.addTarget(self, action: #selector(goBackButtonClicked(_:)), for: .touchUpInside)
        goBackButton.setImage(UIImage(named: "arrow_left.png"), for: .normal)
        view.addSubview(goBackButton)
        
        self.view = view
    }
    
    public func createButton(frame: CGRect, number: String) -> UIButton{
        let button = UIButton(frame: frame)
        button.setTitle(number, for: .normal)
        button.titleLabel?.font = UIFont(name: "Chalkboard SE", size: 18)
        button.layer.cornerRadius = 12
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor(red: 145.0/255, green: 69.0/255, blue: 176.0/255, alpha: 1.0).cgColor
        button.setTitleColor(UIColor(red: 41.0/255, green: 8.0/255, blue: 149.0/255, alpha: 1.0), for: .normal)
        button.backgroundColor = UIColor(red: 222.0/255, green: 185.0/255, blue: 255.0/255, alpha: 1.0)
        button.addTarget(self, action: #selector(KeyboardButtonClicked(_:)), for: .touchUpInside)
        
        return button
    }
    
    @objc public func goBackButtonClicked(_ sender: AnyObject?) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc public func confirmQuestionButtonClicked(_ sender: AnyObject?) {
        if let equation = self.equationLabel.text as? String {
            questionsArray.insert(Question.init(content: equation), at: 0)
            let questionView = QuestionViewController()
            self.present(questionView, animated: true, completion: nil)
        }
    }
    
    @objc public func KeyboardButtonClicked(_ sender: AnyObject?) {
        if let button = sender as? UIButton, let equation = self.equationLabel.text as? String, var digit = button.titleLabel?.text as? String{
            var isValidDigit = true
            if digit == "X" {
                isValidDigit = false
                if equation != "" {
                    self.equationLabel.text?.removeLast()
                }
            }
            else if digit == "x" || digit == "/" || digit == "+" || digit == "-" {
                if let last = equation.last as? Character {
                    let lastDigit = String(last)
                    if lastDigit == "x" || lastDigit == "/" || lastDigit == "+" || lastDigit == "-" || equation.isEmpty {
                        isValidDigit = false
                    }
                }
            }
            if isValidDigit { self.equationLabel.text = equation + digit }
        }
        
    }
    
    
}
