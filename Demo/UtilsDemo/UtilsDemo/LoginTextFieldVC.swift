//
//  LoginTextFieldVC.swift
//  UtilsDemo
//
//  Created by ldy on 17/3/21.
//  Copyright © 2017年 BJYN. All rights reserved.
//

import UIKit

class LoginTextFieldVC: UIViewController {

    @IBOutlet var userTF: LoginTextField!
    @IBOutlet var pwdTF: LoginTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        userTF.setDefaultUserUI()
        pwdTF.setDefaultPwdUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func shake(){
        self.userTF.shake()
    }
    

}
