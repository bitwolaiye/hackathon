//
//  ItemDetailWebViewController.swift
//  hackathon
//
//  Created by zhouqi on 15/12/10.
//  Copyright © 2015年 zhouqi. All rights reserved.
//

import UIKit
import SnapKit


class ItemDetailWebViewController: UIViewController {
    @IBOutlet weak var webView: UIWebView!
    var request:NSURLRequest!
    
    override func viewDidLoad() {
        
    }
    override func viewWillAppear(animated: Bool) {
        self.edgesForExtendedLayout = UIRectEdge.None
        self.webView.loadRequest(request)
    }
    
    func setUrl(url:String) {
        self.request = NSURLRequest(URL: NSURL(string: url)!)
    }
}
