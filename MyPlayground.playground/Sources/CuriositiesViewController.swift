import Foundation
import UIKit
import PlaygroundSupport

public class CuriositiesViewController: MyViewController {
    
    public override func loadView() {
        let view = UIView()
        
        let backgroundImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 720, height: 1080))
        backgroundImageView.image = UIImage(named: "numbers_background.png")
        view.addSubview(backgroundImageView)
        
        let titleLabel = UILabel(frame: CGRect(x: 210, y: 270, width: 300, height: 100))
        titleLabel.text = "Choose any curiosity and have fun!!"
//        titleLabel.backgroundColor = .red
        titleLabel.numberOfLines = 0
        titleLabel.adjustsFontSizeToFitWidth = true
        let titleFont = UIFont(name: "Didot", size: 30)
        titleLabel.font = titleFont
        
        titleLabel.textAlignment = NSTextAlignment.center
        view.addSubview(titleLabel)
        
        let phoenixNumberButton = UIButton(frame: CGRect(x: 235, y: 450, width: 250, height: 60))
        phoenixNumberButton.setTitle("The Phoenix Number", for: .normal)
        phoenixNumberButton.layer.cornerRadius = 12
        phoenixNumberButton.layer.borderWidth = 2
        phoenixNumberButton.layer.borderColor = UIColor(red: 145.0/255, green: 69.0/255, blue: 176.0/255, alpha: 1.0).cgColor
        phoenixNumberButton.backgroundColor = UIColor(red: 222.0/255, green: 185.0/255, blue: 255.0/255, alpha: 1.0)
        phoenixNumberButton.setTitleColor(.black, for: .normal)
        phoenixNumberButton.addTarget(self, action: #selector(phoenixNumberButtonClicked(_:)), for: .touchUpInside)
        view.addSubview(phoenixNumberButton)
        
        let goBackButton = UIButton(frame: CGRect(x: 18, y: 40, width: 50, height: 50))
        goBackButton.addTarget(self, action: #selector(goBackButtonClicked(_:)), for: .touchUpInside)
        
        goBackButton.backgroundColor = .red
        view.addSubview(goBackButton)
        
        self.view = view
    }
    
    @objc public func goBackButtonClicked(_ sender: AnyObject?) {
        let initialView = InitialViewController()
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc public func phoenixNumberButtonClicked(_ sender: AnyObject?) {
        let questionView = MyViewController()
        self.present(questionView, animated: true, completion: nil)
    }
    
    
}
