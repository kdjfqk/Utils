//
//  YNNavigationUtil.swift
//  HTHSCNCMonitor
//
//  Created by ldy on 16/8/10.
//  Copyright © 2016年 BJYN. All rights reserved.
//

import UIKit

enum YNNavigationBarPosition {
    case left
    case right
}

class YNNavigationUtil: NSObject {
    
    //设置导航条背景图片
    class func setBackgroundImage(_ navigationBar:UINavigationBar, imageName:String){
        navigationBar.setBackgroundImage(UIImage(named: imageName)?.resizableImage(withCapInsets: UIEdgeInsetsMake(0, 0, 0, 0), resizingMode: .stretch), for: .default)
    }
    //设置导航条背景色
    class func setBackgroundColor(_ navigationBar:UINavigationBar, color:UIColor){
        navigationBar.barTintColor = color
    }
    //设置导航条左右按钮的颜色
    class func setBarItemColor(_ navigationBar:UINavigationBar, color:UIColor){
        navigationBar.tintColor = color
    }
    //设置导航条标题颜色
    class func setTitleColor(_ navigationBar:UINavigationBar, color:UIColor){
        let attr: [String : AnyObject] = [NSForegroundColorAttributeName: color]
        navigationBar.titleTextAttributes = attr
    }
    //设置导航条左侧按钮 图片
    class func setLeftBarImage(_ navigationItem:UINavigationItem, imageName image:String, target:AnyObject?, action:Selector) {
        let barItem = UIBarButtonItem(image: UIImage(named: image), style: UIBarButtonItemStyle.plain, target: target, action: action)
        navigationItem.leftBarButtonItem = barItem
    }
    //设置导航条左侧按钮 系统按钮
    class func setLeftBar(_ navigationItem:UINavigationItem, systemItem:UIBarButtonSystemItem, target:AnyObject?, action:Selector) {
        let barItem = UIBarButtonItem(barButtonSystemItem: systemItem, target: target, action: action)
        navigationItem.leftBarButtonItem = barItem
    }
    //设置导航条左侧按钮 文本
    class func setLeftBarTitle(_ navigationItem:UINavigationItem, title:String, target:AnyObject?, action:Selector) {
        let barItem = UIBarButtonItem(title: title, style: UIBarButtonItemStyle.plain, target: target, action: action)
        navigationItem.leftBarButtonItem = barItem
    }
    //设置导航条右侧按钮 图片
    class func setRightBarImage(_ navigationItem:UINavigationItem, imageName image:String, target:AnyObject?, action:Selector) {
        let barItem = UIBarButtonItem(image: UIImage(named: image), style: UIBarButtonItemStyle.plain, target: target, action: action)
        navigationItem.rightBarButtonItem = barItem
    }
    //设置导航条右侧按钮 系统按钮
    class func setRightBar(_ navigationItem:UINavigationItem, systemItem:UIBarButtonSystemItem, target:AnyObject?, action:Selector) {
        let barItem = UIBarButtonItem(barButtonSystemItem: systemItem, target: target, action: action)
        navigationItem.rightBarButtonItem = barItem
    }
    //设置导航条右侧按钮 文本
    class func setRightBarTitle(_ navigationItem:UINavigationItem, title:String, target:AnyObject?, action:Selector) {
        let barItem = UIBarButtonItem(title: title, style: UIBarButtonItemStyle.plain, target: target, action: action)
        navigationItem.rightBarButtonItem = barItem
    }
}
