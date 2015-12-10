//
//  ItemDetailController.swift
//  hackathon
//
//  Created by zhouqi on 15/12/10.
//  Copyright © 2015年 zhouqi. All rights reserved.
//

import UIKit
import RealmSwift

class ItemDetailController: UIViewController {
    var url:String!
    
    override func viewDidLoad() {
        let url = self.url
        ItemApi.sharedInstance.getItem(url, callback: { (item:Item) -> Void in
            item.itemUrl = url
            item.saveOrUpdate()
        })
    }
    
    override func viewWillAppear(animated: Bool) {
        self.edgesForExtendedLayout = UIRectEdge.None
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ShowItemDetailWeb" {
            let itemDetailController:ItemDetailWebViewController = segue.destinationViewController as! ItemDetailWebViewController
            itemDetailController.setUrl(self.url + "/show")
//            if let url = self.scanResult {
//                itemDetailController.url = url
//            } else {
//                itemDetailController.url = "https://zhouqi.work/item/f9f62d"
//            }
            
        }
    }
}
