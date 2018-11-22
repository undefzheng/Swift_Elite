//
//  NSString+LYAdd.swift
//  Elite_Swift
//
//  Created by 不才 on 2018/11/19.
//  Copyright © 2018 appscomm. All rights reserved.
//

import UIKit

extension NSString {

    func size(font: UIFont, multilinesSize:CGSize) -> CGSize {
        
        return self.length > 0 ? self.boundingRect(with: multilinesSize, options: [.usesLineFragmentOrigin,.usesFontLeading], attributes: [NSAttributedString.Key.font:font], context: nil).size : CGSize.zero
    }
    
    func sizefont(font: UIFont) -> CGSize {
        return self.length > 0 ? self.size(withAttributes: [NSAttributedString.Key.font:font]) : CGSize.zero
    }
}
