//
//  LoginView.swift
//  Elite_Swift
//
//  Created by 不才 on 2018/11/9.
//  Copyright © 2018 appscomm. All rights reserved.
//

import UIKit

private let padding: CGFloat = 20
private let pHeight: CGFloat = 35
private let frameX: CGFloat = 20

class LoginView: UIView {
    
    //定义一个闭包类型
    typealias loginBlock = (_ btnTag: Int) -> Void
    //声明一个变量
    var callBack: loginBlock?
    //定义方法，方法的参数和闭包loginBlock类型一致，并赋值给callBack
    func callBackBlocka(block: @escaping loginBlock) {
        callBack = block
    }
    
    // MARK: init
    override init(frame: CGRect) {
        super.init(frame: frame)
        phoneTF.delegate = self
        passwordTF.delegate = self
        self.setUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: UI
    private func setUI(){
        self.addSubview(phoneTF)
        self.addSubview(passwordTF)
        self.addSubview(forgetButton)
        self.forgetButton.addSubview(buttonLine)
        self.addSubview(sinInBtn)
    }
    
    let phoneTF: LYTextField = {
        let phoneText = LYTextField(frame: CGRect(x: frameX, y: 0, width: ScreenInfo.LYScreenWidth - 40, height: pHeight), isSecure: false)
        phoneText.label.text = "用户名"
        phoneText.maxTextNumber = 30
        phoneText.font = UIFont.systemFont(ofSize: 18)
        phoneText.clearButtonMode = .always
        return phoneText
    }()
    
    let passwordTF: LYTextField = {
        let password = LYTextField(frame: CGRect(x: frameX, y: pHeight+padding, width: ScreenInfo.LYScreenWidth - 40, height: pHeight), isSecure: true)
        password.font = UIFont.systemFont(ofSize: 18)
        password.label.text = "密码"
        password.maxTextNumber = 15
        return password
    }()
    
    //MARK: 懒加载
    lazy var forgetButton: UIButton = {
        let forgetBtn = UIButton.init(type: .custom)
        forgetBtn.frame = CGRect(x: frameX, y: pHeight*2+padding+10, width: 55, height: pHeight)
        forgetBtn.setTitle("忘记密码", for: .normal)
        forgetBtn.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        forgetBtn.contentHorizontalAlignment = .left
        forgetBtn.addTarget(self, action: #selector(forgetBtnClick), for: .touchUpInside)
        return forgetBtn
    }()
    
    lazy var buttonLine: UIView = {
        let line = UIView()
        let lineHeight = 1 / UIScreen.main.scale
        line.frame = CGRect(x: 0, y: pHeight - 10, width: self.forgetButton.frame.width, height: lineHeight)
        line.backgroundColor = UIColor.white
        return line
    }()
    
    lazy var sinInBtn: UIButton = {
        let sinBtn = UIButton.init(type: .custom)
        sinBtn.frame = CGRect(x: 0, y: pHeight*4+padding, width: ScreenInfo.LYScreenWidth, height: pHeight*1.2)
        sinBtn.backgroundColor = UIColor.white
        sinBtn.setTitleColor(UIColor.x4FB0FF, for: .normal)
        sinBtn.setTitle("登录", for: .normal)
        sinBtn.addTarget(self, action: #selector(sinInClick), for: .touchUpInside)
        return sinBtn
    }()
    
    
    //点击方法
    @objc func forgetBtnClick() {
        print("点击")
    }
  
    @objc func sinInClick() {
        if callBack != nil {
            callBack!(LoinType.LoinTypeLogin.rawValue)
        }
    }
}

extension LoginView: UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if textField is LYTextField {
            let tf = textField as! LYTextField
            if tf.text == ""{
                tf.changeLabel()
            }
        }
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField is LYTextField {
            let tf = textField as! LYTextField
            if tf.text == "" {
                tf.disChageLabel()
            }
        }
    }
}
