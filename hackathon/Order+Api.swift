//
//  Order+Api.swift
//  hackathon
//
//  Created by zhouqi on 15/12/12.
//  Copyright © 2015年 zhouqi. All rights reserved.
//

import Foundation
import SwiftyJSON
import SwiftDate

extension Order {
    static func load_array(array: Array<JSON>) -> [Order] {
        var orders = [Order]()
        for each:JSON in array {
            let orderDict = ["itemName": each["title"].string!, "orderUrl": each["url"].string!, "orderStatus": each["status"].string!, "orderPrice": each["price"].string!, "orderTime": each["createTime"].string!.toDate(DateFormat.Custom("YYYY-MM-dd HH:mm"))!]
            let order = Order(value: orderDict)
            orders.append(order)
        }
        return orders
    }
}
