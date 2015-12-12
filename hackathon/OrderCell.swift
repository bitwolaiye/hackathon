//
//  OrderCell.swift
//  hackathon
//
//  Created by zhouqi on 15/12/12.
//  Copyright © 2015年 zhouqi. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class OrderCell: UITableViewCell {
    @IBOutlet weak var orderPriceLabel:UILabel!
    @IBOutlet weak var itemNameLabel:UILabel!
    @IBOutlet weak var orderTimeLabel:UILabel!
    @IBOutlet weak var orderStatusLabel:UILabel!
    var order:Order!
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        let orderPriceLabel = UILabel()
        self.addSubview(orderPriceLabel)
        self.orderPriceLabel = orderPriceLabel
        self.orderPriceLabel.frame = CGRectMake(0, 0, 100, 100)
        
        let itemNameLabel = UILabel()
        self.addSubview(itemNameLabel)
        self.itemNameLabel = itemNameLabel
        
        let orderTimeLabel = UILabel()
        self.addSubview(orderTimeLabel)
        self.orderTimeLabel = orderTimeLabel
        
        let orderStatusLabel = UILabel()
        self.addSubview(orderStatusLabel)
        self.orderStatusLabel = orderStatusLabel
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        itemNameLabel.font = UIFont.systemFontOfSize(14)
        itemNameLabel.snp_makeConstraints(closure: { (make) -> Void in
            make.left.equalTo(self).offset(10)
            make.top.equalTo(self.snp_top).offset(10)
        })
        
        orderTimeLabel.font = UIFont.systemFontOfSize(12)
        orderTimeLabel.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(itemNameLabel.snp_bottom).offset(5)
            make.left.equalTo(self.snp_left).offset(10)
        }
        
        orderStatusLabel.font = UIFont.systemFontOfSize(12)
        orderStatusLabel.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(orderTimeLabel.snp_right).offset(10)
            make.width.equalTo(100)
        }
        
        orderPriceLabel.font = UIFont.systemFontOfSize(14)
        orderPriceLabel.snp_makeConstraints { (make) -> Void in
            make.right.equalTo(self).offset(-20)
            make.top.equalTo(20)
        }
    }
    
    func height() -> CGFloat {
        return 50
    }
    
    func showOrder() {
        self.itemNameLabel.text = self.order.itemName
        self.orderTimeLabel.text = self.order.orderTime.toRelativeCocoaString()!
        self.orderStatusLabel.text = self.order.orderStatus
        self.orderPriceLabel.text = self.order.orderStatus
    }
}
