//
//  ItemListController.swift
//  hackathon
//
//  Created by zhouqi on 15/12/10.
//  Copyright © 2015年 zhouqi. All rights reserved.
//

import Foundation
import UIKit
import AVKit
import QRCodeReaderViewController
import QRCodeReaderViewController.QRCodeReader

class ItemListController: UITableViewController, QRCodeReaderDelegate {
    var items:[Item]!
    var vc:QRCodeReaderViewController!
    var scanResult:String?
    
    override func viewDidLoad() {
        let reader:QRCodeReader = QRCodeReader(metadataObjectTypes: [AVMetadataObjectTypeQRCode])
        self.vc = QRCodeReaderViewController.readerWithCancelButtonTitle("Cancel", codeReader: reader, startScanningAtLoad: true)
        
        self.vc.modalPresentationStyle = UIModalPresentationStyle.FullScreen
        self.vc.delegate = self
        self.navigationController!.navigationBar.translucent = false;
    }
    
    override func viewWillAppear(animated: Bool) {
        if items == nil {
            self.reloadDataFromApi()
            self.reloadDataFromCache()
        }
        self.navigationController?.navigationBarHidden = false;
    }
    
    func reloadDataFromApi() {
        let selfController:ItemListController = self
        ItemApi.sharedInstance.getList { (item: [Item]) -> Void in
            selfController.items = item
            self.tableView.reloadData()
        }
    }
    
    func reloadDataFromCache() {
        var items:[Item]! = []
        items.append(Item(itemUrl: "", itemId: 1, itemName: "牙刷", itemDesc: "", itemPrice: "5.00", buyHistories: []))
        items.append(Item(itemUrl: "", itemId: 2, itemName: "牙膏", itemDesc: "", itemPrice: "12.00", buyHistories: []))
        items.append(Item(itemUrl: "", itemId: 3, itemName: "洗发水", itemDesc: "", itemPrice: "20.00", buyHistories: []))
        items.append(Item(itemUrl: "", itemId: 4, itemName: "护发素", itemDesc: "", itemPrice: "30.00", buyHistories: []))
        items.append(Item(itemUrl: "", itemId: 5, itemName: "面霜", itemDesc: "", itemPrice: "40.00", buyHistories: []))
        self.items = items
    }
    
    override func viewDidAppear(animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = ItemCell(style: UITableViewCellStyle.Default, reuseIdentifier: "ItemCell")
        cell.setItem(items[indexPath.row])
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("ShowItemDetail", sender: self)
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return ItemCell().height()
    }
    
    func reader(reader: QRCodeReaderViewController!, didScanResult result: String!) {
        self.dismissViewControllerAnimated(true) { () -> Void in
            NSLog("%@", result)
            self.scanResult = result
            self.performSegueWithIdentifier("showWeb", sender: self)
        }
    }
    
    func readerDidCancel(reader: QRCodeReaderViewController!) {
        self.dismissViewControllerAnimated(true, completion: { () -> Void in
            self.performSegueWithIdentifier("showWeb", sender: self)
        })
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showWeb" {
            let itemDetailController:ItemDetailWebViewController = segue.destinationViewController as! ItemDetailWebViewController
            if let url = self.scanResult {
                itemDetailController.setUrl(url)
            } else {
                itemDetailController.setUrl("http://baidu.com/")
            }
            
        }
    }
    //    - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    //    // segue.identifier：获取连线的ID
    //    if ([segue.identifier isEqualToString:@"SendValue"]) {
    //    // segue.destinationViewController：获取连线时所指的界面（VC）
    //    ReceiveViewController *receive = segue.destinationViewController;
    //    receive.name = @"Garvey";
    //    receive.age = 110;
    //    // 这里不需要指定跳转了，因为在按扭的事件里已经有跳转的代码
    //    //        [self.navigationController pushViewController:receive animated:YES];
    //    }
    //    }
    
    @IBAction func scan(sender: AnyObject) {
        self.presentViewController(self.vc, animated: true, completion: nil)
    }
}
