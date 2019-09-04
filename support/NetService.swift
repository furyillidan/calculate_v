//
//  NetService.swift
//  calculate
//
//  Created by Neo Chou on 2019/8/28.
//  Copyright © 2019 Neo. All rights reserved.
//

import UIKit
import Alamofire

public typealias DataResponse = Alamofire.DataResponse

class NetService : NSObject {
    
    static let shared = NetService()
    static let AFManager : Alamofire.SessionManager = {
       let config = URLSessionConfiguration.default
        config.httpAdditionalHeaders = SessionManager.defaultHTTPHeaders
        config.timeoutIntervalForRequest = 10
        return Alamofire.SessionManager(configuration: config)
    }()
    
    
    func getRterData (parameter:[String:Any], callback: @escaping (DataResponse<Any>) -> Void ) {
        let url = "https://tw.rter.info/capi.php"
        getRequest(url: url, parameter: [:], callback: callback)
    }
    
    func getRequest (url: String, parameter: [String:Any]? , callback:@escaping (DataResponse<Any>) -> Void) {
        
        NetService.AFManager.request(url, method: .get, parameters: parameter, encoding: URLEncoding.default, headers: nil).responseJSON { (response:DataResponse) in
            
            callback(response)
            
            switch (response.result) {
            case .success(_):
                if response.result.value != nil {
                    print(response.request?.httpMethod! as Any, response.request?.url! as Any)
                }
            case .failure(_):
                break
            }
        }
    }
}
