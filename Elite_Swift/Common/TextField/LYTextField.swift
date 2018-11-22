//
//  LYTextField.swift
//  Elite_Swift
//
//  Created by 不才 on 2018/11/13.
//  Copyright © 2018 appscomm. All rights reserved.
//

import UIKit

class LYTextField: UITextField {

    private let buttonLine: CALayer = {
        let line = CALayer()
        line.backgroundColor = UIColor.white.cgColor
        return line
    }()

    public let label: UILabel = {
        let lable = UILabel()
        lable.font = UIFont.systemFont(ofSize: 16)
        lable.textColor = UIColor.x333333_alpha
        lable.textAlignment = .left
        lable.frame = CGRect(x: 0, y: 0, width: 100, height: 30)
        return lable
    }()
    
    //MARK: init方法
    init(frame: CGRect, isSecure: Bool) {
        super.init(frame: frame)
        self.textColor = UIColor.white
        self.isSecureTextEntry = isSecure
        drawMyView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let lineHeight = 1 / UIScreen.main.scale
        buttonLine.frame = CGRect(x: 0, y: self.bounds.height - lineHeight, width: self.bounds.width, height: lineHeight)
    }
    
    // 重写rightView方法 来实现密码状态下的眼睛按钮与非密码状态下的清空按钮对齐
    override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        var rect = super.rightViewRect(forBounds: bounds)
        rect.origin.x = -4
        return rect
    }
    
    //MARK: 添加view
    private func drawMyView(){
        self.layer.addSublayer(buttonLine)
        self.addSubview(label)
        if self.isSecureTextEntry {
            let passworld = passworldButton(frame: CGRect(x: 0, y: 0, width: 21, height: 12.5))
            passworld.addTarget(self, action: #selector(togglePasswordHidden(sender:)), for: .touchUpInside)
            self.rightView = passworld
            self.rightViewMode = .always
        }
    }
    
     @objc func togglePasswordHidden(sender:passworldButton)  {
        self.isSecureTextEntry = !self.isSecureTextEntry
        sender.isSelected = !sender.isSelected
    }
    
    //MARK:  公共方法
    //placeholder上移的方法(点击空的textfieldd时调用)
    public func changeLabel() {
        UIView.animate(withDuration: 0.4) {
            self.label.frame = CGRect(x: 0, y: -20, width: 100, height: 20)
            self.label.font = UIFont.systemFont(ofSize: 10)
            self.label.textColor = UIColor.x4FB0FF
        }
    }
    
    //placeholder恢复默认状态(清空文本的时候调用)
    public func disChageLabel() {
        UIView.animate(withDuration: 0.4) {
            self.label.frame = CGRect(x: 0, y: 0, width: 100, height: 20)
            self.label.font = UIFont.systemFont(ofSize: 16)
            self.label.textColor = UIColor.x333333_alpha
        }
    }
    
}

class passworldButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func config() {
        self.setImage(UIImage(named: "close_eye"), for: .normal)
        self.setImage(UIImage(named: "open_eye"), for: .selected)
    }
}
