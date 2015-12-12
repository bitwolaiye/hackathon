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
        ItemApi.sharedInstance.getItemFromJL(url + "/product/data", callback: { (item:Item) -> Void in
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
//        let u = "http://172.21.208.47:8120/mobile/p0001/product"
        let defaults = NSUserDefaults.standardUserDefaults()
//        let token = ""
        let token = defaults.stringForKey("token")!
        print("get token \(token) ok!")
        let u = self.url + "/product?token=" + token
        self.request = NSURLRequest(URL: NSURL(string: u)!)
        self.webView.loadRequest(request)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ShowItemDetailWeb" {
            let itemDetailController:ItemDetailWebView2Controller = segue.destinationViewController as! ItemDetailWebView2Controller
            let defaults = NSUserDefaults.standardUserDefaults()
//            let token = ""
            let token = defaults.stringForKey("token")!
            print("get token \(token) ok!")
            itemDetailController.setUrl(self.url + "/buy?token=" + token)
//            itemDetailController.setUrl("http://172.21.208.47:8120/mobile/p0001/buy?token=51c3954031cedb19ab5f3d741c687fe75035bba897f395458a22245dc6dfaedd")
//            itemDetailController.setUrl(self.url + "/show")
            //            if let url = self.scanResult {
            //                itemDetailController.url = url
            //            } else {
            //                itemDetailController.url = "https://zhouqi.work/item/f9f62d"
            //            }
            
        }
    }
}
