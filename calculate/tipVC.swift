//
//  tipVC.swift
//  calculate
//
//  Created by Neo on 2022/5/12.
//  Copyright © 2022 Neo. All rights reserved.
//

import UIKit

class tipVC: UIViewController {

    @IBOutlet weak var price1: UITextField!
    @IBOutlet weak var qty1: UITextField!
    @IBOutlet weak var price2: UITextField!
    @IBOutlet weak var qty2: UITextField!
    @IBOutlet weak var price3: UITextField!
    @IBOutlet weak var qty3: UITextField!
    @IBOutlet weak var price4: UITextField!
    @IBOutlet weak var qty4: UITextField!
    @IBOutlet weak var price5: UITextField!
    @IBOutlet weak var qty5: UITextField!
    
    
    @IBOutlet weak var tipPercentage: UITextField!
    
    @IBOutlet weak var showTotal: UILabel!
    
    @IBOutlet weak var calBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setUp()
        
    }
    
    
    func setUp() {
        
        price1.text = "0"
        price2.text = "0"
        price3.text = "0"
        price4.text = "0"
        price5.text = "0"
        
        qty1.text = "0"
        qty2.text = "0"
        qty3.text = "0"
        qty4.text = "0"
        qty5.text = "0"
        
        price1.setCorner()
        price2.setCorner()
        price3.setCorner()
        price4.setCorner()
        price5.setCorner()
        
        qty1.setCorner()
        qty2.setCorner()
        qty3.setCorner()
        qty4.setCorner()
        qty5.setCorner()
        
        tipPercentage.setCorner()
        showTotal.setCorner()
        calBtn.setCorner()
        
        
    }
    

    @IBAction func calBtnPress(_ sender: Any) {
        
        
        let total1 = self.calPrice(price: price1.text?.stringToDouble(), qty: qty1.text?.stringToDouble())
        
        let total2 = self.calPrice(price: price2.text?.stringToDouble(), qty: qty2.text?.stringToDouble())
        
        let total3 = self.calPrice(price: price3.text?.stringToDouble(), qty: qty3.text?.stringToDouble())
        
        let total4 = self.calPrice(price: price4.text?.stringToDouble(), qty: qty4.text?.stringToDouble())
        
        let total5 = self.calPrice(price: price5.text?.stringToDouble(), qty: qty5.text?.stringToDouble())
        
        let tipPercentage = (total1 + total2 + total3 + total4 + total5) * ((tipPercentage.text?.stringToDouble() ?? 0) / 100) + (total1 + total2 + total3 + total4 + total5)
        
        showTotal.text = String(tipPercentage)
        
    }
    
    
    func calPrice (price: Double? , qty: Double?) -> Double {
        
        let total = (price ?? 0 ) * (qty ?? 0)
        
        return total
    }
    

}
