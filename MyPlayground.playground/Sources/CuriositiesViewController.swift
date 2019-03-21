import Foundation
import UIKit
import PlaygroundSupport

public class CuriositiesViewController: UIViewController {
    
    public override func loadView() {
        let view = UIView()
        
        let backgroundImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 720, height: 1080))
        backgroundImageView.image = UIImage(named: "numbers_background.png")
        view.addSubview(backgroundImageView)
        
        let titleLabel = UILabel(frame: CGRect(x: 210, y: 250, width: 300, height: 150))
        titleLabel.text = "Choose any curiosity and have fun!!"
        titleLabel.textColor = UIColor(red: 106/255, green: 126/255, blue: 254.0/255, alpha: 1.0)
        titleLabel.numberOfLines = 0
        titleLabel.adjustsFontSizeToFitWidth = true
        let titleFont = UIFont(name: "Marker Felt", size: 50)
        titleLabel.font = titleFont
        titleLabel.textAlignment = NSTextAlignment.center
        view.addSubview(titleLabel)
        
        let phoenixNumberButton = UIButton(frame: CGRect(x: 235, y: 465, width: 250, height: 60))
        phoenixNumberButton.setTitle("The Phoenix Number", for: .normal)
        phoenixNumberButton.layer.cornerRadius = 12
        phoenixNumberButton.layer.borderWidth = 2
        phoenixNumberButton.layer.borderColor = UIColor(red: 145.0/255, green: 69.0/255, blue: 176.0/255, alpha: 1.0).cgColor
        phoenixNumberButton.setTitleColor(.black, for: .normal)
        phoenixNumberButton.backgroundColor = UIColor(red: 222.0/255, green: 185.0/255, blue: 255.0/255, alpha: 1.0)
        phoenixNumberButton.addTarget(self, action: #selector(phoenixNumberButtonClicked(_:)), for: .touchUpInside)
        view.addSubview(phoenixNumberButton)
        
        let onesMultiplicationButton = UIButton(frame: CGRect(x: 235, y: 565, width: 250, height: 60))
        onesMultiplicationButton.setTitle("111... x 111...", for: .normal)
        onesMultiplicationButton.layer.cornerRadius = 12
        onesMultiplicationButton.layer.borderWidth = 2
        onesMultiplicationButton.layer.borderColor = UIColor(red: 145.0/255, green: 69.0/255, blue: 176.0/255, alpha: 1.0).cgColor
        onesMultiplicationButton.setTitleColor(.black, for: .normal)
        onesMultiplicationButton.backgroundColor = UIColor(red: 222.0/255, green: 185.0/255, blue: 255.0/255, alpha: 1.0)
        onesMultiplicationButton.addTarget(self, action: #selector(onesMultiplicationButtonClicked(_:)), for: .touchUpInside)
        view.addSubview(onesMultiplicationButton)
        
        let goBackButton = UIButton(frame: CGRect(x: 15, y: 40, width: 50, height: 50))
        goBackButton.addTarget(self, action: #selector(goBackButtonClicked(_:)), for: .touchUpInside)
        goBackButton.setImage(UIImage(named: "arrow_back.png"), for: .normal)
        view.addSubview(goBackButton)
        
        self.view = view
    }
    
    @objc public func goBackButtonClicked(_ sender: AnyObject?) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc public func onesMultiplicationButtonClicked(_ sender: AnyObject?) {
        let onesMultiplicationView = OnesxCuriosityViewController()
        self.present(onesMultiplicationView, animated: true, completion: nil)
    }
    
    @objc public func phoenixNumberButtonClicked(_ sender: AnyObject?) {
        let phoenixNumberView = PhoenixCuriosityViewController()
        self.present(phoenixNumberView, animated: true, completion: nil)
    }
    
    
}
