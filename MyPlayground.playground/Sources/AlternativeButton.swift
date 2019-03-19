import Foundation
import UIKit

class AlternativeButton {
    
    var button: UIButton = UIButton()
    
    init(buttonTitle: String){
        self.button.setBackgroundImage(UIImage(named: "buttonCircle.png"), for: .normal)
        self.button.setTitle(buttonTitle, for: .normal)
        self.button.setTitleColor(.black, for: .normal)
        
    }
    
    
    
    
}
