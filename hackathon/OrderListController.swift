//
//  OrderListController.swift
//  hackathon
//
//  Created by zhouqi on 15/12/12.
//  Copyright © 2015年 zhouqi. All rights reserved.
//

import Foundation
import UIKit

class OrderListController: UITableViewController {
    var orders:[Order]!
    
    override func viewWillAppear(animated: Bool) {
        if orders == nil || orders.count == 0 {
            self.reloadDataFromApi()
        }
        self.navigationController?.navigationBarHidden = false;
    }

    
    func reloadDataFromApi() {
        let selfController:OrderListController = self
        OrderApi.sharedInstance.getList("", callback: { (orders:[Order]) -> Void in
            selfController.orders = orders
            selfController.tableView.reloadData()
        })
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orders.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = OrderCell(style: UITableViewCellStyle.Default, reuseIdentifier: "OrderCell")
        cell.order = orders[indexPath.row]
        cell.showOrder()
        return cell
    }

    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return OrderCell().height()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ShowOrderDetailWeb" {
            let orderDetailVC:OrderDetailWebViewController = segue.destinationViewController as! OrderDetailWebViewController
            orderDetailVC.setUrl(self.orders[self.tableView.indexPathForSelectedRow!.item].orderUrl)
        }
    }
}
