//
//  ItemDetailWebView2Controller.swift
//  hackathon
//
//  Created by zhouqi on 15/12/11.
//  Copyright © 2015年 zhouqi. All rights reserved.
//

import UIKit
import SnapKit

class ItemDetailWebView2Controller: UIViewController {
    @IBOutlet weak var webView: UIWebView!
    var request:NSURLRequest!
    
    override func viewDidLoad() {
        self.webView.snp_makeConstraints { (make) -> Void in
            make.width.equalTo(self.view.snp_width)
            make.height.equalTo(self.view.snp_height)
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        
    }
    
    override func viewWillAppear(animated: Bool) {
        self.edgesForExtendedLayout = UIRectEdge.None

        
//        self.webView.frame.size.width = 300
//        self.webView.contentMode = UIViewContentMode.ScaleAspectFit
//        self.webView.scalesPageToFit = true
        self.webView.loadRequest(request)
    }
    
    func setUrl(url:String) {
        self.request = NSURLRequest(URL: NSURL(string: url)!)
    }

}
