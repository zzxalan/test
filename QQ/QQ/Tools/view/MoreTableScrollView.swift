//
//  MoreTableScrollView.swift
//  QQ
//
//  Created by apple on 17/8/7.
//  Copyright © 2017年 zzxwork. All rights reserved.
//

import UIKit

protocol MoreTableClickActionDelegate {
    func clickAction(title: String)
}

class MoreTableScrollView: UIScrollView {

    //选中颜色
    var selectColoor: UIColor = UIColor.blue
    //按钮数据
    var btnData: [String] = []
  
    //点击事件代理
    var moreTableClickActionDelegate: MoreTableClickActionDelegate?
    
    init(frame: CGRect, data: [String], target: MoreTableClickActionDelegate) {
        super.init(frame: frame)
        self.btnData = data
        initView()
        self.setContentOffset(CGPoint(x: 20, y: 0), animated: true)
        self.showsHorizontalScrollIndicator = false
        self.moreTableClickActionDelegate = target
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //根据数据添加按钮
    func initView() {
        removesubViews()
        var x: Int = 10
        var width: Int = 0
        for index in 0..<btnData.count {
            width = btnData[index].characters.count * Int(frame.size.width) / 22
            let view = addBtn(title: btnData[index], frame: CGRect(x: CGFloat(x), y: 0, width: CGFloat(width), height: self.frame.size.height))
            self.addSubview(view)
            x = x + width + 20
            self.contentSize = CGSize(width: CGFloat(x), height: self.frame.size.height)
        }
        self.contentOffset.x = 0
    }
    
    //移除子视图
    func removesubViews() {
        for view in self.subviews {
            view.removeFromSuperview()
        }
    }
    
    
    
    func addBtn(title: String, frame: CGRect) -> UIView {
        
        let view = UIView(frame: frame)
        let btn = UIButton(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height * 0.9))
        let selectView = UIView(frame: CGRect(x: 0, y: view.frame.size.height * 0.9, width: view.frame.size.width, height: view.frame.size.height * 0.1))
        btn.setTitle(title, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        btn.setTitleColor(UIColor.gray, for: .normal)
        btn.addTarget(self, action: #selector(click(sender:)), for: .touchUpInside)
        
        btn.tag = 101
        selectView.tag = 102
        view.addSubview(btn)
        view.addSubview(selectView)
        return view
    }
    
    
    func click(sender: UIButton) {
        for view in (sender.superview?.superview?.subviews)! {
            
            if let btn: UIButton = view.viewWithTag(101) as? UIButton {
            btn.setTitleColor(UIColor.gray, for: .normal)
            view.viewWithTag(102)?.backgroundColor = UIColor.clear
            }
        }
        sender.setTitleColor(selectColoor, for: .normal)
        sender.superview?.viewWithTag(102)?.backgroundColor = selectColoor
        if let delegate = moreTableClickActionDelegate {
            delegate.clickAction(title: (sender.titleLabel?.text)!)
        }
    }
    
    

}
