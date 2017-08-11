//
//  MSGTableViewCell.swift
//  QQ
//
//  Created by apple on 17/8/6.
//  Copyright © 2017年 zzxwork. All rights reserved.
//

import UIKit

class MSGTableViewCell: UITableViewCell {

    @IBOutlet weak var headImg: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var msgLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var headImgWidth: NSLayoutConstraint!
    
    @IBOutlet weak var headImgHeight: NSLayoutConstraint!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
        headImg.layer.cornerRadius = deviceHeight * 0.09 / 2
        headImg.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func initCell(headImg: UIImage,name: String,msg: String, time: String) {
        self.headImg.image = headImg
        self.nameLabel.text = name
        self.msgLabel.text = msg
        self.timeLabel.text = time
    }
    
}
