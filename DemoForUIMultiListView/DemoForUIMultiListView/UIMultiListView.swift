//
//  UIMultiListView.swift
//  QQ
//
//  Created by apple on 17/8/11.
//  Copyright © 2017年 zzxwork. All rights reserved.
//

import UIKit

protocol UIMultiListViewDelegate {
    func clickAction(index: Int)
}

class UIMultiListView: UIScrollView {

    //选中颜色
    var selectColoor: UIColor = UIColor.blue
    //字体颜色
    var titleColor: UIColor = UIColor.gray {
        didSet {
            self.initView()
        }
    }
    //字体大小
    var fontSize: CGFloat = 14 {
        didSet {
            self.initView()
        }
    }
    //按钮间隔
    var btnSpace: CGFloat = 10 {
        didSet {
            self.initView()
        }
    }
    
    //按钮数据
    var listData: [String] = [] {
        didSet {
            self.initView()
        }
    }
    
    //点击事件代理
    var delegateForZzx: UIMultiListViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.showsHorizontalScrollIndicator = false
        self.showsVerticalScrollIndicator = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //根据数据添加按钮
    private func initView() {
        guard listData.count != 0 else {
            return
        }
        //移除子控件
        self.removesubViews()
        
        var x: CGFloat = btnSpace * 0.5
        var width: CGFloat = 0
        for index in 0..<listData.count {
            
            //根据字体大小获取字符串宽度
            let str: NSString = listData[index] as NSString
            let font: UIFont! = UIFont.systemFont(ofSize: fontSize)
            let attributes = [NSFontAttributeName:font]
            let size = str.boundingRect(with: CGSize(width: 320, height: 999), options: .usesLineFragmentOrigin, attributes: attributes, context: nil)
            width = size.width
            let view = addBtn(title: listData[index], frame: CGRect(x: x, y: 0, width: width, height: self.bounds.size.height))
            view.tag = index
            self.addSubview(view)
            x = x + width + btnSpace
            self.contentSize = CGSize(width: x, height: self.frame.size.height)
        }
        self.contentOffset.x = 0
    }
    
    //移除子视图
    private func removesubViews() {
        for view in self.subviews {
            view.removeFromSuperview()
        }
    }
    
    
    
    private func addBtn(title: String, frame: CGRect) -> UIView {
        
        let view = UIView(frame: frame)
        let btn = UIButton(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height * 0.9))
        let selectView = UIView(frame: CGRect(x: 0, y: view.frame.size.height * 0.9, width: view.frame.size.width, height: view.frame.size.height * 0.1))
        btn.setTitle(title, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: fontSize)
        btn.setTitleColor(titleColor, for: .normal)
        btn.addTarget(self, action: #selector(click(sender:)), for: .touchUpInside)
        
        btn.tag = 101
        selectView.tag = 102
        view.addSubview(btn)
        view.addSubview(selectView)
        return view
    }
    
    
    @objc private func click(sender: UIButton) {
        for view in (sender.superview?.superview?.subviews)! {
            
            if let btn: UIButton = view.viewWithTag(101) as? UIButton {
                btn.setTitleColor(titleColor, for: .normal)
                view.viewWithTag(102)?.backgroundColor = UIColor.clear
            }
        }
        sender.setTitleColor(selectColoor, for: .normal)
        sender.superview?.viewWithTag(102)?.backgroundColor = selectColoor
        if let delegate = delegateForZzx {
            let index: Int = (sender.superview?.tag)!
            delegate.clickAction(index: index)
        }
    }
    

}
