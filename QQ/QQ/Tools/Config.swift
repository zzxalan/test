//
//  Config.swift
//  LingQi
//
//  Created by apple on 17/3/15.
//  Copyright © 2017年 zzxwork. All rights reserved.
//

import Foundation
import UIKit
//服务器地址
let serviceUrl: String = "http://124.16.166.233:8585"

enum UrlEnum: String {
    //获得最新监测数据
    case getLatestMonitoringData = "/index.php?g=json&m=air&a=latest_data"
    //获得所有监测点
    case getCollectPoints = "/index.php?g=json&m=point&a=point_list"

}



//屏幕大小
let deviceWidth = UIScreen.main.bounds.size.width
let deviceHeight = UIScreen.main.bounds.size.height
// 状态栏高度
let StatusHeight: CGFloat = 20.0
// 导航栏高度
let NavigationBarHeight: CGFloat = 44.0
// Tab栏高度
let TabBarHeight: CGFloat = 45.0
// View起点Y（导航栏左下角）
let ViewOriginY: CGFloat = StatusHeight + NavigationBarHeight
// View高度
let ViewHeight: CGFloat = deviceHeight - ViewOriginY


//navigationBar背景颜色
let BLUECOLOR: UIColor = UIColor(colorLiteralRed: (59 / 255), green: (120 / 255), blue: (233 / 255), alpha: 1)   //天蓝色


