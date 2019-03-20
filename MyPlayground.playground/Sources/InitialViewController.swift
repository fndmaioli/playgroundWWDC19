import Foundation
import UIKit
import PlaygroundSupport

public class InitialViewController: MyViewController {
    
    public override func loadView() {
        let view = UIView()
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 720, height: 1080))
        imageView.image = UIImage(named: "numbers_background.png")
        view.addSubview(imageView)
        
        let titleLabel = UILabel(frame: CGRect(x: 210, y: 270, width: 300, height: 60))
        titleLabel.text = "Playing Numbers"
        titleLabel.backgroundColor = .red
        let titleFont = UIFont(name: "title font", size: 100)
        titleLabel.font = titleFont
        titleLabel.textAlignment = NSTextAlignment.center
        view.addSubview(titleLabel)
        
        let multiplicationButton = UIButton(frame: CGRect(x: 235, y: 450, width: 250, height: 80))
        multiplicationButton.setTitle("Multiplication tricks", for: .normal)
        multiplicationButton.layer.cornerRadius = 12
        multiplicationButton.layer.borderWidth = 2
        multiplicationButton.layer.borderColor = UIColor(red: 145.0/255, green: 69.0/255, blue: 176.0/255, alpha: 1.0).cgColor
        multiplicationButton.backgroundColor = UIColor(red: 222.0/255, green: 185.0/255, blue: 255.0/255, alpha: 1.0)
        multiplicationButton.setTitleColor(.black, for: .normal)
        multiplicationButton.addTarget(self, action: #selector(multiplicationButtonClicked(_:)), for: .touchUpInside)
        view.addSubview(multiplicationButton)
        
        let curiositiesButton = UIButton(frame: CGRect(x: 235, y: 580, width: 250, height: 80))
        curiositiesButton.setTitleColor(.black, for: .normal)
        curiositiesButton.setTitle("Math funny curiosities", for: .normal)
        curiositiesButton.layer.cornerRadius = 12
        curiositiesButton.layer.borderWidth = 2
        curiositiesButton.layer.borderColor = UIColor(red: 145.0/255, green: 69.0/255, blue: 176.0/255, alpha: 1.0).cgColor
        curiositiesButton.backgroundColor = UIColor(red: 222.0/255, green: 185.0/255, blue: 255.0/255, alpha: 1.0)
        curiositiesButton.addTarget(self, action: #selector(curiositiesButtonClicked(_:)), for: .touchUpInside)
        view.addSubview(curiositiesButton)
        
        self.view = view
    }
    
    @objc public func curiositiesButtonClicked(_ sender: AnyObject?) {
        let curiositiesView = CuriositiesViewController()
        self.present(curiositiesView, animated: true, completion: nil)
    }
    
    @objc public func multiplicationButtonClicked(_ sender: AnyObject?) {
        let questionView = MyViewController()
        self.present(questionView, animated: true, completion: nil)
    }
    
    
}