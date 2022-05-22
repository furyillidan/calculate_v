//
//  transferVC.swift
//  calculate
//
//  Created by Neo on 2022/5/17.
//  Copyright © 2022 Neo. All rights reserved.
//

import UIKit

class transferVC: UIViewController {

    @IBOutlet weak var currencyPicker: UIPickerView!
    @IBOutlet weak var inputTF: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var calBtn: UIButton!
    
    var rterModelList = RterModel()
    var rterDataList = [RterData]()

    var coin1 = 1.0
    var coin2 = 1.0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUp()
        getRter()
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func setUp() {
        
        currencyPicker.delegate = self
        currencyPicker.dataSource = self
        
        inputTF.setCorner()
        resultLabel.setCorner()
        calBtn.setCorner()
        
    }
    
    
    
    
    @IBAction func calBtnPress(_ sender: Any) {
        
        
        if inputTF.text == "" {
            let alert = UIAlertController(title: "沒輸入數字喔！", message: "請輸入數字", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
        }else {
            
            let inPutValue = inputTF.text?.stringToDouble() ?? 0
            
            let total = (inPutValue / coin1) * coin2
            
            resultLabel.text = String(format: "%.4f", total)
            
        }
        
        
    }
    
    func getRter () {
        NetService.shared.getRterData(parameter: [:]) { (response) in
            let decoder = JSONDecoder()
            let data = response.data
            let result = try? decoder.decode(RterModel.self, from: data!)
            if result != nil {
                self.rterModelList = result!
                self.rterDataList.append((result?.USDEUR)!)
                self.rterDataList[0].NAME = "歐元(EUR)"
                self.rterDataList.append((result?.USDJPY)!)
                self.rterDataList[1].NAME = "日幣(JPY)"
                self.rterDataList.append((result?.USDHKD)!)
                self.rterDataList[2].NAME = "港幣(HKD)"
                self.rterDataList.append((result?.USDCNY)!)
                self.rterDataList[3].NAME = "人民幣(CNY)"
                self.rterDataList.append((result?.USDTWD)!)
                self.rterDataList[4].NAME = "台幣(TWD)"
                self.rterDataList.append((result?.USDGBP)!)
                self.rterDataList[5].NAME = "英鎊(GBP)"
                
                self.currencyPicker.reloadAllComponents()
            }else{
                
            let controller = UIAlertController.init(title: "網路連線有問題", message: "", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            controller.addAction(action)
            self.present(controller, animated: true, completion: nil)
        }
      }
    }
    
    
}


extension transferVC: UIPickerViewDelegate , UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return rterDataList.count
        
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return rterDataList[row].NAME
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if component == 0 {
            
            print(rterDataList[row].NAME , rterDataList[row].Exrate)
            coin1 = Double(rterDataList[row].Exrate ?? 0)
            
        }else{
            
            print(rterDataList[row].NAME , rterDataList[row].Exrate)
            coin2 = Double(rterDataList[row].Exrate ?? 0)
            
        }
        
        
    }
    
}
