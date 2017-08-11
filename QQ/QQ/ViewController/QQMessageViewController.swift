//
//  QQMessageViewController.swift
//  QQ
//
//  Created by apple on 17/8/6.
//  Copyright © 2017年 zzxwork. All rights reserved.
//

import UIKit

class QQMessageViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UISearchResultsUpdating {

    var msgTableView: UITableView?
    let nameArr = ["张三","李四","王五","赵六","老大","老二","老三","老四"]
    let msgArr = ["你好","在吗","一起看电影","欧巴","哈哈","重大空大滑块","重大所大多三","钱文忠四"]
    
    //搜索控制器
    var searchController = UISearchController()
    
    //搜索过滤后的结果集
    var searchArray = ["张三","李四","王五","赵六","老大","老二","老三","老四"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        showView()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showView() {
        msgTableView = UITableView(frame: CGRect(x: 0, y: 0, width: deviceWidth, height: deviceHeight))
        
        msgTableView?.register(UINib(nibName: "MSGTableViewCell", bundle: nil), forCellReuseIdentifier: "MSGTableViewCell")
        
        msgTableView?.delegate = self
        msgTableView?.dataSource = self
        
        self.view.addSubview(msgTableView!)
        
        
        
        self.searchController = UISearchController(searchResultsController: nil)
        
        self.searchController.searchResultsUpdater = self
        searchController.searchBar.searchBarStyle = .minimal
        searchController.searchBar.sizeToFit()
        // 默认为YES,设置开始搜索时背景显示与否
        searchController.dimsBackgroundDuringPresentation = false
        // 默认为YES,控制搜索时，是否隐藏导航栏
        searchController.hidesNavigationBarDuringPresentation = false
        // 将搜索框视图设置为tableView的tableHeaderView
        msgTableView?.tableHeaderView = searchController.searchBar
        
        searchController.searchBar.placeholder = "搜索"
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = msgTableView?.dequeueReusableCell(withIdentifier: "MSGTableViewCell", for: indexPath) as! MSGTableViewCell
        let img = UIImage(named: "head\(indexPath.row)")
        cell.initCell(headImg: img!, name: searchArray[indexPath.row], msg: msgArr[indexPath.row], time: "10:29")
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return deviceHeight / 10
    }
    
    
    //实时进行搜索
    func updateSearchResults(for searchController: UISearchController){
        self.searchArray = self.nameArr.filter { (name) -> Bool in
            return name.contains(searchController.searchBar.text!)
        }
        
        if searchArray.isEmpty {
            searchArray = nameArr
            
        }
        
        self.msgTableView?.reloadData()
    
    }
    
    
    

}
