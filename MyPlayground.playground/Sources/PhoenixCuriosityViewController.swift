import Foundation
import UIKit
import PlaygroundSupport


public class PhoenixCuriosityViewController: UIViewController {
    
    public override func loadView() {
        let view = UIView()
        
        let backgroundImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 720, height: 1080))
        backgroundImageView.image = UIImage(named: "general_background.png")
        view.addSubview(backgroundImageView)
        
        let content = UILabel()
        content.frame = CGRect(x: 160, y: 200, width: 400, height: 75)
        content.text = "The Phoenix Number"
        content.textColor = UIColor(red: 106.0/255, green: 125.0/255, blue: 254.0/255, alpha: 1.0)
        content.font = UIFont(name: "Chalkboard SE", size: 35)
        content.textAlignment = NSTextAlignment.center
        view.addSubview(content)
        
        let informationLabel = UILabel(frame: CGRect(x: 210, y: 300, width: 300, height: 200))
        informationLabel.text = "142857, this best-known cyclic number. When multiplied by any numbers between 1 and 6 the product is a rearrangement of itself maintaining the order:"
        informationLabel.numberOfLines = 0
        informationLabel.adjustsFontSizeToFitWidth = true
        informationLabel.font = UIFont(name: "Chalkboard SE", size: 30)
        informationLabel.textAlignment = NSTextAlignment.center
        view.addSubview(informationLabel)
        
        let multiplicationsLabel = UILabel(frame: CGRect(x: 210, y: 270, width: 300, height: 400))
        multiplicationsLabel.text = "x1 = 142857 \nx2 = 285714 \nx3 = 428571 \nx4 = 571428 \nx5 = 714285 \nx6 = 857142"
        multiplicationsLabel.numberOfLines = 0
        multiplicationsLabel.adjustsFontSizeToFitWidth = true
        multiplicationsLabel.font = UIFont(name: "Chalkboard SE", size: 20)
        multiplicationsLabel.textAlignment = NSTextAlignment.center
        view.addSubview(multiplicationsLabel)
        
        let informationLabel2 = UILabel(frame: CGRect(x: 210, y: 540, width: 300, height: 200))
        informationLabel2.text = "But, funnily enough, when we multiply 142857 by 7 the result is:"
        informationLabel2.numberOfLines = 0
        informationLabel2.adjustsFontSizeToFitWidth = true
        informationLabel2.font = UIFont(name: "Chalkboard SE", size: 23)
        informationLabel2.textAlignment = NSTextAlignment.center
        view.addSubview(informationLabel2)
        
        let multiplicationLabel = UILabel(frame: CGRect(x: 210, y: 690, width: 300, height: 100))
        multiplicationLabel.text = "999999"
        multiplicationLabel.numberOfLines = 0
        multiplicationLabel.adjustsFontSizeToFitWidth = true
        multiplicationLabel.font = UIFont(name: "Chalkboard SE", size: 20)
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
