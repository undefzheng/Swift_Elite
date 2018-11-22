//
//  AlertView.swift
//  Elite_Swift
//
//  Created by 不才 on 2018/11/19.
//  Copyright © 2018 appscomm. All rights reserved.
//

import UIKit

class AlertAction: NSObject {
    
    var title: NSString?
    
    typealias actionBlock = (_ aciton: AlertAction ) -> Void
    var callBack: actionBlock?
    func actionCallBlock(block: @escaping actionBlock) {
        callBack = block
    }

    func aciotn(title: NSString, block: @escaping actionBlock) -> AlertAction {
        let action = AlertAction()
        action.title = title
        action.callBack = block
        return action
    }
}

class AlertView: UIView {
   
    private let kAlertBtnHeight = 50 * ScreenInfo.SCALE_6
    private let kAlertTitleHeight = 50 * ScreenInfo.SCALE_6
    private let kAlertMargin = 30 * ScreenInfo.SCALE_6
    private let kContentPadding = 15 * ScreenInfo.SCALE_6
    private let paddingBottom = 10 * ScreenInfo.SCALE_6
    
    private var title: NSString?
    private var message: NSString?
    private var backgroupViw: UIView!
    private var contenView: UIView!
    private var actionArr: NSArray?
    private var btnUIArr: NSArray?
    
    
    /// 创建alertViw
    ///
    /// - Parameters:
    ///   - frame: frmae
    ///   - title: 文本
    ///   - message: 文本详细信息
    init(frame: CGRect,title: NSString, message: NSString) {
        super.init(frame: frame)
        self.title = title
        self.message = message
        comintView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// 点击按钮
    ///
    /// - Parameter actions: 数组
    func setActions(actions: NSArray) {
        actionArr = actions
        
        if btnUIArr?.count != nil {
            for btn in btnUIArr! {
                (btn as! UIButton).removeFromSuperview()
            }
        }
       
        let btnArr = NSMutableArray()
        var x = contenView.width() - kContentPadding
        for (index, _) in actionArr!.enumerated() {
            let action: AlertAction = actionArr![index] as! AlertAction
            let titleSize = action.title?.sizefont(font: UIFont.systemFont(ofSize: 15))
            var width = titleSize?.width
            if Int(width!) < 60 {
               width = 60
            }
            x -= width!
            
            let btn = UIButton.init(type: .custom)
            btn.frame = CGRect(x: x, y: contenView.height() - kAlertBtnHeight, width: width!, height: kAlertBtnHeight)
            btn.setTitle(action.title! as String, for: .normal)
            btn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
            btn.setTitleColor(UIColor.modalNormalBtnColor, for: .normal)
            btn.tag = index
            btn.addTarget(self, action: #selector(buttonClick(button:)), for: .touchUpInside)
            contenView.addSubview(btn)
            x -= kContentPadding
            
            btnArr.add(btn)
        }
        btnUIArr = btnArr

    }
    
    func show() {
        backgroupViw.alpha = 0
        contenView.transform = CGAffineTransform.init(scaleX: 0.5, y: 0.5)
        contenView.alpha = 0
        UIView.animate(withDuration: 0.2) {
            self.backgroupViw.alpha = 1
            self.contenView.transform = CGAffineTransform.init(scaleX: 1, y: 1)
            self.contenView.alpha = 1
        }
    }
    
    func dismiss() {
        UIView.animate(withDuration: 0.2) {
            self.backgroupViw.alpha = 0
            self.contenView.transform = CGAffineTransform.init(scaleX: 0.5, y: 0.5)
            self.contenView.alpha = 0
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now()+0.5) {
            self.removeFromSuperview()
        }
    }
    
    private func comintView() {
        backgroupViw = UIView.init(frame: self.bounds)
        backgroupViw.backgroundColor = UIColor.modalBackgroundColor
        backgroupViw.alpha = 1
        self.addSubview(backgroupViw)
        
        let width = self.width() - kAlertMargin * 2
        let massageSize = message?.size(font: UIFont.systemFont(ofSize: 15), multilinesSize: CGSize.init(width: width - kContentPadding * 2, height: self.height()))
        let contentHeight = kAlertTitleHeight + massageSize!.height + paddingBottom + kAlertBtnHeight;
        
        let y = (self.height() - contentHeight) / 2 - 50
        contenView = UIView.init(frame: CGRect(x: kAlertMargin, y: y, width: width, height: contentHeight))
        contenView.backgroundColor = UIColor.modalTintColor
        contenView.alpha = 1
        contenView.layer.cornerRadius = 5
        contenView.layer.masksToBounds = true
        contenView.isUserInteractionEnabled = true
        self.addSubview(contenView)
        
        let titleLbl = UILabel.init(frame: CGRect(x: kContentPadding, y: 0, width: contenView.width() - kContentPadding * 2, height: kAlertTitleHeight))
        titleLbl.textColor = UIColor.modalTitleColor
        titleLbl.font = UIFont.systemFont(ofSize: 17)
        titleLbl.text = title! as String
        let titleSize = self.title?.sizefont(font: UIFont.systemFont(ofSize: 17))
        if (titleSize?.width)! > titleLbl.width() {
            titleLbl.font = UIFont.systemFont(ofSize: 15)
        }
        contenView?.addSubview(titleLbl)
        
        let msgLbl = UILabel.init(frame: CGRect(x: kContentPadding, y: titleLbl.bottom(), width: (contenView?.width())! - kContentPadding * 2, height: (massageSize?.height)!))
        msgLbl.textColor = UIColor.modalMessageColor
        msgLbl.font = UIFont.systemFont(ofSize: 15)
        msgLbl.text = message! as String
        msgLbl.numberOfLines = 0
        contenView.addSubview(msgLbl)
        
    }
    
    @objc func buttonClick(button: UIButton){
        print("点击到了");
        
        let action: AlertAction = actionArr![button.tag] as! AlertAction
        if (action.callBack != nil) {
            action.callBack!(action)
        }
        dismiss()
        
    }
   
}
