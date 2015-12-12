//
//  ItemDetail2Controller.swift
//  hackathon
//
//  Created by zhouqi on 15/12/11.
//  Copyright © 2015年 zhouqi. All rights reserved.
//

import UIKit
import RealmSwift

class ItemDetail2Controller: UIViewController {
    @IBOutlet weak var webView: UIWebView!
    
    var url:String!
    var request:NSURLRequest!
    
    override func viewDidLoad() {
        let url = self.url
        ItemApi.sharedInstance.getItem(url, callback: { (item:Item) -> Void in
            item.itemUrl = url
            item.saveOrUpdate()
        })
        self.webView.snp_makeConstraints { (make) -> Void in
            make.width.equalTo(self.view.snp_width)
            make.height.equalTo(self.view.snp_height)
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        self.edgesForExtendedLayout = UIRectEdge.None
        let u = "http://172.21.208.47:8120/mobile/p0001/product"
        self.request = NSURLRequest(URL: NSURL(string: u)!)
        self.webView.loadRequest(request)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ShowItemDetailWeb" {
            let itemDetailController:ItemDetailWebView2Controller = segue.destinationViewController as! ItemDetailWebView2Controller
            itemDetailController.setUrl("http://172.21.208.47:8120/mobile/p0001/buy?token=51c3954031cedb19ab5f3d741c687fe75035bba897f395458a22245dc6dfaedd")
//            itemDetailController.setUrl(self.url + "/show")
            //            if let url = self.scanResult {
            //                itemDetailController.url = url
            //            } else {
            //                itemDetailController.url = "https://zhouqi.work/item/f9f62d"
            //            }
            
        }
    }
}
