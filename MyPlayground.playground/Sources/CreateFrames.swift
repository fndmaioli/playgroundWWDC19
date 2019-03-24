import Foundation
import UIKit

public func createRandomFrames() -> [CGRect]{
    var array = [CGRect]()
    
    array.append(CGRect(x: 120, y: 360, width: 100, height: 100))
    
    array.append(CGRect(x: 500, y: 350, width: 100, height: 100))
    
    array.append(CGRect(x: 200, y: 930, width: 100, height: 100))
    
    array.append(CGRect(x: 580, y: 650, width: 100, height: 100))
    
    array.append(CGRect(x: 80, y: 880, width: 100, height: 100))
    
    array.append(CGRect(x: 360, y: 690, width: 100, height: 100))
    
    array.append(CGRect(x: 170, y: 670, width: 100, height: 100))

    array.append(CGRect(x: 330, y: 450, width: 100, height: 100))
    
    array.append(CGRect(x: 350, y: 910, width: 100, height: 100))
    
    array.append(CGRect(x: 540, y: 920, width: 100, height: 100))
    
    return array.shuffled()
}
