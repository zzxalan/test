//
//  ViewController.swift
//  DemoForUIMultiListView
//
//  Created by apple on 17/8/12.
//  Copyright © 2017年 zzxwork. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIMultiListViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let multiListView: UIMultiListView = UIMultiListView(frame: CGRect(x: 0, y: 100, width: 350, height: 30))
        
        //添加数据
        multiListView.listData = ["btn1","btn2","btn3","btn4","btn5","btn6"]
        //设置字体大小，默认 14
        multiListView.fontSize = 22
        //设置字体颜色， 默认灰色
        multiListView.titleColor = UIColor.black
        //设置选中时颜色， 默认蓝色
        multiListView.selectColoor = UIColor.red
        //设置按钮间隔， 默认 10
        multiListView.btnSpace = 20
        //点击事件代理
        multiListView.delegateForZzx = self
        
        self.view.addSubview(multiListView)
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func clickAction(index: Int) {
        print("您点击了第\(index)个按钮")
    }

}

