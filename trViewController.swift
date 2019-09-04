//
//  trViewController.swift
//  calculate
//
//  Created by Neo on 2017/7/22.
//  Copyright © 2017年 Neo. All rights reserved.
//

import UIKit

class trViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    
    var source : Int?
    var target : Int?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var pickerView: UIPickerView!
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        pickerView.selectRow(2, inComponent: 0, animated: true)
        pickerView.reloadComponent(1) // viewDidAppear UIViewController對象的視圖已經加入到窗口時調用
    }                                 //
    
    var stops = ["NTD","ERU","USD","JPY","GBP"]
    
    
    
    
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
