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
    var rterModelList = RterModel()
    var rterDataList = [RterData]()
    
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var bannerView: GADBannerView!
    @IBOutlet weak var textFiled: UITextField!
    @IBAction func hide(sender: UITextField) {
        sender.resignFirstResponder()
    }
    @IBOutlet weak var ansLabel: UILabel!
    @IBOutlet weak var transBtn: UIButton!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //callAd()
        getRter()
        
    }
    
    
    override func viewDidLayoutSubviews() {
        transBtn.layer.cornerRadius = 8
        transBtn.layer.borderWidth = 4
        transBtn.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5).cgColor
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
                
                self.pickerView.reloadAllComponents()
            }else{
                
            let controller = UIAlertController.init(title: "網路連線有問題", message: "", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            controller.addAction(action)
            self.present(controller, animated: true, completion: nil)
        }
      }
    }
    
    

    
    @IBAction func transferButton(_ sender: Any) {
        
        if textFiled.text == "" {
            let alert = UIAlertController(title: "沒輸入數字喔！", message: "請輸入數字", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
        }else if source != nil && target != nil {
            if source != target {
               let input = Double(textFiled.text!)
               let toUSD = input! / self.rterDataList[source!].Exrate!
               let changeToCurrency = toUSD * self.rterDataList[target!].Exrate!
               ansLabel.text = String(changeToCurrency)
            }else if source == target {
               ansLabel.text = textFiled.text
            }
        }else if (source == nil || target == nil) {
            let input = Double(textFiled.text!)
            let toUSD = input! / self.rterDataList[0].Exrate!
            let changeToCurrency = toUSD / self.rterDataList[0].Exrate!
            ansLabel.text = String(changeToCurrency)
        }
//            switch self.rterDataList[source!].NAME {
//
//                case "港幣(HKD)" :
//                print("T##items: Any...##Any")
//
//                default:
//                print("no")
//            }
//            if self.rterDataList[source!].NAME == "港幣(HKD)" {
//                let HKDToUSD = input! / self.rterDataList[source!].Exrate!
//                let changeToCurrency = HKDToUSD / self.rterDataList[target!].Exrate!
//                ansLabel.text = String(changeToCurrency)
//            }
//            let co = self.rterDataList[source!].Exrate
//            let cod = self.rterDataList[target!].Exrate
//            print(co)
//        }
        
        //判斷值是某為nil 否 就給0 防crack
//        if let oksource = source{
//            source = oksource
//        }else{
//            source = 0
//        }
//
//        if  target != nil{
//            target = target!
//        }else{
//            target = 0
//        }
//
//
//
//        var input = Double(textFiled.text!)
//
//
//        var  base = Double(source!)
//
//        var change = Double(target!)
//
//
//
//        if let okinput = input{
//            input = okinput
//        }else{
//            input = 0
//        }

     //確認第幾row 給多少值去計算
        
//        if (source == 0 && target == 0){
//            base = 1
//            change = 1
//        }else if(source == 0 && target == 1){
//            base = 1
//            change = 0.028
//        }else if (source == 0 && target == 2){
//            base = 1
//            change = 0.032
//        }else if (source == 0 && target == 3){
//            base = 1
//            change = 3.74
//        }else if (source == 0 && target == 4){
//            base = 1
//            change = 0.25
//        }
//
//        if (source == 1 && target == 0) {
//            base = 1
//            change = 34.84
//        }else if(source == 1 && target == 1){
//            base = 1
//            change = 1
//        }else if (source == 1 && target == 2){
//            base = 1
//            change = 1.14
//        }else if (source == 1 && target == 3){
//            base = 1
//            change = 129.5
//        }else if (source == 1 && target == 4){
//            base = 1
//            change = 0.876
//        }
//
//        if (source == 2 && target == 0) {
//            base = 1
//            change = 30.3
//        }else if(source == 2 && target == 1){
//            base = 1
//            change = 0.872
//        }else if (source == 2 && target == 2){
//            base = 1
//            change = 1
//        }else if (source == 2 && target == 3){
//            base = 1
//            change = 112.4
//        }else if (source == 2 && target == 4){
//            base = 1
//            change = 0.765
//        }
//
//
//        if (source == 3 && target == 0) {
//            base = 1
//            change = 3.69
//        }else if(source == 3 && target == 1){
//            base = 1
//            change = 0.0078
//        }else if (source == 3 && target == 2){
//            base = 1
//            change = 0.0089
//        }else if (source == 3 && target == 3){
//            base = 1
//            change = 1
//        }else if (source == 3 && target == 4){
//            base = 1
//            change = 0.0068
//        }
//
//
//        if (source == 4 && target == 0) {
//            base = 1
//            change = 39.66
//        }else if(source == 4 && target == 1){
//            base = 1
//            change = 1.139
//        }else if (source == 4 && target == 2){
//            base = 1
//            change = 146.8
//        }else if (source == 4 && target == 3){
//            base = 1
//            change = 146.8
//        }else if (source == 4 && target == 4){
//            base = 1
//            change = 1
//        }
//
//
//        let sum = Double (input! * base * change)
//
//        ansLabel.text = String(sum)
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    
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
        return rterDataList.count
    }
    
//pickerview 會來問每一row的文字
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return rterDataList[row].NAME
    }
    
//可以知道選到那個row
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0 { // ==0  就是=0
            source = row
            
        }else{
            target = row
        }
    }
}

