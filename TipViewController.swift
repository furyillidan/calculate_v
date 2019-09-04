//
//  TipViewController.swift
//  calculate
//
//  Created by Neo on 2017/9/3.
//  Copyright © 2017年 Neo. All rights reserved.
//

import UIKit
import GoogleMobileAds

class TipViewController: UIViewController {

   
    @IBOutlet weak var bannerView: GADBannerView!
    
    @IBOutlet weak var p1: UITextField!

    @IBOutlet weak var p2: UITextField!
    
    @IBOutlet weak var p3: UITextField!
    
    @IBOutlet weak var p4: UITextField!
    
    @IBOutlet weak var q1: UITextField!
    
    @IBOutlet weak var q2: UITextField!
    
    @IBOutlet weak var q3: UITextField!
    
    @IBOutlet weak var q4: UITextField!
    
    @IBOutlet weak var tip_P: UITextField!
    
    @IBOutlet weak var addTips: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    
        bannerView.adUnitID = "ca-app-pub-7115815341253727/5930322691"
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
    

    }
    
    
    
    @IBAction func calc(_ sender: Any) {
        
       var p1Value = Float(p1.text!)
       
        if let okp1Value = p1Value{
            p1Value = okp1Value
        }else{
            p1Value = 0
        }

       var p2Value = Float(p2.text!)
        
        if let okp2Value = p2Value{
            p2Value = okp2Value
        }else{
            p2Value = 0
        }

        
       var p3Value = Float(p3.text!)
        
        if let okp3Value = p3Value{
            p3Value = okp3Value
        }else{
            p3Value = 0
        }

       
       var p4Value = Float(p4.text!)
        
        if let okp4Value = p4Value{
            p4Value = okp4Value
        }else{
            p4Value = 0
        }

        
       var q1Value = Float(q1.text!)
        
        if let okq1Value = q1Value{
            q1Value = okq1Value
        }else{
            q1Value = 0
        }

        
       var q2Value = Float(q2.text!)
       
        if let okq2Value = q2Value{
            q2Value = okq2Value
        }else{
            q2Value = 0
        }

        
       var q3Value = Float(q3.text!)
        
        if let okq3Value = q3Value{
            q3Value = okq3Value
        }else{
            q3Value = 0
        }

        
       var q4Value = Float(q4.text!)
        
        if let okq4Value = q4Value{
            q4Value = okq4Value
        }else{
            q4Value = 0
        }

        
       var tipsP = Float(tip_P.text!)
        
        
        if tipsP == nil {
           tipsP = 0
        }
        
        
       let sum = Float((p1Value! * q1Value!) + (p2Value! * q2Value!) + (p3Value! * q3Value!) + (p4Value! * q4Value!))
        
       let tipsum = Float(sum + (sum * tipsP!/100))
        
        addTips.text = String(tipsum)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
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
