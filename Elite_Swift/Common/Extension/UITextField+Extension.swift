//
//  UITextField+Extension.swift
//  Elite_Swift
//
//  Created by 不才 on 2018/11/13.
//  Copyright © 2018 appscomm. All rights reserved.
//

import UIKit
import Foundation
var maxTextNumberDefalut = 15

extension UITextField{
    /// 使用runtime给textField添加最大输入数属性,默认15
    var maxTextNumber: Int {
        set {
            objc_setAssociatedObject(self, &maxTextNumberDefalut, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
        get {
            if let rs = objc_getAssociatedObject(self, &maxTextNumberDefalut) as? Int {
                return rs
            }
            return 15
        }
    }
    
    /// 添加判断数量的方法
    func addChangeTextTarger() {
        self.addTarget(self, action: #selector(changeText), for: .editingChanged)
    }
    
    @objc func changeText() {
        //判断是不是在拼音状态,拼音状态不截取文本
        if let positionRange = self.markedTextRange{
            guard self.position(from: positionRange.start, offset: 0) != nil else {
                checkTextFieldText()
                return
            }
        }else {
            checkTextFieldText()
        }
    }
    
    func checkTextFieldText() {
        guard (self.text?.lenght)! <= maxTextNumber else {
            self.text = (self.text?.stringCut(end: maxTextNumber))!
            return
        }
    }
}

extension String {
    var lenght: Int{
        ///更改成其他的影响含有emoji协议的签名
        return self.utf16.count
    }
    
    func stringCut(end: Int) -> String {
        if !(end <= count) { return self }
        let sInde = index(startIndex, offsetBy: end)
        return String(self[..<sInde])
    }
}
