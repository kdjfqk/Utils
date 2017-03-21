//
//  VerticalBtnVC.swift
//  UtilsDemo
//
//  Created by ldy on 17/3/21.
//  Copyright © 2017年 BJYN. All rights reserved.
//

import UIKit

class VerticalBtnVC: UIViewController {
    
    @IBOutlet var btn: ImgTitleVerticalButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        btn.setBoardWithWidth(1, boardColor: UIColor.lightGray)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
