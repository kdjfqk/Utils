//
//  UIView+Extension.swift
//  YNCCProduct
//
//  Created by YNKJMACMINI2 on 16/5/23.
//  Copyright © 2016年 YNKJMACMINI2. All rights reserved.
//

import Foundation
import UIKit

extension UIView{
    
    //设置默认圆角
    func setDefaultRadius() {
        self.setRadius(5)
    }
    //设置圆角
    func setRadius(_ radius:CGFloat) {
        self.layer.cornerRadius = radius
        //self.clipsToBounds = true
    }
    //设置阴影
    func setShadow(_ shadowColor:UIColor) {
        self.layer.shadowColor = shadowColor.cgColor
        self.layer.shadowOffset = CGSize(width: 3, height: 3)
        self.layer.shadowOpacity = 1
        self.layer.shadowRadius = 5
    }
    //设置边框
    func setBoard(_ boardColor:UIColor) {
        self.setBoardWithWidth(1, boardColor: boardColor)
    }
    //设置边框
    func setBoardWithWidth(_ width:CGFloat,boardColor:UIColor) {
        self.layer.borderColor = boardColor.cgColor
        self.layer.borderWidth = width
    }
    //将view转换为Image
    func toImage() -> UIImage {
        UIGraphicsBeginImageContext(self.bounds.size)
        let currnetContext:CGContext = UIGraphicsGetCurrentContext()!
        self.layer.render(in: currnetContext)
        let result:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return result
    }
    
    //获取view的上一级ViewController
    var parentViewController:UIViewController? {
        get{
            var next:UIView? = self.superview
            while (next != nil) {
                if let nextResponder = next?.next {
                    if nextResponder.isKind(of: UIViewController.self) {
                        return nextResponder as? UIViewController
                    }else{
                        next = next?.superview
                    }
                }
            }
            return nil
        }
    }
    //获取view上一级NavigationController
    var navController:UINavigationController? {
        get{
            var next:UIView? = self.superview
            while (next != nil) {
                if let nextResponder = next?.next {
                    if nextResponder.isKind(of: UINavigationController.self) {
                        return nextResponder as? UINavigationController
                    }else{
                        next = next?.superview
                    }
                }
            }
            return nil
        }
    }
}
