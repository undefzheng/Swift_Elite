//
//  UIView+LYAdd.swift
//  Elite_Swift
//
//  Created by 不才 on 2018/11/19.
//  Copyright © 2018 appscomm. All rights reserved.
//

import UIKit
import Foundation


extension UIView {
 
    func width() -> CGFloat {
        return self.frame.size.width
    }

    func height() -> CGFloat {
        return self.frame.size.height
    }
    
    func centerX() -> CGFloat {
        return self.center.x
    }
    
    func centerY() -> CGFloat {
        return self.center.y
    }
    
    func origin() -> CGPoint {
        return self.frame.origin
    }
    
    func size() -> CGSize {
        return self.frame.size
    }
    
    func top() -> CGFloat {
        return self.frame.origin.y
    }
    
    func left() -> CGFloat {
        return self.frame.origin.x
    }
    
    func bottom() -> CGFloat {
        return self.frame.origin.y + self.frame.size.height
    }
    
    func right() -> CGFloat {
        return self.frame.origin.x + self.frame.size.width
    }
    
    
}
