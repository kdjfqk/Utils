//
//  LoginTextField.swift
//  YNMonitoring
//
//  Created by ldy on 16/11/9.
//  Copyright © 2016年 BJYN. All rights reserved.
//

import UIKit

let LTFColor:UIColor = UIColor(white: 1, alpha: 0.5)

class LoginTextField: UITextField,Shakable,UITextFieldDelegate{
    
    //MARK:- override
    override func leftViewRect(forBounds bounds: CGRect) -> CGRect{
        var rect = super.leftViewRect(forBounds: bounds)
        rect.origin.x += 15
        return rect
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 45, dy: 0)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 45, dy: 0)
    }
    
    //MARK:- 设置UI样式
    /// 使用默认UI样式
    func setDefaultUI(){
        self.kbMoving.kbMovingView = self.parentViewController?.view
        self.setDefaultRadius()
        self.setBoard(LTFColor)
        self.textColor = LTFColor
        self.delegate = self
        self.backgroundColor = UIColor.clear
    }
    
    
    /// 使用默认用户名输入框UI样式
    func setDefaultUserUI(){
        self.setDefaultUI()
        self.setPlaceholder("用户名", color: LTFColor)
        self.setLeftImage(UIImage(named: "l_user")!)
    }
    
    
    /// 使用默认密码输入框UI样式
    func setDefaultPwdUI(){
        self.setDefaultUI()
        self.setPlaceholder("密码", color: LTFColor)
        self.setLeftImage(UIImage(named: "l_pwd")!)
    }
    
    /// 自定义UI样式
    ///
    /// - parameter placeholder:      placeholder文本
    /// - parameter leftViewImage:    左侧图片
    /// - parameter placeholderColor: placeholder文本颜色
    /// - parameter boardWidth:       board宽度
    /// - parameter boardColor:       board颜色
    /// - parameter textColor:        文本颜色
    /// - parameter radius:           圆角
    func configUI(_ placeholder:String, leftImage:UIImage, placeholderColor:UIColor = UIColor.gray, boardWidth:Float = 1, boardColor:UIColor = UIColor(white: 1, alpha: 0.5), textColor:UIColor = UIColor.black, radius:Float = 0){
        self.delegate = self
        self.kbMoving.kbMovingView = self.parentViewController?.view
        self.setBoard(CGFloat(boardWidth), radius: CGFloat(radius), color: boardColor)
        self.setPlaceholder(placeholder, color: placeholderColor)
        self.setContentColor(textColor)
        self.setLeftImage(leftImage)
    }
    
    //MARK:- 单独设置某项的样式
    
    ///设置placeholder
    ///
    /// - parameter phStr: 文本
    /// - parameter color: 颜色
    func setPlaceholder(_ phStr:String,color:UIColor){
        self.attributedPlaceholder = NSAttributedString(string: phStr, attributes:[NSForegroundColorAttributeName : color])
    }
    
    /// 设置左侧图片
    ///
    /// - parameter img: img
    func setLeftImage(_ img:UIImage){
        let imgSize:CGSize = img.size
        let imageView :UIImageView = UIImageView.init(frame: CGRect.init(x: 10, y: 0, width: imgSize.width, height: imgSize.height))
        imageView.image = img
        self.leftView = imageView
        self.leftViewMode = UITextFieldViewMode.always
    }
    
    
    /// 设置board
    ///
    /// - parameter width:  宽度
    /// - parameter radius: 圆角
    /// - parameter color:  颜色
    func setBoard(_ width:CGFloat,radius: CGFloat,color:UIColor){
        self.setRadius(radius)
        self.setBoardWithWidth(width, boardColor: color)
    }
    
    
    /// 设置文本颜色
    ///
    /// - parameter color: 颜色
    func setContentColor(_ color:UIColor){
        self.textColor = color
    }
    
    //MARK:- UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
