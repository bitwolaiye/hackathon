//
//  Item+Api.swift
//  hackathon
//
//  Created by zhouqi on 15/12/10.
//  Copyright © 2015年 zhouqi. All rights reserved.
//

import Foundation
import SwiftyJSON
import SwiftDate

extension BuyHistory {
    static func load_array(array: Array<JSON>) -> [BuyHistory] {
        var histories = [BuyHistory]()
        for each:JSON in array {
            let historyDict = ["id": each["buy_history_id"].int!, "buyTime": each["buy_time"].string!.toDate(DateFormat.ISO8601)!, "buyPrice": each["item_price"].string!]
            histories.append(BuyHistory(value: historyDict))
        }
        return histories
    }
}

extension Item {
    static func load_array(array: Array<JSON>) -> [Item] {
        let items = [Item]()
        for each:JSON in array {
//            items.append(Item(itemUrl: "", itemId: each["item_id"].int!, itemName: each["item_name"].string!, itemDesc: each["item_desc"].string!, itemPrice: each["item_price"].string!, buyHistories: []))
        }
        return items
    }
    
    static func load(json: JSON) -> Item {
        let itemDict = ["itemId": json["item_id"].int!, "itemName": json["item_name"].string!, "itemDesc": json["item_desc"].string!, "itemPrice": json["item_price"].string!]
        let item = Item(value: itemDict)
        item.buyHistories.appendContentsOf(BuyHistory.load_array(json["histories"].arrayValue))
        return item
    }
}

