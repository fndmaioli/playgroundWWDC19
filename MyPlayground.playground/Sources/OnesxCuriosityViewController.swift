import Foundation
import UIKit
import PlaygroundSupport


public class OnesxCuriosityViewController: UIViewController {
    
    public override func loadView() {
        let view = UIView()
        
        let backgroundImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 720, height: 1080))
        backgroundImageView.image = UIImage(named: "numbers_background.png")
        view.addSubview(backgroundImageView)
        
        let content = UILabel()
        content.frame = CGRect(x: 160, y: 200, width: 400, height: 75)
        content.text = "111... x 111..."
        content.textColor = UIColor(red: 41.0/255, green: 8.0/255, blue: 149.0/255, alpha: 1.0)
        content.font = UIFont(name: "Chalkboard SE", size: 35)
        content.textAlignment = NSTextAlignment.center
        view.addSubview(content)
        
        let informationLabel = UILabel(frame: CGRect(x: 210, y: 260, width: 300, height: 500))
        informationLabel.text = "When you try to multiply 111 by itself the result is the following palindrome:\n\n12321\n\nNote that the digit in the middle of the result is the count of 1s in the multiplied number. And this pattern keeps going on till:"
        informationLabel.textColor = UIColor(red: 41.0/255, green: 8.0/255, blue: 149.0/255, alpha: 1.0)
        informationLabel.numberOfLines = 0
        informationLabel.adjustsFontSizeToFitWidth = true
        informationLabel.font = UIFont(name: "Chalkboard SE", size: 25)
        informationLabel.textAlignment = NSTextAlignment.center
        view.addSubview(informationLabel)
        
        let multiplicationLabel = UILabel(frame: CGRect(x: 160, y: 750, width: 400, height: 100))
        multiplicationLabel.text = "111 111 111 x 111 111 111 = 12345678987654321"
        multiplicationLabel.textColor = UIColor(red: 41.0/255, green: 8.0/255, blue: 149.0/255, alpha: 1.0)
        multiplicationLabel.numberOfLines = 0
        multiplicationLabel.adjustsFontSizeToFitWidth = true
        multiplicationLabel.font = UIFont(name: "Chalkboard SE", size: 25)
        multiplicationLabel.textAlignment = NSTextAlignment.center
        view.addSubview(multiplicationLabel)
        
        let goBackButton = UIButton(frame: CGRect(x: 15, y: 40, width: 50, height: 50))
        goBackButton.addTarget(self, action: #selector(goBackButtonClicked(_:)), for: .touchUpInside)
        goBackButton.setImage(UIImage(named: "arrow_back.png"), for: .normal)
        view.addSubview(goBackButton)
        
        self.view = view
    }
    
    @objc public func goBackButtonClicked(_ sender: AnyObject?) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
}
