//
//  BaseViewController.swift
//  MYFirstSwiftDemo
//
//  Created by 王纪涛 on 16/3/16.
//  Copyright © 2016年 YDSports (Beijing) Technology Co. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    var titleView:UIView?
    var titleStr:NSString?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBarHidden = true
        
        let statusBar = UIView()
        statusBar.frame = CGRectMake(0, 0, UIScreen.mainScreen().bounds.width, 20)
        statusBar.backgroundColor = UIColor.init(white: 0.2, alpha: 1)
        view.addSubview(statusBar)
        
        titleViewForNavigationItem(titleStr!,titleSize: 17, titleColor: UIColor.whiteColor(), titleViewColor: UIColor.init(white: 0.2, alpha: 1))
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func titleViewForNavigationItem(title:NSString,titleSize:CGFloat,titleColor:UIColor,titleViewColor:UIColor) {
        titleView = UIView()
        let titleLabel = UILabel()
        titleView!.frame = CGRectMake(0, 20, UIScreen.mainScreen().bounds.width, 44)

        titleLabel.frame.size = CGSizeMake(80, 44)
        var center:CGPoint = titleLabel.center
        center.x = (titleView?.frame.width)!/2
        center.y = (titleView?.frame.height)!/2
        titleLabel.center = center
        
        titleLabel.text = title as String
        titleLabel.textColor = titleColor
        titleLabel.textAlignment = NSTextAlignment.Center
        titleLabel.font = UIFont.boldSystemFontOfSize(titleSize)
        titleView!.backgroundColor = titleViewColor
        titleView!.userInteractionEnabled = true
        titleView?.addSubview(titleLabel)
        view.addSubview(titleView!)
        
    }
    
    func leftItemButton(leftItemImgName:NSString) {
        let button = UIButton(type: .Custom)
        button.frame = CGRectMake(10, 0, 40, 40)
        button.setImage(UIImage(named: leftItemImgName as String), forState: .Normal)
        button.addTarget(self, action: Selector("leftItemButtonOnClick"), forControlEvents: .TouchUpInside)
        titleView!.addSubview(button)
    }
    
    func rightItemButton(rightItemImgName:NSString)  {
        let button = UIButton(type: .Custom)
        button.frame = CGRectMake(UIScreen.mainScreen().bounds.size.width-50, 0, 40, 40)
        button.setImage(UIImage(named: rightItemImgName as String), forState: .Normal)
        button.addTarget(self, action: Selector("rightItemButtonOnClick"), forControlEvents: .TouchUpInside)
        titleView!.addSubview(button)
    }
    func leftItemButtonOnClick() {
        print("左侧按钮~!")
    }
    func rightItemButtonOnClick() {
        print("右侧按钮~!")
        
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
