//
//  Item.swift
//  hackathon
//
//  Created by zhouqi on 15/12/10.
//  Copyright © 2015年 zhouqi. All rights reserved.
//
import Foundation
import RealmSwift

class BuyHistory: Object {
    dynamic var id:Int = 0
    dynamic var buyTime = NSDate(timeIntervalSince1970: 1)
    dynamic var buyPrice:String = ""
    
    override static func primaryKey() -> String? {
        return "id"
    }
}

class Item: Object {
    dynamic var itemUrl:String = ""
    dynamic var itemId:Int = 0
    dynamic var itemName:String = ""
    dynamic var itemDesc:String = ""
    dynamic var itemPrice:String = ""
    
    override static func primaryKey() -> String? {
        return "itemUrl"
    }
    
    let buyHistories = List<BuyHistory>()
    
//    init(itemUrl: String, itemId: Int, itemName: String, itemDesc: String, itemPrice: String, buyHistories: [BuyHistory]) {
//        self.itemUrl = itemUrl
//        self.itemId = itemId
//        self.itemName = itemName
//        self.itemDesc = itemDesc
//        self.itemPrice = itemPrice
////        self.buyHistories = buyHistories
//    }
    
    func saveOrUpdate() {
        let realm = try! Realm()
        
        try! realm.write {
            realm.add(self, update: true)
        }
    }
}

