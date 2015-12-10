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
    //    var buyTime:date = nil
    dynamic var buyPrice:Int = 0
}

class Item {
    dynamic var itemUrl:String = ""
    dynamic var itemId:Int = 0
    dynamic var itemName:String = ""
    dynamic var itemDesc:String = ""
    dynamic var itemPrice:String = ""
    
    let buyHistories = List<BuyHistory>()
    
    init(itemUrl: String, itemId: Int, itemName: String, itemDesc: String, itemPrice: String, buyHistories: [BuyHistory]) {
        self.itemUrl = itemUrl
        self.itemId = itemId
        self.itemName = itemName
        self.itemDesc = itemDesc
        self.itemPrice = itemPrice
//        self.buyHistories = buyHistories
    }
}

