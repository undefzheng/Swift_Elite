//
//  LYBaseViewController.swift
//  Elite_Swift
//
//  Created by 不才 on 2018/11/8.
//  Copyright © 2018 appscomm. All rights reserved.
//

import UIKit

class LYBaseViewController: UIViewController {

    typealias difneBlock = ()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.mainColor
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    
}

// MARK: -屏幕宽高相关的
extension LYBaseViewController{

    //tabbar高度
     func tabBarHeight() -> CGFloat {
        if !(self.tabBarController != nil) || (self.tabBarController?.tabBar.isHidden)! {
            return 0
        }
        if (isIphoneX()) {
            
            return 83;
        }
        return 49;
    }
    
    //返回
    func back() {
        self.navigationController?.popViewController(animated: true)
    }
    
    //y
    func y() -> CGFloat {
        return 0
    }
    
    //宽度
    func mWidth() -> CGFloat{
        return UIScreen.main.bounds.size.width
    }
    
    //高度
    func mHeight() -> CGFloat {
        return UIScreen.main.bounds.size.height - ScreenInfo.navgationHeight - tabBarHeight()
    }
    
    func viewFrame() -> CGRect {
        return CGRect(x: 0, y: y(), width: mWidth(), height: mHeight())
    }
    
    /// 获取iPhoneX homeIndicator 的高度
    func homeIndicatorHeight() -> CGFloat {
        return isIphoneX() ? 34 : 0
    }
    
}

// MARK: -系统的提示
extension LYBaseViewController {
    
    
    func alertMsg(msg: NSString, cancleSEL: Selector, confirmSEL: Selector)  {
        self.systemAlert(msg: msg, cancelText: "取消", cancel: cancleSEL, confirmText: "确认", confirm: confirmSEL)
    }
    
    /// 调用系统的提示
    ///
    /// - Parameters:
    ///   - msg: 文本
    ///   - cancelText: 取消文本
    ///   - cancel: 取消事件
    ///   - confirmText: 确认文本
    ///   - confirm: 确认事件
    func systemAlert(msg: NSString,cancelText: NSString,cancel: Selector,confirmText: NSString, confirm: Selector) -> Void {
       
        weak var vc: LYBaseViewController?
        let alertCtrl = UIAlertController.init(title: nil, message: msg as String, preferredStyle: .alert)
        
        let confirmAction = UIAlertAction.init(title: confirmText as String, style: .default) { (action) in
            vc?.performSelector(onMainThread: confirm, with: nil, waitUntilDone: true)
        }
        
        let cancleAction = UIAlertAction.init(title: cancelText as String, style: .cancel) { (action) in
            vc?.performSelector(onMainThread: cancel, with: nil, waitUntilDone: true)
        }
        
        if cancelText.length > 0{
            alertCtrl.addAction(cancleAction)
        }
        if confirmText.length > 0 {
            alertCtrl.addAction(confirmAction)
        }
        
        self.present(alertCtrl, animated: true, completion: nil)
        
    }
}

//自定义提醒款
extension LYBaseViewController {
    
    func customAleatView(title: NSString, message: NSString)  {
        let alertView = AlertView.init(frame: self.view.bounds, title: title, message: message)
        let actionDefin = AlertAction().aciotn(title: "确定") { (aciont) in
            print(aciont.title as Any)
        }
        let actionCancle = AlertAction().aciotn(title: "取消") { (action) in
            print(action.title as Any)
        }
        alertView.setActions(actions: [actionDefin,actionCancle])
        alertView.show()
        self.view.addSubview(alertView)
    }
}
