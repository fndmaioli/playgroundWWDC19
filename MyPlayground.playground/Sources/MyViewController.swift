import Foundation
import UIKit
import PlaygroundSupport

public class MyViewController : UIViewController {
    
    public override func loadView() {
        let view = UIView()
        view.backgroundColor = .white
        
        let label = UILabel()
        label.frame = CGRect(x: 90, y: 30, width: 200, height: 20)
        label.text = "17 x 24 = ?"
        label.textAlignment = NSTextAlignment.center
        label.textColor = .black
        view.addSubview(label)
        
        let alternative1 = AlternativeButton(buttonTitle: "5", frame: CGRect(x: 90, y: 90, width: 100, height: 100))
        view.addSubview(alternative1.button)
        
        let alternative2 = AlternativeButton(buttonTitle: "103", frame: CGRect(x: 190, y: 190, width: 100, height: 100))
        view.addSubview(alternative2.button)
        
        let alternative3 = AlternativeButton(buttonTitle: "408", frame: CGRect(x: 220, y: 370, width: 100, height: 100))
        view.addSubview(alternative3.button)
        
        let alternative4 = AlternativeButton(buttonTitle: "9", frame: CGRect(x: 50, y: 480, width: 100, height: 100))
        view.addSubview(alternative4.button)
        
        let alternative5 = AlternativeButton(buttonTitle: "79", frame: CGRect(x: 80, y: 300, width: 100, height: 100))
        view.addSubview(alternative5.button)
        
        self.view = view
    }
}
