//
//  Item+Api.swift
//  hackathon
//
//  Created by zhouqi on 15/12/10.
//  Copyright © 2015年 zhouqi. All rights reserved.
//

import Foundation
import SwiftyJSON

extension Item {
    static func load_array(array: Array<JSON>) -> [Item] {
        var items = [Item]()
        for each:JSON in array {
//            items.append(Item(itemUrl: "", itemId: each["item_id"].int!, itemName: each["item_name"].string!, itemDesc: each["item_desc"].string!, itemPrice: each["item_price"].string!, buyHistories: []))
        }
        return items
    }
    
    static func load(json: JSON) -> Item {
        return Item(value: ["itemId": json["item_id"].int!, "itemName": json["item_name"].string!, "itemDesc": json["item_desc"].string!, "itemPrice": json["item_price"].string!])
    }
}
