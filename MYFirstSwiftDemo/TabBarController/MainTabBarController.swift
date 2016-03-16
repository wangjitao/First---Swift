//
//  MainTabBarController.swift
//  MYFirstSwiftDemo
//
//  Created by 王纪涛 on 16/3/16.
//  Copyright © 2016年 YDSports (Beijing) Technology Co. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    var wwchatVC = WWChatViewController()
    var addressListVC = AddressListViewController()
    var findVC = FindViewController()
    var myVC = MyViewController()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

//        wwchatVC.navigationItem.title = "微信"
//        addressListVC.navigationItem.title = "通讯录"
//        findVC.navigationItem.title = "发现"
//        myVC.navigationItem.title = "我"
        wwchatVC.titleStr = "微信"
        addressListVC.titleStr = "通讯录"
        findVC.titleStr = "发现"
        myVC.titleStr = "我"
        
        wwchatVC.tabBarItem.title = "微信"
        addressListVC.tabBarItem.title = "通讯录"
        findVC.tabBarItem.title = "发现"
        myVC.tabBarItem.title = "我"
        
        self.viewControllers = [
            viewControllerForNavController(wwchatVC, imgName: "tabbar_chat_no", selectImgName: "tabbar_chat_yes"),
            viewControllerForNavController(addressListVC, imgName: "tabbar_book_no", selectImgName: "tabbar_book_yes"),
            viewControllerForNavController(findVC, imgName: "tabbar_found_no", selectImgName: "tabbar_found_yes"),
            viewControllerForNavController(myVC, imgName: "tabbar_me_no", selectImgName: "tabbar_me_yes")
        ]
        self.tabBar.tintColor = UIColor(colorLiteralRed: 9/255.0, green: 187/255.0, blue: 7/255.0, alpha: 1)
        
    }
    //取消渲染的Image
    func removeRendering(imgName:NSString) -> UIImage {
        
        let image = UIImage(named:imgName as String)
        
        return (image?.imageWithRenderingMode(.AlwaysOriginal))!
    
    }
    //创建NAV
    func viewControllerForNavController(vc:UIViewController , imgName:NSString , selectImgName:NSString) -> UINavigationController {
        
        let nav = BaseNavgationController(rootViewController:vc)
        
        nav.tabBarItem = UITabBarItem(title:vc.tabBarItem.title , image: removeRendering(imgName), selectedImage:removeRendering(selectImgName))
        
        return nav
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
