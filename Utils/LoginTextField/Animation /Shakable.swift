//
//  Shakable.swift
//  POPTest
//
//  Created by ldy on 16/12/5.
//  Copyright © 2016年 BJYN. All rights reserved.
//

import Foundation
import UIKit

/// 定义摇晃接口
protocol Shakable {}
// MARK: - 为UIView添加默认实现v
extension Shakable where Self : UIView {
    func shake(){
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.05
        animation.repeatCount = 5
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: self.center.x - 4.0, y: self.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: self.center.x + 4.0, y: self.center.y))
        layer.add(animation, forKey: "position")
    }
}
