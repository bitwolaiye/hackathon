//
//  OrderApi.swift
//  hackathon
//
//  Created by zhouqi on 15/12/12.
//  Copyright © 2015年 zhouqi. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class OrderApi: NSObject {
    static let sharedInstance = OrderApi()
        
    func getList(url: String, callback: ([Order]) -> Void) -> Void {
        let request = Alamofire.request(.GET, url)
        request.responseJSON {
            response in
            if let value = response.result.value {
                let json = JSON(value)
                let list: Array<JSON> = json["data"].arrayValue
                callback(Order.load_array(list))
            }
        }
    }
}
