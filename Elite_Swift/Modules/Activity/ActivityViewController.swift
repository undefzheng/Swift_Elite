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
        self.title = "主页"
        setNavRightButtonWithText(text: "同步", sel: #selector(sysncClick))
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = false
    }
    
    @objc func sysncClick() {
       
    }

}
