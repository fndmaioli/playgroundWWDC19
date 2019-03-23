import Foundation
import UIKit
import PlaygroundSupport


public class PhoenixCuriosityViewController: UIViewController {
    
    public override func loadView() {
        let view = UIView()
        
        let backgroundImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 720, height: 1080))
        backgroundImageView.image = UIImage(named: "numbers_background.png")
        view.addSubview(backgroundImageView)
        
        let content = UILabel()
        content.frame = CGRect(x: 160, y: 200, width: 400, height: 75)
        content.text = "The Phoenix Number"
        content.textColor = UIColor(red: 41.0/255, green: 8.0/255, blue: 149.0/255, alpha: 1.0)
        content.font = UIFont(name: "Chalkboard SE", size: 35)
        content.textAlignment = NSTextAlignment.center
        view.addSubview(content)
        
        let informationLabel = UILabel(frame: CGRect(x: 185, y: 280, width: 350, height: 500))
        informationLabel.text = "142857, this best-known cyclic number. When multiplied by any numbers between 1 and 6 the product is a rearrangement of itself maintaining the order:\nx1 = 142857 \nx2 = 285714 \nx3 = 428571 \nx4 = 571428 \nx5 = 714285 \nx6 = 857142"
        informationLabel.textColor = UIColor(red: 41.0/255, green: 8.0/255, blue: 149.0/255, alpha: 1.0)
        informationLabel.numberOfLines = 0
        informationLabel.adjustsFontSizeToFitWidth = true
        informationLabel.font = UIFont(name: "Chalkboard SE", size: 25)
        informationLabel.textAlignment = NSTextAlignment.center
        view.addSubview(informationLabel)
        
        let informationLabel2 = UILabel(frame: CGRect(x: 185, y: 720, width: 350, height: 150))
        informationLabel2.text = "Then, breaking the pattern:\nx7 = 999999"
        informationLabel2.textColor = UIColor(red: 41.0/255, green: 8.0/255, blue: 149.0/255, alpha: 1.0)
        informationLabel2.numberOfLines = 0
        informationLabel2.adjustsFontSizeToFitWidth = true
        informationLabel2.font = UIFont(name: "Chalkboard SE", size: 25)
        informationLabel2.textAlignment = NSTextAlignment.center
        view.addSubview(informationLabel2)
        
        let goBackButton = UIButton(frame: CGRect(x: 15, y: 40, width: 50, height: 50))
        goBackButton.addTarget(self, action: #selector(goBackButtonClicked(_:)), for: .touchUpInside)
        goBackButton.setImage(UIImage(named: "arrow_left.png"), for: .normal)
        view.addSubview(goBackButton)
        
        self.view = view
    }
    
    @objc public func goBackButtonClicked(_ sender: AnyObject?) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
}
