//
//  RterModel.swift
//  calculate
//
//  Created by Neo Chou on 2019/8/28.
//  Copyright © 2019 Neo. All rights reserved.
//

import Foundation


struct RterModel : Codable {
    var USDCOP : RterData?
    var USDALL : RterData?
}



struct RterData : Codable {
    var Exrate : Double?
    var UTC : String?
}
