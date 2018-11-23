//
//  LYBaseViewController.swift
//  Elite_Swift
//
//  Created by 不才 on 2018/11/8.
//  Copyright © 2018 appscomm. All rights reserved.
//

import UIKit

class LYBaseViewController: UIViewController {
    
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
        systemAlert(msg: msg, cancelText: "取消", cancel: cancleSEL, confirmText: "确认", confirm: confirmSEL)
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
       
        let alertCtrl = UIAlertController.init(title: nil, message: msg as String, preferredStyle: .alert)
        
        let confirmAction = UIAlertAction.init(title: confirmText as String, style: .default) { (action) in
            self.performSelector(onMainThread: confirm, with: nil, waitUntilDone: true)
        }
        
        let cancleAction = UIAlertAction.init(title: cancelText as String, style: .cancel) { (action) in
            self.performSelector(onMainThread: cancel, with: nil, waitUntilDone: true)
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
    
    func customAleatView(title: NSString, message: NSString, callBack:@escaping (_ content:String) ->())  {
        let alertView = AlertView.init(frame: self.view.bounds, title: title, message: message)
        
        let actionDefin = AlertAction().aciotn(title: "确定") { (aciont) in
            print(aciont.title as Any)
            callBack(title as String)
        }
        let actionCancle = AlertAction().aciotn(title: "取消") { (action) in
            print(action.title as Any)
        }
        alertView.setActions(actions: [actionDefin,actionCancle])
        alertView.show()
        self.view.addSubview(alertView)
    }
}

//导航栏相关的
extension LYBaseViewController {
   
    /// z设置导航栏右边的文本
    ///
    /// - Parameters:
    ///   - text: 文本
    ///   - callblock: 点击事件
    func setNavRightButtonWithText(text: NSString, sel: Selector?) {
        if (self.navigationController != nil) {
            let rightBtn = UIButton.init(type: .custom)
            rightBtn.setTitle(text as String, for: .normal)
            rightBtn.setTitleColor(UIColor.white, for: .normal)
            rightBtn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
            rightBtn.addTarget(self, action: sel!, for: .touchUpInside)
            let size = text.sizefont(font: UIFont.systemFont(ofSize: 14))
            rightBtn.frame = CGRect(x: 0, y: 0, width: size.width, height: 44)
         if (sel == nil){
                rightBtn.isEnabled = false
            }
            setNavrightCustomView(cutomView: rightBtn)
        }
    }
   
   /// z设置导航栏左边的文本
   ///
   /// - Parameters:
   ///   - text: 文本
   ///   - callBlock: 点击事件
   func setNavLeftButtonWithText(text: NSString, sel: Selector?) {
      if (self.navigationController != nil) {
         let leftBtn = UIButton.init(type: .custom)
         leftBtn.setTitle(text as String, for: .normal)
         leftBtn.setTitleColor(UIColor.white, for: .normal)
         leftBtn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
         leftBtn.addTarget(self, action: sel!, for: .touchUpInside)
         let size = text.sizefont(font: UIFont.systemFont(ofSize: 14))
         leftBtn.frame = CGRect(x: 0, y: 0, width: size.width, height: 44)
         if sel == nil {
            leftBtn.isEnabled = false
         }
         setNavLeftCutomView(cutomView: leftBtn)
      }
   }
   
   /// 自定义导航栏右边的button图片
   ///
   /// - Parameters:
   ///   - iconName: 图片名称
   ///   - sel: 点击事件
   func setNavRightButton(iconName: NSString, sel: Selector?) {
      
      if (self.navigationController != nil) {
         let btn = creatButtonWithIcon(name: iconName, isLeft: false)
         if btn == nil{
            return
         }
         if sel == nil{
            return
         }
         else{
            btn?.addTarget(sel, action: sel!, for: .touchUpInside)
         }
         setNavrightCustomView(cutomView: btn!)
      }
   }
   
   /// 自定义导航栏左边的button图片
   ///
   /// - Parameters:
   ///   - iconName: 图片名称
   ///   - sel: 点击事件
   func setNavLeftButton(iconName: NSString, sel: Selector?) {
      if (self.navigationController != nil) {
         let btn = creatButtonWithIcon(name: iconName, isLeft: true)
         if btn == nil{
            return
         }
         if sel == nil{
            return
         }
         else{
            btn?.addTarget(sel, action: sel!, for: .touchUpInside)
         }
         setNavLeftCutomView(cutomView: btn!)
      }
   }
   
   /// 生成导航栏两侧的icon的button
   ///
   /// - Parameters:
   ///   - name: 图片名称
   ///   - isLeft: 是否是导航栏左边进来的
   /// - Returns: 返回button
   private func creatButtonWithIcon(name: NSString, isLeft: Bool) -> UIButton? {
      
      let iconImage = UIImage(named: name as String)
       if iconImage == nil {
         return nil
       }
      let btnHeight: CGFloat = 44.0
      let btnWidth = iconImage!.size.width / iconImage!.size.height * btnHeight
      let offsetLeft = btnWidth - iconImage!.size.width
      let offsetRight = btnWidth - iconImage!.size.width
      let btn = UIButton.init(type: .custom)
      btn.setImage(iconImage, for: .normal)
      if offsetLeft > 0 && isLeft {
         btn.imageEdgeInsets = UIEdgeInsets(top: 0, left: -offsetLeft, bottom: 0, right: 0)
      }else if offsetRight > 0 && !isLeft {
         btn.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -offsetRight)
      }
      return btn
   }
   
   
   /// 自定义view设置到系统导航栏的item
   ///
   /// - Parameter cutomView: 自定义view
   private func setNavrightCustomView(cutomView: UIView) {
      self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(customView: cutomView)
   }
   
   private func setNavLeftCutomView(cutomView: UIView) {
      self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: cutomView)
   }
}
