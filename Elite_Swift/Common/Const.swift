//
//  Const.swift
//  Elite_Swift
//
//  Created by 不才 on 2018/11/7.
//  Copyright © 2018 appscomm. All rights reserved.
//

import Foundation
import UIKit
import SnapKit
import SwiftMessages

// MARK: - 颜色
extension UIColor{
   private class func colorWithRGBA(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) -> UIColor {
        return UIColor(red: r/255, green: g/255, blue: b/255, alpha: a)
    }
}

extension UIColor{
    @nonobjc static let navTintColor = UIColor.colorWithRGBA(r: 0.0, g: 0.0, b: 0.0, a: 1)
    @nonobjc static let navtitleColor = UIColor.colorWithRGBA(r: 255, g: 255, b: 255, a: 1)
    @nonobjc static let mainColor = UIColor.colorWithRGBA(r: 115, g: 48, b: 139, a: 1)
    @nonobjc static let x333333_alpha = UIColor.colorWithRGBA(r: 255, g: 255, b: 255, a: 1)
    @nonobjc static let x4FB0FF = UIColor.colorWithRGBA(r: 88, g: 183, b: 179, a: 1)
    
    @nonobjc static let modalBackgroundColor = UIColor.colorWithRGBA(r: 0, g: 0, b: 0, a: 0.6)
    @nonobjc static let modalTintColor = UIColor.colorWithRGBA(r: 50, g: 54, b: 64, a: 1)
    @nonobjc static let modalTitleColor = UIColor.white
    @nonobjc static let modalMessageColor = UIColor.colorWithRGBA(r: 255, g: 255, b: 255, a: 1)
    @nonobjc static let modalNormalBtnColor = UIColor.colorWithRGBA(r: 200, g: 200, b: 200, a: 1)
    @nonobjc static let modalCancelBtnColor = UIColor.colorWithRGBA(r: 200, g: 200, b: 200, a: 1)
}

// MARK: - 屏幕

func isIphoneX() -> Bool {
    return UIScreen.main.bounds.equalTo(CGRect(x: 0, y: 0, width: 375, height: 812))
}

struct ScreenInfo {
    static let Frame = UIScreen.main.bounds
    static let LYScreenWidth = Frame.width
    static let LYScreenHeight = Frame.height
    static let navgationHeight:CGFloat = navBarHeight()
    static let SCALE_6 = LYScreenWidth / 375.0
    
    static private func navBarHeight() -> CGFloat {
        return isIphoneX() ? 88 : 64;
    }
}

enum LoinType: Int {
    
    case LoinTypeLogin = 0
    case LoinTypePassword
    
}
