import Foundation
import UIKit

public func createRandomFrames() -> [CGRect]{
    var array = [CGRect]()
    
    array.append(CGRect(x: 120, y: 260, width: 100, height: 100))
    
    array.append(CGRect(x: 500, y: 200, width: 100, height: 100))
    
    array.append(CGRect(x: 200, y: 900, width: 100, height: 100))
    
    array.append(CGRect(x: 600, y: 500, width: 100, height: 100))
    
    array.append(CGRect(x: 80, y: 730, width: 100, height: 100))
    
    array.append(CGRect(x: 360, y: 540, width: 100, height: 100))
    
    array.append(CGRect(x: 170, y: 500, width: 100, height: 100))

    array.append(CGRect(x: 330, y: 300, width: 100, height: 100))
    
    array.append(CGRect(x: 350, y: 770, width: 100, height: 100))
    
    array.append(CGRect(x: 540, y: 800, width: 100, height: 100))
    
    return array.shuffled()
}
