//
//  AddressListCell.swift
//  MYFirstSwiftDemo
//
//  Created by 王纪涛 on 16/3/18.
//  Copyright © 2016年 YDSports (Beijing) Technology Co. All rights reserved.
//

import UIKit

class AddressListCell: UITableViewCell {

    @IBOutlet var userImageView: UIImageView!
    @IBOutlet var userName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
