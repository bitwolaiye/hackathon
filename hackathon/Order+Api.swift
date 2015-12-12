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
        let orders = [Order]()
        for each:JSON in array {
            //            items.append(Item(itemUrl: "", itemId: each["item_id"].int!, itemName: each["item_name"].string!, itemDesc: each["item_desc"].string!, itemPrice: each["item_price"].string!, buyHistories: []))
        }
        return orders
    }
}
