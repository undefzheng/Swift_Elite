//
//  LoginViewController.swift
//  Elite_Swift
//
//  Created by 不才 on 2018/11/8.
//  Copyright © 2018 appscomm. All rights reserved.
//

import UIKit

class LoginViewController: LYBaseViewController {

    //MARK: 属性
    let bottomView: LoginView = {
        let bottomLogin = LoginView()
        return bottomLogin
    }()
    
    //MARK: init
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(self.logoImage)
        self.view.addSubview(self.navagationBack)
        self.view.addSubview(bottomView)
        self.setUI()
        
        //闭包回调
        bottomView.callBackBlocka { (tag) in
            if tag == LoinType.LoinTypeLogin.rawValue{
                self.navigationController?.pushViewController(ActivityViewController(), animated: true)
            }
            
            if tag == LoinType.LoinTypePassword.rawValue{
                
            }
        }
    }
    
    /// 点击任意位置取消第一响应,弹回键盘
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.view.endEditing(true)
    }

    // MARK: 设置UI
    func setUI() {
        self.logoImage.snp.makeConstraints { (make) in
            make.top.equalTo(88)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(CGSize.init(width: 142, height: 185))
        }
        
        self.navagationBack.snp.makeConstraints { (make) in
            make.top.equalTo(25)
            make.size.equalTo(40)
            make.left.equalTo(10)
        }
        
        bottomView.snp.makeConstraints { (make) in
            make.top.equalTo(self.logoImage.snp.bottom).offset(40)
            make.left.equalTo(0)
            make.right.equalTo(-0)
            make.bottom.equalTo(-0)
        }
    }
    
    // MARK: 懒加载
    lazy var logoImage: UIImageView = {
        let logo = UIImageView.init()
        logo.image = UIImage(named: "touch")
        logo.isUserInteractionEnabled = true
        return logo
    }()
    
    lazy var navagationBack: UIButton = {
        let back = UIButton.init(type: .custom)
        back.setImage(UIImage(named: "ArrowmainLeft"), for: .normal)
        back.addTarget(self, action: #selector(backClick), for: .touchUpInside)
        return back
    }()
    
    // MARK: 点击方法
    @objc func backClick() {
        self.navigationController?.popViewController(animated: true)
    }

}
