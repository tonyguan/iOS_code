//
//  ViewController.swift
//  AlertViewActionSheet
//
//  Created by tonyguan on 2016/10/20.
//  Copyright © 2016年 关东升. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let screen = UIScreen.main.bounds
        
        let buttonAlertView = UIButton(type: UIButton.ButtonType.system)
        buttonAlertView.setTitle("Test警告框", for: UIControl.State())
        
        let buttonAlertViewWidth: CGFloat = 100
        let buttonAlertViewHeight: CGFloat = 30
        let buttonAlertViewTopView: CGFloat = 130
        
        buttonAlertView.frame = CGRect(x: (screen.size.width - buttonAlertViewWidth)/2 , y: buttonAlertViewTopView, width: buttonAlertViewWidth, height: buttonAlertViewHeight)
        //指定事件处理方法
        buttonAlertView.addTarget(self, action: #selector(testAlertView(_:)), for: .touchUpInside)
        self.view.addSubview(buttonAlertView)
        
        let buttonActionSheet = UIButton(type: UIButton.ButtonType.system)
        buttonActionSheet.setTitle("Test操作表", for: UIControl.State())
        
        let buttonActionSheetWidth: CGFloat = 100
        let buttonActionSheetHeight: CGFloat = 30
        let buttonActionSheetTopView: CGFloat = 260
        
        buttonActionSheet.frame = CGRect(x: (screen.size.width - buttonActionSheetWidth)/2 , y: buttonActionSheetTopView, width: buttonActionSheetWidth, height: buttonActionSheetHeight)
        //指定事件处理方法
        buttonActionSheet.addTarget(self, action: #selector(testActionSheet(_:)), for: .touchUpInside)
        self.view.addSubview(buttonActionSheet)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @objc func testAlertView(_ sender: AnyObject) {
        
        let alertController: UIAlertController = UIAlertController(title: "Alert", message: "Alert text goes here", preferredStyle: UIAlertController.Style.alert)
        
        let noAction = UIAlertAction(title: "No", style: .cancel) { (alertAction) -> Void in
            NSLog("Tap No Button")
        }
        
        let yesAction = UIAlertAction(title: "Yes", style: .default) { (alertAction) -> Void in
            NSLog("Tap Yes Button")
        }
        
        alertController.addAction(noAction)
        alertController.addAction(yesAction)
        
        //显示
        self.present(alertController, animated: true, completion: nil)
    }
    
    @objc func testActionSheet(_ sender: AnyObject) {
        
        let actionSheetController = UIAlertController()
        
        let cancelAction = UIAlertAction(title: "取消", style: UIAlertAction.Style.cancel) { (alertAction) -> Void in
            NSLog("Tap 取消 Button")
        }
        
        let destructiveAction = UIAlertAction(title: "破坏性按钮", style: UIAlertAction.Style.destructive) { (alertAction) -> Void in
            NSLog("Tap 破坏性按钮 Button")
        }
        
        let otherAction = UIAlertAction(title: "新浪微博", style: UIAlertAction.Style.default) { (alertAction) -> Void in
            NSLog("Tap 新浪微博 Button")
        }
        
        actionSheetController.addAction(cancelAction)
        actionSheetController.addAction(destructiveAction)
        actionSheetController.addAction(otherAction)
        
        //iPad设备浮动层设置锚点
        actionSheetController.popoverPresentationController?.sourceView = sender as? UIView
        //显示
        self.present(actionSheetController, animated: true, completion: nil)
        
    }
    
}
