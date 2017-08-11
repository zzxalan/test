//
//  QQSpaceViewController.swift
//  QQ
//
//  Created by apple on 17/8/6.
//  Copyright © 2017年 zzxwork. All rights reserved.
//

import UIKit

class QQSpaceViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var msgTableView: UITableView?
    override func viewDidLoad() {
        super.viewDidLoad()

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
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = msgTableView?.dequeueReusableCell(withIdentifier: "MSGTableViewCell", for: indexPath) as! MSGTableViewCell
        return cell
    }

}
