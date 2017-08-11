//
//  ChatTableViewCell.swift
//  QQ
//
//  Created by apple on 17/8/7.
//  Copyright © 2017年 zzxwork. All rights reserved.
//

import UIKit

class ChatTableViewCell: UITableViewCell {

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var headImgHeight: NSLayoutConstraint!
    @IBOutlet weak var headImgWidth: NSLayoutConstraint!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        img.layer.cornerRadius = deviceHeight * 0.09 / 2
        img.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
