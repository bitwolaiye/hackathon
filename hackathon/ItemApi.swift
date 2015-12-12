//
//  ItemApi.swift
//  hackathon
//
//  Created by zhouqi on 15/12/10.
//  Copyright © 2015年 zhouqi. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class ItemApi: NSObject {
    static let sharedInstance = ItemApi()
    func getItem(url: String, callback: (Item) -> Void) -> Void {
        let request = Alamofire.request(.GET, url)
        request.responseJSON {
            response in
            if let value = response.result.value {
                let json = JSON(value)
                callback(Item.load(json))
                print("JSON: \(json)")
            }
        }
    }
    
    func getItemFromJL(url: String, callback: (Item) -> Void) -> Void {
        let request = Alamofire.request(.GET, url)
        request.responseJSON {
            response in
            if let value = response.result.value {
                let json = JSON(value)
                callback(Item.loadFromJL(json["data"]))
                print("JSON: \(json)")
            }
        }
    }
    
    func getList(callback: ([Item]) -> Void) -> Void {
        let request = Alamofire.request(.GET, "https://zhouqi.work/item/api/v1/user/1/item")
        request.responseJSON {
            response in
            if let value = response.result.value {
                
                let json = JSON(value)
                let list: Array<JSON> = json["items"].arrayValue
                callback(Item.load_array(list))
                //                if let name = json["items"] as NSArray {
                //                    //Do something you want
                //                } else {
                //                    print(json["name"])       // "Dictionary[\"name"] failure, It is not an dictionary"
                //                    print(json["name"].error) // "Dictionary[\"name"] failure, It is not an dictionary"
                //                }
                
                //                callback(Item.load_from())
                
                print("JSON: \(json)")
            }
            
            
            print(response.request)  // original URL request
            print(response.response) // URL response
            print(response.data)     // server data
            print(response.result)   // result of response serialization
            
            if let JSON = response.result.value {
                print("JSON: \(JSON)")
            }
        }
    }
}
