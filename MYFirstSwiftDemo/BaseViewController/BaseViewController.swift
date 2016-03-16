//
//  BaseViewController.swift
//  MYFirstSwiftDemo
//
//  Created by 王纪涛 on 16/3/16.
//  Copyright © 2016年 YDSports (Beijing) Technology Co. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    var titleStr = NSString()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBarHidden = true
        
        let statusBar = UIView()
        statusBar.frame = CGRectMake(0, 0, UIScreen.mainScreen().bounds.width, 20)
        statusBar.backgroundColor = UIColor.init(white: 0.2, alpha: 1)
        
        view.addSubview(titleViewForNavigationItem(titleStr,titleSize: 17, titleColor: UIColor.whiteColor(), titleViewColor: UIColor.init(white: 0.2, alpha: 1)))
        view.addSubview(statusBar)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func titleViewForNavigationItem(title:NSString,titleSize:CGFloat,titleColor:UIColor,titleViewColor:UIColor) -> UILabel {
        
        let titleView = UILabel()
        titleView.frame = CGRectMake(0,20, UIScreen.mainScreen().bounds.width, 44)
        titleView.backgroundColor = titleViewColor
        titleView.text = title as String
        titleView.textColor = titleColor
        titleView.textAlignment = NSTextAlignment.Center
        titleView.font = UIFont.boldSystemFontOfSize(titleSize)
        
        return titleView
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        
       return UIStatusBarStyle.LightContent
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
