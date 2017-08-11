//
//  UIViewControllerExtension.swift
//  LingQi
//
//  Created by apple on 17/3/15.
//  Copyright © 2017年 zzxwork. All rights reserved.
//

import UIKit
extension UIViewController {
    var navigationBarHeight: CGFloat {
        return (self.navigationController?.navigationBar.height)!
    }
    
    var toolBarHeight: CGFloat {
        return (self.navigationController?.toolbar.height)!
    }
    
    // 设置标题
    func setViewControllerTitle(_ title:String) {
        
        self.title = title
        // 隐藏子视图的返回按钮文字
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: self, action: nil)
        
        self.navigationController?.navigationBar.barTintColor = BLUECOLOR
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
    }
    
    
    // MARK: 提示框(我知道了)
    func showAlertStringWithIKonw(_ string: String) {
        self.present(LQAlretController.getNormalAlert(string, okTitle: "我知道了"), animated: true, completion: nil)
    }
    
    // MARK: 提示框（好的）
    func showAlertStringWithOk(_ string: String) {
        self.present(LQAlretController.getNormalAlert(string, okTitle: "好的"), animated: true, completion: nil)
    }
    
    // MARK: 提示获取账号信息出错
    func showAccountError() {
        self.present(LQAlretController.getNormalAlert("获取账号信息出错", okTitle: "我知道了"), animated: true, completion: nil)
    }
    
    // MARK: 提示出现莫名的错误
    func showUnknownError() {
        self.present(LQAlretController.getNormalAlert("出现了莫名的错误", okTitle: "我知道了"), animated: true, completion: nil)
    }
}
