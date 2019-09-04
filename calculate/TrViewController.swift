//
//  ViewController.swift
//  HelloPickView
//
//  Created by Neo on 2017/7/7.
//  Copyright © 2017年 inow. All rights reserved.
//

import UIKit
import GoogleMobileAds

class TrViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, GADBannerViewDelegate {
    
    var source : Int?
    var target : Int?
    var stops = ["NTD","ERU","USD","JPY","GBP"]
    var rterModelList = [RterModel]()
    var rterDataList = [RterData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //callAd()
        getRter()
        
    }
    
    func callAd () {
        bannerView.adUnitID = "ca-app-pub-7115815341253727/5930322691"
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
    }
    
    func getRter () {
        NetService.shared.getRterData(parameter: [:]) { (response) in
            let decoder = JSONDecoder()
            let data = response.data
            let result = try? decoder.decode(RterModel.self, from: data!)
            if result != nil {
                self.rterDataList.append((result?.USDALL)!)
                self.rterDataList.append((result?.USDCOP)!)
                
                for i in self.rterDataList {
                    print(i)
                    
                }
                
            }
            let controller = UIAlertController.init(title: "網路連線有問題", message: "", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            controller.addAction(action)
            self.present(controller, animated: true, completion: nil)
        }
    }
    
    
    @IBOutlet weak var bannerView: GADBannerView!
    
    @IBOutlet weak var textFiled: UITextField!
    
    @IBAction func hide(sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    @IBOutlet weak var ansLabel: UILabel!
    
    
    @IBAction func transferButton(_ sender: Any) {
        
        //判斷值是某為nil 否 就給0 防crack
        if let oksource = source{
            source = oksource
        }else{
            source = 0
        }
        
        if  target != nil{
            target = target!
        }else{
            target = 0
        }
        
    
        
        var input = Double(textFiled.text!)
        
        
        var  base = Double(source!)
        
        var change = Double(target!)

        
        
        if let okinput = input{
            input = okinput
        }else{
            input = 0
        }

     //確認第幾row 給多少值去計算
        
        if (source == 0 && target == 0){
            base = 1
            change = 1
        }else if(source == 0 && target == 1){
            base = 1
            change = 0.028
        }else if (source == 0 && target == 2){
            base = 1
            change = 0.032
        }else if (source == 0 && target == 3){
            base = 1
            change = 3.74
        }else if (source == 0 && target == 4){
            base = 1
            change = 0.25
        }
  
        if (source == 1 && target == 0) {
            base = 1
            change = 34.84
        }else if(source == 1 && target == 1){
            base = 1
            change = 1
        }else if (source == 1 && target == 2){
            base = 1
            change = 1.14
        }else if (source == 1 && target == 3){
            base = 1
            change = 129.5
        }else if (source == 1 && target == 4){
            base = 1
            change = 0.876
        }

        if (source == 2 && target == 0) {
            base = 1
            change = 30.3
        }else if(source == 2 && target == 1){
            base = 1
            change = 0.872
        }else if (source == 2 && target == 2){
            base = 1
            change = 1
        }else if (source == 2 && target == 3){
            base = 1
            change = 112.4
        }else if (source == 2 && target == 4){
            base = 1
            change = 0.765
        }
        
        
        if (source == 3 && target == 0) {
            base = 1
            change = 3.69
        }else if(source == 3 && target == 1){
            base = 1
            change = 0.0078
        }else if (source == 3 && target == 2){
            base = 1
            change = 0.0089
        }else if (source == 3 && target == 3){
            base = 1
            change = 1
        }else if (source == 3 && target == 4){
            base = 1
            change = 0.0068
        }
        
        
        if (source == 4 && target == 0) {
            base = 1
            change = 39.66
        }else if(source == 4 && target == 1){
            base = 1
            change = 1.139
        }else if (source == 4 && target == 2){
            base = 1
            change = 146.8
        }else if (source == 4 && target == 3){
            base = 1
            change = 146.8
        }else if (source == 4 && target == 4){
            base = 1
            change = 1
        }
        
        
        let sum = Double (input! * base * change)
        
        ansLabel.text = String(sum)
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    
    @IBOutlet weak var pickerView: UIPickerView!

 
    
    override func viewDidAppear(_ animated: Bool) {
        pickerView.selectRow(2, inComponent: 0, animated: true)
        pickerView.reloadComponent(1) // viewDidAppear UIViewController對象的視圖已經加入到窗口時調用
    }                                 //
    
  
//pickerview 會來問要有幾個component
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
//pickerview 會來問個別component要幾個row
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return stops.count
    }
    
//pickerview 會來問每一row的文字
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return stops[row]
    }
    
//可以知道選到那個row
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0 { // ==0  就是=0
           print(stops[row])
            source = row
            
        }else{
           print(stops[row])
            target = row
        }
    }
}

