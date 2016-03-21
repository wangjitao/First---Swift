//
//  searchBarTextFiled.swift
//  MYFirstSwiftDemo
//
//  Created by 王纪涛 on 16/3/18.
//  Copyright © 2016年 YDSports (Beijing) Technology Co. All rights reserved.
//

import UIKit

class searchBarView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let searchBar = UITextField()
        searchBar.frame.size = CGSizeMake(300, 30)
        searchBar.placeholder = "搜索"
        searchBar.font = UIFont.systemFontOfSize(15)
        
        
        
        let searchIcon = UIImageView()
        searchIcon.image = UIImage(named:"searchbar_textfield_search_icon")
        searchIcon.contentMode = UIViewContentMode.Center
        searchIcon.sizeThatFits(CGSize(width: 30,height: 30))
        searchBar.leftView = searchIcon
        searchBar.leftViewMode = UITextFieldViewMode.Always
        self.addSubview(searchBar)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
