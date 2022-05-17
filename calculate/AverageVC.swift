//
//  AverageVC.swift
//  calculate
//
//  Created by Neo on 2022/5/11.
//  Copyright © 2022 Neo. All rights reserved.
//

import UIKit
import CoreData

class AverageVC: UIViewController {

    @IBOutlet weak var proudtNameTF: UITextField!
    @IBOutlet weak var priceTF: UITextField!
    
    @IBOutlet weak var pcsPicker: UIPickerView!
    
    @IBOutlet weak var calBtn: UIButton!

    @IBOutlet weak var resultsLabel: UILabel!
    @IBOutlet weak var pcsLabel: UILabel!
    @IBOutlet weak var qtyLabel: UILabel!

    @IBOutlet weak var productView: UIView!
    
    var pcsValue = 1
    var qtyValue = 1
    
    var pickerPrice = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()

        setUp()
        
        pcsPicker.delegate = self
        pcsPicker.dataSource = self
  
        // Do any additional setup after loading the view.
    }
    

    func setUp () {
        
        for i in 1...10000 {
            pickerPrice.append(String(i))
        }
        
        resultsLabel.text = "平均價格"
        proudtNameTF.text = "產品名稱"
        priceTF.text = "0"
        
        proudtNameTF.setCorner()
        priceTF.setCorner()
        calBtn.setCorner()
        resultsLabel.setCorner()
        pcsLabel.setCorner()
        pcsLabel.backgroundColor = UIColor(red: 1, green: 0, blue: 1, alpha: 0.03)
        qtyLabel.setCorner()
        qtyLabel.backgroundColor = UIColor(red: 1, green: 0, blue: 1, alpha: 0.03)
        
    }
    
    
    
    @IBAction func calBtnPress(_ sender: Any) {

        let price = Double(priceTF.text ?? "0") ?? 0
        let pcs = Double(pcsValue)
        let qty = Double(qtyValue)
        
        //let sum = Double(price)! / (Double(qty)! * Double(pcs)!)
        
        let avg = price / (qty * pcs)
        resultsLabel.text = String(format: "%.2f", avg)
        
    }
    
}


extension AverageVC: UIPickerViewDelegate , UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        pickerPrice.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//
//        if component == 0 {
//            print("0")
//            pcsValue = pickerView.selectedRow(inComponent: 0) + 1
//            print("件數：\(pickerView.selectedRow(inComponent: 0))")
//        }else {
//            print("1")
//            qtyValue = pickerView.selectedRow(inComponent: 1) + 1
//            print("數量:\(pickerView.selectedRow(inComponent: 1))")
//        }
        
        return pickerPrice[row]
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if component == 0 {
            
            pcsValue = pickerView.selectedRow(inComponent: component) + 1
            
            print(pcsValue)
        }else{
            
            qtyValue = pickerView.selectedRow(inComponent: component) + 1
            
            print(qtyValue)
        }
        
    }
    
    
}
