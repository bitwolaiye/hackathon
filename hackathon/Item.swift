//
//  Item.swift
//  hackathon
//
//  Created by zhouqi on 15/12/10.
//  Copyright © 2015年 zhouqi. All rights reserved.
//

class Item {
    var itemUrl:String = ""
    var itemId:Int = 0
    var itemName:String = ""
    var itemDesc:String = ""
    var itemPrice:String = ""
    
    var buyHistories:[BuyHistory] = []
    
    init(itemUrl: String, itemId: Int, itemName: String, itemDesc: String, itemPrice: String, buyHistories: [BuyHistory]) {
        self.itemUrl = itemUrl
        self.itemId = itemId
        self.itemName = itemName
        self.itemDesc = itemDesc
        self.itemPrice = itemPrice
        self.buyHistories = buyHistories
    }
}

class BuyHistory {
    var id:Int = 0
    //    var buyTime:date = nil
    var buyPrice:Int = 0
}