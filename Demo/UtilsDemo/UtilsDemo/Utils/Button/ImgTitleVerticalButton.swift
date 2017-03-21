//
//  ImgTitleVerticalButton.swift
//  YNCCProduct
//
//  Created by ldy on 16/8/19.
//  Copyright © 2016年 YNKJMACMINI2. All rights reserved.
//

import UIKit

let ImgTitleButtonVerticalSpace:CGFloat = 4

//标题和图片垂直排列的Button
class ImgTitleVerticalButton: UIButton {

    override func layoutSubviews() {
        super.layoutSubviews()
        //调整title和image位置
        if self.currentImage != nil && self.titleLabel != nil {
            let frame:CGRect = CGRect(x: 0, y: self.frame.size.height - 16 - ImgTitleButtonVerticalSpace, width: self.frame.size.width, height: 16)
            self.titleLabel?.frame = frame
            let width:CGFloat = self.currentImage!.size.width
            let height:CGFloat = self.currentImage!.size.height
            let x:CGFloat = (self.frame.size.width - width) / 2
            let y:CGFloat = (self.frame.size.height - self.titleLabel!.frame.height - height) / 2  //self.titleLabel!.frame.origin.y - height - ImgTitleButtonVerticalSpace
            let imageFrame:CGRect = CGRect(x: x, y: y, width: width, height: height)
            self.imageView?.frame = imageFrame
            self.titleLabel?.textAlignment = NSTextAlignment.center
        }
    }

}
