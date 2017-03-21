//
//  UIColor+Extension.swift
//  YNCCProduct
//
//  Created by ldy on 16/9/7.
//  Copyright © 2016年 YNKJMACMINI2. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    
    /// 将颜色转换为图片
    ///
    /// - parameter size: 图片大小
    ///
    /// - returns: UIImage
    func toImage(_ size:CGSize)->UIImage {
        UIGraphicsBeginImageContext(size)
        let context:CGContext = UIGraphicsGetCurrentContext()!
        let (r,g,b,a) = self.getRGBA()
        context.setFillColor([r,g,b,a])
        context.fill(CGRect(x: 0, y: 0, width: size.width, height: size.height))
        let img:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return img
    }
    
    
    /// 获取颜色的alpha值
    ///
    /// - returns: alpha值
    func getAlpha()->CGFloat{
        return self.getRGBA().3
    }
    
    /// 修改颜色的alpha值
    ///
    /// - parameter alpha: alpha值
    ///
    /// - returns: 修改后的颜色
    func setAlpha(_ alpha:CGFloat)->UIColor{
        let (r,g,b,_) = self.getRGBA()
        return UIColor(red: r, green: g, blue: b, alpha: alpha)
    }
    
    
    /// 获取颜色的 r、g、b、a值
    ///
    /// - returns: (r、g、b、a)元组
    func getRGBA()->(r:CGFloat,g:CGFloat,b:CGFloat,a:CGFloat){
        var r:CGFloat = 0
        var g:CGFloat = 0
        var b:CGFloat = 0
        var a:CGFloat = 0
        self.getRed(&r, green: &g, blue: &b, alpha: &a)
        return (r,g,b,a)
    }
}
