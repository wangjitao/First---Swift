//
//  GlobalVariable.swift
//  MYFirstSwiftDemo
//
//  Created by 王纪涛 on 16/3/21.
//  Copyright © 2016年 YDSports (Beijing) Technology Co. All rights reserved.
//

import Foundation
import UIKit


/**********文件************/
/// cache文件路径
let cachesPath: String = NSSearchPathForDirectoriesInDomains(.CachesDirectory, .UserDomainMask, true).last!



/***********界面尺寸***********/
/* 导航高度 */
let kNavigationH:CGFloat = 64.0
/* 导航条高度 */
let kNavigationBarH:CGFloat = 44.0
/* 工具栏高度 */
let kTabBarHeight:CGFloat = 49.0
/* 屏幕的宽 */
public let kSCREEN_WIDTH  = UIScreen.mainScreen().bounds.size.width
/* 屏幕的高 */
public let kSCREEN_HEIGHT  = UIScreen.mainScreen().bounds.size.height
/* 屏幕的宽 */
public let kMAIN_BOUNDS: CGRect = UIScreen.mainScreen().bounds

//尺寸等比缩放(以5s为标准)
public let kScreenWidthRatio = (kSCREEN_WIDTH / 320.0)
public let kScreenHeightRatio = (kSCREEN_HEIGHT / 568.0)

func AdaptedWidthValueas(x:CGFloat) -> CGFloat {
    let AdaptedWidthFloat = ceilf(Float((x) * kScreenWidthRatio))
    let AdaptedWidthCGFloat = CGFloat(AdaptedWidthFloat)
    return AdaptedWidthCGFloat
}
func AdaptedHeightValue(x:CGFloat) -> CGFloat {
    let AdaptedHeightFloat = ceilf(Float((x) * kScreenWidthRatio))
    let AdaptedHeightCGFloat = CGFloat(AdaptedHeightFloat)
    return AdaptedHeightCGFloat
}



/************设备信息************/
// Swift获取唯一标识
var uniqueString = NSProcessInfo.processInfo().globallyUniqueString




/************加载Xib****************/
/**
 加载Xib
 - parameter nibName: Xib名字
 - returns: AnyObject
 */
func kloadNibNamed(nibName:String)-> AnyObject
{
    return NSBundle.mainBundle().loadNibNamed(nibName, owner: nil, options: nil).first!
}

func kRegisterNib(nibName:String)-> UINib
{
    return UINib(nibName: nibName, bundle: nil)
}




/****************View******************/
//RGBA函数
func kRGBA (r:CGFloat, g:CGFloat, b:CGFloat, a:CGFloat) -> UIColor
{
    return UIColor(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a)
}

// MARK: - ViewW
func kViewW (v:UIView) -> CGFloat
{
    return v.frame.size.width
}
// MARK: - ViewH
func kViewH (v:UIView) -> CGFloat
{
    return v.frame.size.height
}
// MARK: - ViewX
func kViewX (v:UIView) -> CGFloat
{
    return v.frame.origin.x
}
// MARK: - ViewY
func kViewY (v:UIView) -> CGFloat
{
    return v.frame.origin.y
}
// MARK: - ViewXW
func kViewXW (v:UIView) -> CGFloat
{
    return v.frame.origin.x + v.frame.size.width
}
// MARK: - ViewYH
func kViewYH (v:UIView) -> CGFloat
{
    return v.frame.origin.y + v.frame.size.height
}



/******************调试相关*****************/
// MARK: - 快速打印代码执行时间
/*
*TICK
code 代码块
*TOCK
*/
let TICK = NSDate()
let TOCK: () = print("Time:\(-TICK.timeIntervalSinceNow)")




/*******************主题配置*****************/
struct Theme {
    /* APP导航条barButtonItem文字大小 */
    static let kNavItemFont: UIFont = UIFont.systemFontOfSize(16)
    /* APP导航条titleFont文字大小 */
    static let kNavTitleFont: UIFont = UIFont.systemFontOfSize(18)
    /* ViewController的背景颜色 */
    static let kBackgroundColor: UIColor = kRGBA(255, g: 255, b: 255, a: 1)
    /* webView的背景颜色 */
    static let kWebViewBacagroundColor: UIColor = kRGBA(245, g: 245, b: 245, a: 1)
    /* 导航栏背景颜色 */
    static let kBarTintColor: UIColor = kRGBA(47, g: 46, b: 51, a: 1)
}