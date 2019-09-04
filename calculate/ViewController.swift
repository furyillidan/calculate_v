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

    @IBOutlet weak var bannerView: GADBannerView!
    var nameText = UITextField()
    var priceText = UITextField()
    var pcsText = UITextField()
    var qtyText = UITextField()
    var aveBtn = UIButton()
    var calBtn = UIButton()
    let namePriceWidth : CGFloat = UIScreen.main.bounds.size.width - 100
    let namePriceHeight : CGFloat = 60
    let pcsQtyWidth : CGFloat = 100
    let pcsQtyHeight : CGFloat = 60
    let nameTextYPosition : CGFloat = 66
    let aveCalHeight : CGFloat = 80
    let aveCalWidth : CGFloat = 180
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layout()
        //callAd()
        }
    
 
    func layout() {
        
        nameText.frame = CGRect(x: ((UIScreen.main.bounds.size.width - namePriceWidth) / 2), y: nameTextYPosition, width: namePriceWidth, height: namePriceHeight)
        nameText.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.6)
        priceText.frame = CGRect(x: ((UIScreen.main.bounds.size.width - namePriceWidth) / 2), y: nameTextYPosition + nameText.frame.height + 30, width: namePriceWidth, height:namePriceHeight)
        priceText.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.5)
        
        pcsText.frame = CGRect(x: ((UIScreen.main.bounds.size.width - namePriceWidth) / 2), y: nameTextYPosition + nameText.frame.height + 30 + 100, width: pcsQtyWidth, height: pcsQtyHeight)
        pcsText.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.4)
        qtyText.frame = CGRect(x: ((UIScreen.main.bounds.size.width - namePriceWidth) / 2) + pcsText.frame.size.width + 90, y: nameTextYPosition + nameText.frame.height + 30 + 100, width: pcsQtyWidth, height: pcsQtyHeight)
        qtyText.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.3)
        
        aveBtn.frame = CGRect(x: ((UIScreen.main.bounds.size.width - namePriceWidth) / 2) + 40, y: nameTextYPosition + nameText.frame.height + 30 + 90 + pcsQtyWidth, width: aveCalWidth, height: aveCalHeight)
        aveBtn.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.2)
        aveBtn.setTitle("AVG", for: .normal)
        calBtn.frame = CGRect(x: ((UIScreen.main.bounds.size.width - namePriceWidth) / 2) + 40, y:  nameTextYPosition + nameText.frame.height + 30 + 120 + pcsQtyWidth + 60, width: aveCalWidth, height: aveCalHeight)
        calBtn.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        calBtn.setTitle("Cal", for: .normal)
        
        self.view.addSubview(nameText)
        self.view.addSubview(priceText)
        self.view.addSubview(pcsText)
        self.view.addSubview(qtyText)
        self.view.addSubview(aveBtn)
        self.view.addSubview(calBtn)
        
    }

 
    @IBOutlet weak var textField1: UITextField!

    @IBOutlet weak var textField2: UITextField!
    
    @IBOutlet weak var textFiled3: UITextField!
    
    @IBOutlet weak var ans: UILabel!
    
    
    var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func add(_ sender: Any) {
      
        
        
       var price = Double(textField1.text!)
        
       var qty = Double(textField2.text!)
        
       var pcs = Double(textFiled3.text!)
        
        
       
        if let okprice = price{
            price = okprice
        }else{
            price = 0
        }
   
        if let okqty = qty{
            qty = okqty
        }else{
            qty = 0
        }

        if let okpcs = pcs{
            pcs = okpcs
        }else{
            pcs = 0
        }
        
        
       let sum = Double (price! / (qty! * pcs!))
        
        ans.text = String(sum)
        
        
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

