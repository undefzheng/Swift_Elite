//
//  IndexViewController.swift
//  Elite_Swift
//
//  Created by 不才 on 2018/11/8.
//  Copyright © 2018 appscomm. All rights reserved.
//

import UIKit

class IndexViewController: LYBaseViewController {

    //MARK: 生命周期
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.black
        
        self.view.addSubview(self.backgroupView)
        self.view.addSubview(self.loginBtn)
        self.view.addSubview(self.sinUp)
        self.view.addSubview(self.lineView)
        self.view.addSubview(self.facebook)
        self.view.addSubview(self.twitter)
        self.view.addSubview(self.google)
        self.setUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }

    //MARK: 布局
    func setUI() {
        self.sinUp.snp.makeConstraints { (make) in
            make.bottom.equalTo(-129)
            make.left.equalTo(22)
            make.right.equalTo(-55)
            make.height.equalTo(49)
        }
        
        self.loginBtn.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.sinUp.snp.top).offset(-18)
            make.left.equalTo(55)
            make.right.equalTo(-22)
            make.height.equalTo(49)
        }
        
        self.lineView.snp.makeConstraints { (make) in
            make.top.equalTo(self.sinUp.snp.bottom).offset(25)
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.height.equalTo(1)
        }
        
        self.twitter.snp.makeConstraints { (make) in
            make.bottom.equalTo(-40)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(30)
        }
        
        self.facebook.snp.makeConstraints { (make) in
            make.right.equalTo(self.twitter.snp.left).offset(-55)
            make.top.equalTo(self.twitter.snp.top)
            make.width.height.equalTo(self.twitter.snp.width)
        }
 
        self.google.snp.makeConstraints { (make) in
            make.left.equalTo(self.twitter.snp.right).offset(55)
            make.top.equalTo(self.twitter.snp.top)
            make.width.height.equalTo(self.twitter.snp.width)
        }
    }
    
    //MARK: 懒加载
    lazy var backgroupView: UIImageView = {
        let backView = UIImageView.init(frame: CGRect.init(x: 0, y: 0, width: ScreenInfo.LYScreenWidth, height: ScreenInfo.LYScreenHeight))
        backView.image = UIImage.init(named: "loginInitBg")
        return backView
    }()
    
    lazy var loginBtn: UIButton = {
        let button = UIButton.init(type:.custom)
        button.setTitle("Log In", for: .normal)
        button.setBackgroundImage(UIImage(named: "Rectangle3"), for: .normal)
        button.addTarget(self, action: #selector(loginClick), for: .touchUpInside)
        return button
    }()
    
    lazy var sinUp: UIButton = {
        let button = UIButton.init(type:.custom)
        button.setTitle("Sign Up", for: .normal)
        button.addTarget(self, action: #selector(signUpClick), for: .touchUpInside)
        button.setBackgroundImage(UIImage(named: "Rectangle3copy"), for: .normal)
        return button
    }()
    
    lazy var lineView: UIView = {
        let lineView = UIView.init()
        lineView.backgroundColor = UIColor.white
        return lineView
    }()
    
    lazy var facebook: UIButton = {
        let facebook = UIButton.init(type:.custom)
        facebook.setBackgroundImage(UIImage.init(named: "facebookBg"), for: .normal)
        facebook.addTarget(self, action: #selector(facebookClick), for: .touchUpInside)
        return facebook
    }()
    
    lazy var twitter: UIButton = {
        let twitter = UIButton.init(type: .custom)
        twitter.setBackgroundImage(UIImage.init(named: "twitterBg"), for: .normal)
        twitter.addTarget(self, action: #selector(twitterClick), for: .touchUpInside)
        return twitter
    }()
    
    lazy var google: UIButton = {
        let google = UIButton.init(type: .custom)
        google.setBackgroundImage(UIImage.init(named: "googleBg"), for: .normal)
        google.addTarget(self, action: #selector(googleClick), for: .touchUpInside)
        return google
    }()
    
}

extension IndexViewController{
    
    //点击事件
    @objc func loginClick() {
        self.navigationController?.pushViewController(LoginViewController(), animated: true)
    }
    
    @objc func signUpClick() {
        print("注册")
    }
    
    @objc func facebookClick() {
        print("facebook")
    }
    
    @objc func twitterClick() {
        print("twiiter")
    }
    
    @objc func googleClick() {
        print("google")
    }
}
