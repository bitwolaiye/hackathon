//
//  OrderDetailWebViewController.swift
//  hackathon
//
//  Created by zhouqi on 15/12/12.
//  Copyright © 2015年 zhouqi. All rights reserved.
//

import Foundation
import UIKit

class OrderDetailWebViewController: UIViewController {
    @IBOutlet weak var webView: UIWebView!
    var request:NSURLRequest!
    
    override func viewDidLoad() {
        self.webView.snp_makeConstraints { (make) -> Void in
            make.width.equalTo(self.view.snp_width)
            make.height.equalTo(self.view.snp_height)
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        self.edgesForExtendedLayout = UIRectEdge.None
        self.webView.loadRequest(request)
    }

    func setUrl(url:String) {
        self.request = NSURLRequest(URL: NSURL(string: url)!)
    }
}
