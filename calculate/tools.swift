//
//  tools.swift
//  calculate
//
//  Created by Neo on 2022/5/16.
//  Copyright © 2022 Neo. All rights reserved.
//

import Foundation
import UIKit

extension UITextField {
    
    func setCorner () {
        
        self.layer.cornerRadius = self.frame.height / 2
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.gray.cgColor
        self.clipsToBounds = true
        
    }
    
}


extension UILabel {
    
    func setCorner () {
        
        self.layer.cornerRadius = self.frame.height / 2
        self.layer.masksToBounds = true
        
    }
    
}



extension UIButton {
    
    func setCorner () {
        
        self.layer.cornerRadius = self.frame.height / 2
        self.clipsToBounds = true
        
    }
    
}


extension String {
    
    func stringToDouble() -> Double? {
        
        let double = Double(self)
        
        return double
    }
    
}
