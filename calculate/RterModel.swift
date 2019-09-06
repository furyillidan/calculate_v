//
//  RterModel.swift
//  calculate
//
//  Created by Neo Chou on 2019/8/28.
//  Copyright © 2019 Neo. All rights reserved.
//

import Foundation


struct RterModel : Codable {
    var USDEUR : RterData?
    var USDTWD : RterData?
    var USDJPY : RterData?
    var USDHKD : RterData?
    var USDGBP : RterData?
    var USDCNY : RterData?
    var USDKRW : RterData?
    var USDAUD : RterData?
    var USDNZD : RterData?
    var USDSGD : RterData?
    var USDTHB : RterData?
    var USDCAD : RterData?
    var USDVND : RterData?
    var USDMOP : RterData?
    var USDPHP : RterData?
    var USDIDR : RterData?
    var USDDKK : RterData?
    var USDZAR : RterData?
    var USDMXN : RterData?
}



struct RterData : Codable {
    var Exrate : Double?
    var UTC : String?
    var NAME : String?
    
}
