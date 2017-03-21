//
//  YNTabBarUtil.swift
//  HTHSCNCMonitor
//
//  Created by ldy on 16/8/10.
//  Copyright © 2016年 BJYN. All rights reserved.
//

import UIKit

class YNTabBarUtil: NSObject {

    //设置背景图片
    class func setBackgroundImage(_ tabbar:UITabBar, imageName:String){
        tabbar.backgroundImage = UIImage(named: imageName)?.resizableImage(withCapInsets: UIEdgeInsetsMake(0, 0, 0, 0), resizingMode: .stretch)
    }
    //设置背景颜色
    class func setBackgroundColor(_ tabbar:UITabBar, color:UIColor){
        tabbar.barTintColor = color
    }
    //设置BarItem未选中标题颜色
    class func setBarItemTitleNormalColor(_ barItem:UITabBarItem, color:UIColor){
        barItem.setTitleTextAttributes([NSForegroundColorAttributeName: color], for: UIControlState.normal)
    }
    //设置BarItem选中标题颜色
    class func setBarItemTitleSelectedColor(_ barItem:UITabBarItem, color:UIColor){
        barItem.setTitleTextAttributes([NSForegroundColorAttributeName: color], for: UIControlState.selected)
    }
    //设置BarItem未选中图片
    class func setBarItemNormalImage(_ barItem:UITabBarItem, imageName:String){
        barItem.image = UIImage(named: imageName)?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
    }
    //设置BarItem选中图片
    class func setBarItemSelectedImage(_ barItem:UITabBarItem, imageName:String){
        barItem.selectedImage = UIImage(named: imageName)?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
    }
    class func setSelectedItemBg(_ tabbar:UITabBar,color:UIColor,itemCount:Int){
        let height = tabbar.frame.height
        let width = tabbar.frame.width/CGFloat(itemCount)
        tabbar.selectionIndicatorImage = color.toImage(CGSize(width: width, height: height))
    }
}
