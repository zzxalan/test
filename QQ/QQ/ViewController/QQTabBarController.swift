//
//  QQTabBarController.swift
//  QQ
//
//  Created by apple on 17/8/6.
//  Copyright © 2017年 zzxwork. All rights reserved.
//

import UIKit

class QQTabBarController: UITabBarController {

    let titleArr = ["消息","联系人","动态"]
    override func viewDidLoad() {
        super.viewDidLoad()

        
        let messageVC = QQMessageViewController()
        let friendVC = QQFriendViewController()
        let spaceVC = QQSpaceViewController()
        
        let arr = [messageVC,friendVC,spaceVC]
        
        
        self.viewControllers = arr
        
        var tag = 0
        for viewController in arr {
            // 声明 TabBarItem 的Image，如果没有imageWithRenderingMode方法Image只会保留轮廓
            let image = UIImage(named: "tab_\(tag)")?.withRenderingMode(.alwaysOriginal)
            let selectedImage = UIImage(named: "selectTab_\(tag)")?.withRenderingMode(.alwaysOriginal)
            
            // 声明新的无标题TabBarItem
            let tabBarItem = UITabBarItem(title: titleArr[tag], image: image, selectedImage: selectedImage)
            // 设置 tabBarItem 的 imageInsets 可以使图标居中显示
            
            tabBarItem.imageInsets = UIEdgeInsetsMake(0, 0, 0, 0)
            tabBarItem.tag = tag
            viewController.tabBarItem = tabBarItem
            tag += 1
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //设置tabbar 的高度
    override func viewWillLayoutSubviews() {
        self.setViewControllerTitle("消息")
        
        var img = UIImage(named: "head6")
        img = img?.reSizeImage(reSize: CGSize(width: 35, height: 35))
        img = img?.toCircle()
        img = img?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        let leftBtn = UIBarButtonItem(image: img, style: .plain, target: self, action:  #selector(addBtnAction))
        
        self.navigationItem.leftBarButtonItem = leftBtn
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addBtnAction))
        
        var tabFrame = self.tabBar.frame; //self.TabBar is IBOutlet of your TabBar
        tabFrame.size.height = TabBarHeight;
        tabFrame.origin.y = self.view.frame.size.height - TabBarHeight;
        self.tabBar.frame = tabFrame;
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        self.setViewControllerTitle(titleArr[item.tag])
        switch item.tag {
        case 0:
            self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addBtnAction))
        case 1:
            self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "添加", style: .plain, target: self, action: #selector(addFriend))
        default:
            self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "更多", style: .plain, target: self, action: #selector(anyMore))
        }
    }
    
    func addBtnAction() {
        
    }
    
    func addFriend() {
        
    }
    func anyMore() {
        
    }

}
