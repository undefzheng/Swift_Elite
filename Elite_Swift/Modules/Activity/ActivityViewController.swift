//
//  ActivityViewController.swift
//  Elite_Swift
//
//  Created by 不才 on 2018/11/16.
//  Copyright © 2018 appscomm. All rights reserved.
//

import UIKit

class ActivityViewController: LYBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let testBtn = UIButton.init(type: .custom)
        testBtn.frame = CGRect(x: 0, y: 100, width: mWidth(), height: 20)
        testBtn.backgroundColor = UIColor.red
        testBtn.setTitle("点击", for: .normal)
        testBtn.addTarget(self, action: #selector(click), for: .touchUpInside)
        self.view.addSubview(testBtn)
    }
    
    @objc func click() {
        
       customAleatView(title: "测试", message: "详细信息")
        
    }

}
