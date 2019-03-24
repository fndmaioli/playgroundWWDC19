import Foundation
import UIKit
import PlaygroundSupport

public class InitialViewController: UIViewController {
    
    public override func loadView() {
        let view = UIView()
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 720, height: 1080))
        imageView.image = UIImage(named: "numbers_background.png")
        view.addSubview(imageView)
        
        let titleLabel = UILabel(frame: CGRect(x: 160, y: 260, width: 405, height: 100))
        titleLabel.text = "Playing Numbers"
        titleLabel.textColor = UIColor(red: 41.0/255, green: 8.0/255, blue: 149.0/255, alpha: 1.0)
        let titleFont = UIFont(name: "Marker Felt", size: 50)
        titleLabel.font = titleFont
        titleLabel.textAlignment = NSTextAlignment.center
        view.addSubview(titleLabel)
        
        let multiplicationButton = UIButton(frame: CGRect(x: 235, y: 440, width: 250, height: 80))
        multiplicationButton.setTitle("Multiplication tricks", for: .normal)
        multiplicationButton.titleLabel?.font = UIFont(name: "Chalkboard SE", size: 18)
        multiplicationButton.layer.cornerRadius = 12
        multiplicationButton.layer.borderWidth = 2
        multiplicationButton.layer.borderColor = UIColor(red: 145.0/255, green: 69.0/255, blue: 176.0/255, alpha: 1.0).cgColor
        multiplicationButton.backgroundColor = UIColor(red: 222.0/255, green: 185.0/255, blue: 255.0/255, alpha: 1.0)
        multiplicationButton.setTitleColor(UIColor(red: 41.0/255, green: 8.0/255, blue: 149.0/255, alpha: 1.0), for: .normal)
        multiplicationButton.addTarget(self, action: #selector(multiplicationButtonClicked(_:)), for: .touchUpInside)
        view.addSubview(multiplicationButton)
        
        let freeModeButton = UIButton(frame: CGRect(x: 235, y: 570, width: 250, height: 80))
        freeModeButton.setTitle("Free Mode", for: .normal)
        freeModeButton.titleLabel?.font = UIFont(name: "Chalkboard SE", size: 18)
        freeModeButton.layer.cornerRadius = 12
        freeModeButton.layer.borderWidth = 2
        freeModeButton.layer.borderColor = UIColor(red: 145.0/255, green: 69.0/255, blue: 176.0/255, alpha: 1.0).cgColor
        freeModeButton.backgroundColor = UIColor(red: 222.0/255, green: 185.0/255, blue: 255.0/255, alpha: 1.0)
        freeModeButton.setTitleColor(UIColor(red: 41.0/255, green: 8.0/255, blue: 149.0/255, alpha: 1.0), for: .normal)
        freeModeButton.addTarget(self, action: #selector(freeModeButtonClicked(_:)), for: .touchUpInside)
        view.addSubview(freeModeButton)
        
        let curiositiesButton = UIButton(frame: CGRect(x: 235, y: 700, width: 250, height: 80))
        curiositiesButton.setTitle("Math funny curiosities", for: .normal)
        curiositiesButton.titleLabel?.font = UIFont(name: "Chalkboard SE", size: 18)
        curiositiesButton.layer.cornerRadius = 12
        curiositiesButton.layer.borderWidth = 2
        curiositiesButton.layer.borderColor = UIColor(red: 145.0/255, green: 69.0/255, blue: 176.0/255, alpha: 1.0).cgColor
        curiositiesButton.backgroundColor = UIColor(red: 222.0/255, green: 185.0/255, blue: 255.0/255, alpha: 1.0)
        curiositiesButton.setTitleColor(UIColor(red: 41.0/255, green: 8.0/255, blue: 149.0/255, alpha: 1.0), for: .normal)
        curiositiesButton.addTarget(self, action: #selector(curiositiesButtonClicked(_:)), for: .touchUpInside)
        view.addSubview(curiositiesButton)
        
        self.view = view
    }
    
    @objc public func curiositiesButtonClicked(_ sender: AnyObject?) {
        let curiositiesView = CuriositiesViewController()
        self.present(curiositiesView, animated: true, completion: nil)
    }
    
    @objc public func freeModeButtonClicked(_ sender: AnyObject?) {
        let freeModeView = FreeModeViewController()
        self.present(freeModeView, animated: true, completion: nil)
    }
    
    @objc public func multiplicationButtonClicked(_ sender: AnyObject?) {
        createQuestions()
        createMessages()
        let questionView = QuestionViewController()
        self.present(questionView, animated: true, completion: nil)
    }
    
    
}
