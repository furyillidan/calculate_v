//
//  HelpVC.swift
//  calculate
//
//  Created by Neo on 2022/5/17.
//  Copyright © 2022 Neo. All rights reserved.
//

import UIKit

class HelpVC: UIViewController {

    @IBOutlet weak var avgHelpTV: UITextView!
    @IBOutlet weak var tipHelpTV: UITextView!
    @IBOutlet weak var transferHelpTV: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUp()
    }
    
    
    func setUp () {
        
        avgHelpTV.text = "算均價 \n 可以幫助你算出每個產品的平均價格來做比價，例如：有一瓶100克果汁 賣30 跟 一瓶150克果汁 賣35到底哪個比較划算。"
        tipHelpTV.text = "算小費 \n 提供最多同時累加5個項目，來幫你算出加上小費後的價格。"
        transferHelpTV.text = "算匯率 \n 目前提供6個國家的幣種，讓你可以查詢最新的匯率換算結果。"
        
    }
    
    
    
    
}
