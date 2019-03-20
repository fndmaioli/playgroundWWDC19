import Foundation

import UIKit

public class TipButton: UIButton {
    
    public var content: String = ""
    
    public init(content: String, frame: CGRect){
        super.init(frame: frame)
        
        let image = UIImage(named: "buttonCircle.png")
        self.setBackgroundImage(image, for: .normal)
        
        self.setTitle("?", for: .normal)
        self.setTitleColor(.black, for: .normal)
        
        //self.button.transform = CGAffineTransform.identity.rotated(by: CGFloat.pi*0.2)
        self.frame = frame
        
        self.content = content
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    
    
}
