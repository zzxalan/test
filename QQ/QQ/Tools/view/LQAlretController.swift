
//
//  LQAlretController.swift
//  LingQi
//
//  Created by apple on 17/3/15.
//  Copyright © 2017年 zzxwork. All rights reserved.
//

import Foundation
import UIKit
class LQAlretController: NSObject {
    
    static func getNormalAlert(_ alertTitle: String, okTitle: String, handler: ((UIAlertAction) -> Void)? = nil) -> UIAlertController {
        let alert: UIAlertController = UIAlertController(title: alertTitle, message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: okTitle, style: .default, handler: handler))
        return alert
    }
    
    
}
