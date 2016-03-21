//
//  AddressListViewController.swift
//  MYFirstSwiftDemo
//
//  Created by 王纪涛 on 16/3/16.
//  Copyright © 2016年 YDSports (Beijing) Technology Co. All rights reserved.
//

import UIKit

class AddressListViewController: BaseViewController,UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate,UISearchResultsUpdating {
    
    var tableView:UITableView?
    var dataSource:NSMutableArray?
    var userDataSource:NSMutableArray?
    var searchList = [AddressListModel]()
    var resultSearchUserName:NSMutableArray?
    var searchController:UISearchController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rightItemButton("book_addfriend")
        
        prepareDataAndlayoutSubViewsForAddressListView()
        
    }
    
    func prepareDataAndlayoutSubViewsForAddressListView() {
        
        prepareDataForAddressListView()
        layoutSubViewsForAddressListView()
    }
    
    func prepareDataForAddressListView() {
        dataSource = NSMutableArray()
        userDataSource = NSMutableArray()
        //searchList = NSMutableArray()
        let newFriendModel = AddressListModel()
        newFriendModel.userImg = "book_newfriend"
        newFriendModel.userName = "新的朋友"
        let peopleChatModel = AddressListModel()
        peopleChatModel.userImg = "book_group"
        peopleChatModel.userName = "群聊"
        let markModel = AddressListModel()
        markModel.userImg = "book_tag"
        markModel.userName = "标签"
        let publicModel = AddressListModel()
        publicModel.userImg = "book_gong"
        publicModel.userName = "公众号"
        
        for var num:Int = 0 ; num < 10 ; num++ {
            let userModel = AddressListModel()
            userModel.userImg = ""
            userModel.userName = "朋友\(num)"
            userDataSource?.addObject(userModel)
        }
        
        dataSource = [[newFriendModel,peopleChatModel,markModel,publicModel],userDataSource!]
        
    }
    
    func layoutSubViewsForAddressListView() {
        tableView = UITableView()
        tableView?.frame = CGRectMake(0, 64, UIScreen.mainScreen().bounds.width, UIScreen.mainScreen().bounds.height-64)
        tableView?.delegate = self
        tableView?.dataSource = self
        tableView?.registerNib(UINib(nibName: "AddressListCell", bundle: nil), forCellReuseIdentifier: "AddressListCellId")
        view.addSubview(tableView!)
  
        searchController = UISearchController(searchResultsController: nil)
        searchController?.searchResultsUpdater = self
        searchController?.dimsBackgroundDuringPresentation = false
        searchController?.hidesNavigationBarDuringPresentation = false
        searchController?.searchBar.sizeToFit()
        searchController?.searchBar.frame = CGRectMake(searchController!.searchBar.frame.origin.x, searchController!.searchBar.frame.origin.y, searchController!.searchBar.frame.size.width, 44.0)
        searchController?.searchBar.placeholder = "搜索"
        
        searchController?.searchBar.delegate = self
        
        tableView?.tableHeaderView = searchController?.searchBar
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        if searchController!.active {
            return 1
        } else {
            return (dataSource?.count)!
        }
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchController!.active {
            
            return searchList.count
        }
        return dataSource![section].count
    }
   
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let addressCell:AddressListCell = tableView.dequeueReusableCellWithIdentifier("AddressListCellId", forIndexPath: indexPath) as! AddressListCell
        
        var model = AddressListModel()
        
        //搜索时判断,搜索数组中元素的个数
        if searchController!.active {
            if searchList.count > 0 {
                model = searchList[indexPath.row]
                
            } else {//刚开始输入时,没有符合的直接返回cell
                return addressCell
            }
        } else {
            model = dataSource![indexPath.section][indexPath.row] as! AddressListModel
            
        }
        
        addressCell.userImageView.image = UIImage(named: model.userImg as!String)
        addressCell.userName.text = model.userName as? String
        
        return addressCell
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
           return 0
        } else {
           return 20
        }
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 50
    }
    
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        
        let searchString:NSString = searchController.searchBar.text!
        
        let searchPredicate = NSPredicate(format: "SELF CONTAINS [C] %@", searchString)
        
//        var model = AddressListModel()
//        
//        for model in userDataSource! {
//            
//        
//        }
        
        if  searchString.length > 0 {
            //假的 要改
        
            let array = (userDataSource! as NSArray).filteredArrayUsingPredicate(searchPredicate)
            searchList = array as! [AddressListModel]
        }
        tableView?.reloadData()
    }
    
//    func searchBarTextDidBeginEditing(searchBar: UISearchBar) {
//        shouldShowSearchResults = true
//        tableView?.reloadData()
//    }
//    
//    
//    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
//        shouldShowSearchResults = false
//        tableView?.reloadData()
//    }
//    
//    func searchBarShouldBeginEditing(searchBar: UISearchBar) -> Bool {
//        print("开始搜索")
//        return true
//    }
//    func searchBarTextDidBeginEditing(searchBar: UISearchBar) {
//        print("开始搜索")
//    }
//    func searchBarTextDidEndEditing(searchBar: UISearchBar) {
//        print("结束搜索")
//    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
