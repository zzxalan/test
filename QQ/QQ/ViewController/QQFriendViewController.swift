//
//  QQFriendViewController.swift
//  QQ
//
//  Created by apple on 17/8/6.
//  Copyright © 2017年 zzxwork. All rights reserved.
//

import UIKit

enum FriendTableStyle: String {
    case friend = "好友"
    case group = "群"
    case chat = "多人聊天"
    case equipment = "设备"
    case addressBook = "通讯录"
    case publicAccount = "公众号"
}

class QQFriendViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,MoreTableClickActionDelegate {

    var friendTableView: UITableView?
    var friendTableHeaderView: UIView?
    let headerViewHeight: CGFloat = deviceHeight * 0.2
    //滑动视图的数据
    let scrollViewData: [FriendTableStyle] = [.friend, .group, .chat, .equipment, .addressBook, .publicAccount]
    //当前选中数据类型
    var selectData: FriendTableStyle = .friend
    //滑动视图
    //let scrollView: UIScrollView?
    
    
    //数据
    let friendArr: [String] = ["特别关心","我的好友","朋友","家人","初中同学","高中同学","大学同学"]
    let groupArr: [String] = ["我创建的群","我管理的群","我加入的群"]
    let chatArr: [String] = ["讨论组1","讨论组2","讨论组3","讨论组4"]
    let equipmentArr: [String] = ["我的电脑","发现新设备"]
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        showView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func showView() {
        
        
        friendTableView = UITableView(frame: CGRect(x: 0, y: 0, width: deviceWidth, height: deviceHeight))
        friendTableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: deviceWidth, height: headerViewHeight))
        
        initHeadeView()
        
        friendTableView?.register(UINib(nibName: "FriendTableViewCell", bundle: nil), forCellReuseIdentifier: "FriendTableViewCell")
        friendTableView?.register(UINib(nibName: "MSGTableViewCell", bundle: nil), forCellReuseIdentifier: "MSGTableViewCell")
        friendTableView?.register(UINib(nibName: "ChatTableViewCell", bundle: nil), forCellReuseIdentifier: "ChatTableViewCell")
        
        friendTableView?.delegate = self
        friendTableView?.dataSource = self
        
        friendTableView?.tableHeaderView = friendTableHeaderView
        
        friendTableView?.tableFooterView = UIView()
        self.view.addSubview(friendTableView!)
    }
    
    func initHeadeView() {
        
        friendTableHeaderView?.backgroundColor = UIColor(colorLiteralRed: 248 / 255.0, green: 248 / 255.0, blue: 255 / 255.0, alpha: 1)
        
        //搜索视图
        let searchController = UISearchController(searchResultsController: nil)
        
        //searchController.searchResultsUpdater = self
        searchController.searchBar.searchBarStyle = .minimal
        searchController.searchBar.sizeToFit()
        // 默认为YES,设置开始搜索时背景显示与否
        searchController.dimsBackgroundDuringPresentation = false
        // 默认为YES,控制搜索时，是否隐藏导航栏
        searchController.hidesNavigationBarDuringPresentation = false
        // 将搜索框视图设置为tableView的tableHeaderView
        searchController.searchBar.placeholder = "搜索"
        searchController.searchBar.frame = CGRect(x: 0, y: 0, width: deviceWidth, height: headerViewHeight * 0.25)
        searchController.searchBar.backgroundColor = UIColor.white
        
        
        friendTableHeaderView?.addSubview(searchController.searchBar)
        
        //横线
        let line1 = UIView(frame: CGRect(x: 0, y: headerViewHeight * 0.25, width: deviceWidth, height: 0.5))
        line1.backgroundColor = UIColor(colorLiteralRed: 220 / 255.0, green: 220 / 255.0, blue: 220 / 255.0, alpha: 1)
        friendTableHeaderView?.addSubview(line1)
        
        
        //新朋友视图
        let newFriendView = UIView(frame: CGRect(x: 0, y: headerViewHeight * 0.25 + 0.5, width: deviceWidth, height: headerViewHeight * 0.35))
        let newFriendBtn = UILabel(frame: CGRect(x: 10, y: 0, width: deviceWidth * 0.5, height: newFriendView.height))
        let turnImg = UIImageView(frame: CGRect(x: deviceWidth * 0.92, y: newFriendView.height * 0.25, width: deviceWidth * 0.07, height: newFriendView.height * 0.5))
        
        newFriendView.backgroundColor = UIColor.white
        newFriendBtn.text = "新朋友"
        
        turnImg.image = UIImage(named: "turn_right")
        
        newFriendView.addSubview(newFriendBtn)
        newFriendView.addSubview(turnImg)
        
        friendTableHeaderView?.addSubview(newFriendView)
        
        //滑动视图
        let frame = CGRect(x: 0, y: headerViewHeight * 0.7, width: deviceWidth, height: headerViewHeight * 0.3)
        var data: [String] = []
        for item in scrollViewData {
            data.append(item.rawValue)
        }
        let moreTableScrollView: MoreTableScrollView = MoreTableScrollView(frame: frame, data: data, target: self)
        moreTableScrollView.backgroundColor = UIColor.white
        friendTableHeaderView?.addSubview(moreTableScrollView)
        
        //横线
        let line2 = UIView(frame: CGRect(x: 0, y: headerViewHeight - 0.5, width: deviceWidth, height: 0.5))
        line2.backgroundColor = UIColor(colorLiteralRed: 220 / 255.0, green: 220 / 255.0, blue: 220 / 255.0, alpha: 0.3)
        friendTableHeaderView?.addSubview(line2)
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch selectData {
        case .friend:
            return friendArr.count
        case .group:
            return groupArr.count
        case .chat:
            return chatArr.count
        case .equipment:
            return equipmentArr.count
        default:
            return 2
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch selectData {
        case .friend:
            let cell = friendTableView?.dequeueReusableCell(withIdentifier: "FriendTableViewCell", for: indexPath) as! FriendTableViewCell
            cell.label.text = friendArr[indexPath.row]
            return cell
        case .group:
            let cell = friendTableView?.dequeueReusableCell(withIdentifier: "FriendTableViewCell", for: indexPath) as! FriendTableViewCell
            cell.label.text = groupArr[indexPath.row]
            cell.numLabel.text = "2"
            return cell
        case .chat:
            let cell = friendTableView?.dequeueReusableCell(withIdentifier: "ChatTableViewCell", for: indexPath) as! ChatTableViewCell
            cell.label.text = chatArr[indexPath.row]
            cell.img.image = UIImage(named: "head\(indexPath.row)")
            return cell
        default:
            let cell = friendTableView?.dequeueReusableCell(withIdentifier: "MSGTableViewCell", for: indexPath) as! MSGTableViewCell
            cell.nameLabel.text = friendArr[indexPath.row]
            cell.headImg.image = UIImage(named: "head\(indexPath.row + 2)")
            cell.msgLabel.text = "[离线]无数据线"
            return cell
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return deviceHeight / 10
    }
    
    func clickAction(title: String) {
        self.selectData = FriendTableStyle(rawValue: title)!
        friendTableView?.reloadData()
    }

}
