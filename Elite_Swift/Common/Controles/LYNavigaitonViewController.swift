//
//  LYNavigaitonViewController.swift
//  Elite_Swift
//
//  Created by 不才 on 2018/11/8.
//  Copyright © 2018 appscomm. All rights reserved.
//

import UIKit

class LYNavigaitonViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    /// 返回状态栏颜色
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
    /// 设置导航栏属性
    override func loadView() {
        super.loadView()
        
        let navBar = self.navigationBar
        let item = UIBarButtonItem.appearance()
        navBar.barTintColor =  UIColor.navTintColor
        navBar.tintColor = UIColor.white
        navBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.navtitleColor,NSAttributedString.Key.font:UIFont.systemFont(ofSize: 18)]
    item.setTitleTextAttributes([NSAttributedString.Key.foregroundColor:UIColor.navtitleColor,NSAttributedString.Key.font:UIFont.systemFont(ofSize: 16)], for: .normal)
        
    }
}
