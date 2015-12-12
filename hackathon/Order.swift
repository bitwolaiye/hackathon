//
//  Order.swift
//  hackathon
//
//  Created by zhouqi on 15/12/12.
//  Copyright © 2015年 zhouqi. All rights reserved.
//

import Foundation
import RealmSwift

class Order: Object {
    dynamic var orderUrl:String = ""
    dynamic var orderId:Int = 0
    dynamic var orderTime = NSDate(timeIntervalSince1970: 1)
    dynamic var orderStatus:String = ""
    dynamic var orderPrice:String = ""
    dynamic var itemName = ""
    
    override static func primaryKey() -> String? {
        return "orderUrl"
    }

    func saveOrUpdate() {
        let realm = try! Realm()
        
        try! realm.write {
            realm.add(self, update: true)
        }
    }
}
