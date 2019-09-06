//
//  ViewController.swift
//  calculate
//
//  Created by Neo on 2016/11/27.
//  Copyright © 2016年 Neo. All rights reserved.
//

import UIKit
import GoogleMobileAds
import CoreData

class ViewController: UIViewController, GADBannerViewDelegate {

    @IBOutlet weak var nameInputText: UITextField!
    @IBOutlet weak var priceInputText: UITextField!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var pcsTextInput: UITextField!
    @IBOutlet weak var qtyTextInput: UITextField!
    @IBOutlet weak var aveLabelShow: UILabel!
    @IBOutlet weak var calBtn: UIButton!
    @IBOutlet weak var calAveConstraint: NSLayoutConstraint!
    @IBOutlet weak var priceStackConstraint: NSLayoutConstraint!
    @IBOutlet weak var aveStackConstraint: NSLayoutConstraint!
    @IBOutlet weak var pricePConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var bannerView: GADBannerView!
    let mainHeight = UIScreen.main.bounds.size.height
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        //callAd()
        }
    
    override func viewDidLayoutSubviews() {
        
        if mainHeight > 568 {
            nameInputText.frame.size = CGSize(width: self.nameInputText.frame.width, height: 60)
            nameInputText.layer.cornerRadius = 4
            priceInputText.frame.size = CGSize(width: self.priceInputText.frame.width, height: 60)
            priceInputText.layer.cornerRadius = 4
            stackView.frame.size = CGSize(width: self.stackView.frame.width, height: 60)
            pcsTextInput.frame.size = CGSize(width: self.pcsTextInput.frame.width, height: 60)
            pcsTextInput.layer.cornerRadius = 4
            qtyTextInput.frame.size = CGSize(width: self.qtyTextInput.frame.width, height: 60)
            qtyTextInput.layer.cornerRadius = 4
            calBtn.frame.size = CGSize(width: self.calBtn.frame.width, height: 100)
            calBtn.layer.masksToBounds = false
            calBtn.layer.cornerRadius = 8
            calBtn.layer.borderWidth = 3
            calBtn.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5).cgColor

       }else{
            nameInputText.frame.size = CGSize(width: self.nameInputText.frame.width, height: 45)
            nameInputText.layer.cornerRadius = 4
            priceInputText.frame.size = CGSize(width: self.priceInputText.frame.width, height: 45)
            priceInputText.layer.cornerRadius = 4
            stackView.frame.size = CGSize(width: self.stackView.frame.width, height: 45)
            pcsTextInput.frame.size = CGSize(width: self.pcsTextInput.frame.width, height: 45)
            pcsTextInput.layer.cornerRadius = 4
            qtyTextInput.frame.size = CGSize(width: self.qtyTextInput.frame.width, height: 45)
            qtyTextInput.layer.cornerRadius = 4
            calAveConstraint.constant = 20
            priceStackConstraint.constant = 40
            aveStackConstraint.constant = 30
            pricePConstraint.constant = 30
            calBtn.layer.masksToBounds = false
            calBtn.layer.cornerRadius = 8
            calBtn.layer.borderWidth = 3
            calBtn.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5).cgColor
            stackView.spacing = 90
       }
    }
    
 
    var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func calData(_ sender: Any) {
        
        if (priceInputText!.text != "") && (qtyTextInput!.text != "") && (pcsTextInput!.text != "") {
            
            let price = priceInputText.text ?? "0"
            let qty = qtyTextInput.text ?? "0"
            let pcs = pcsTextInput.text ?? "0"
            
            let sum = Double(price)! / (Double(qty)! * Double(pcs)!)
            
            aveLabelShow.text = String(sum)
        }else{
            let alert = UIAlertController(title: "", message: "請輸入數字", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(action)
            
            self.present(alert, animated: true, completion: nil)
        }
    }

    func callAd () {
        bannerView.adUnitID = "ca-app-pub-7115815341253727/5930322691"
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}

