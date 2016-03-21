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
    var searchList:NSMutableArray?
    var resultSearchUserName:NSMutableArray?
    var searchController:UISearchController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rightItemButton("book_addfriend")
    
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        prepareDataAndlayoutSubViewsForAddressListView()
    }
    
    func prepareDataAndlayoutSubViewsForAddressListView() {
        
        prepareDataForAddressListView()
        layoutSubViewsForAddressListView()
    }
    
    func prepareDataForAddressListView() {
        dataSource = NSMutableArray()
        userDataSource = NSMutableArray()
        searchList = NSMutableArray()
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
            userModel.userImg = "image\(num).jpg"
            userModel.userName = "朋友\(num)"
            userDataSource?.addObject(userModel)
        }
        
        dataSource = [[newFriendModel,peopleChatModel,markModel,publicModel],userDataSource!]
    }
    
    func layoutSubViewsForAddressListView() {
        tableView = UITableView()
        tableView?.frame = CGRectMake(0, kNavigationH, kSCREEN_WIDTH, kSCREEN_HEIGHT - kNavigationH - kTabBarHeight)
        tableView?.delegate = self
        tableView?.dataSource = self
        tableView?.registerNib(UINib(nibName: "AddressListCell", bundle: nil), forCellReuseIdentifier: "AddressListCellId")
        view.addSubview(tableView!)
  
        searchController = UISearchController(searchResultsController: nil)
        searchController?.searchResultsUpdater = self
        searchController?.dimsBackgroundDuringPresentation = true
        searchController?.hidesNavigationBarDuringPresentation = true
        searchController?.searchBar.sizeToFit()
        searchController?.searchBar.frame = CGRectMake(kViewX(searchController!.searchBar), kViewY(searchController!.searchBar), kViewW(searchController!.searchBar), kNavigationBarH)
        
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
            return searchList!.count
        } else {
            return dataSource![section].count
        }
    }
   
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let addressCell:AddressListCell = tableView.dequeueReusableCellWithIdentifier("AddressListCellId", forIndexPath: indexPath) as! AddressListCell
        
        var model = AddressListModel()
        
        //搜索时判断,搜索数组中元素的个数
        if searchController!.active {
            if searchList!.count > 0 {
                model = searchList![indexPath.row] as! AddressListModel
                
            } else {//刚开始输入时,没有符合的直接返回cell
                return addressCell
            }
        } else {
            if searchList!.count > 0 {
                model = searchList![indexPath.row] as! AddressListModel
            } else {
                model = dataSource![indexPath.section][indexPath.row] as! AddressListModel
            }
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
        return AdaptedHeightValue(45)
    }
    
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        
        let searchString:NSString = searchController.searchBar.text!
        
        let searchPredicate = NSPredicate(format: "SELF CONTAINS [C] %@", searchString)
        
        if  searchString.length > 0 {//当有查询条件时
            //因为searchList里面存的是model,查找时要用名字的数组进行查找,所以将searchList里的model.userName放到全局数组中
            if resultSearchUserName == nil {
                resultSearchUserName = NSMutableArray()
                for model in userDataSource! {
                    resultSearchUserName!.addObject((model as! AddressListModel).userName!)
                }
            }
            //查询出的用户名字数组
            let array = (resultSearchUserName! as NSArray).filteredArrayUsingPredicate(searchPredicate)
            //将查询出的名字数组中的元素与用户model数组的model.userName匹配,并将model加入到searchList中
            for name in array {
                for model in userDataSource! {
                    if name.isEqual((model as! AddressListModel).userName!) {
                    searchList?.addObject(model)
                    }
                }
            }
            tableView?.reloadData()
        } else {//没有查询条件是(只是触发了搜索框)
            
        }
    }
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
       
        tableView?.reloadData()
    }

    func searchBarTextDidEndEditing(searchBar: UISearchBar) {
        print("结束搜索")
       
        tableView?.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
