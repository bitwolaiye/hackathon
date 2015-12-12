//
//  ItemCell.swift
//  hackathon
//
//  Created by zhouqi on 15/12/10.
//  Copyright © 2015年 zhouqi. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class ItemCell: UITableViewCell {
    @IBOutlet weak var itemPriceLabel:UILabel!
    @IBOutlet weak var itemNameLabel:UILabel!
    @IBOutlet weak var itemBuyCntLabel:UILabel!
    var item:Item!
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        let itemPriceLabel = UILabel()
        self.addSubview(itemPriceLabel)
        self.itemPriceLabel = itemPriceLabel
        self.itemPriceLabel.frame = CGRectMake(0, 0, 100, 100)
        
        let itemNameLabel = UILabel()
        self.addSubview(itemNameLabel)
        self.itemNameLabel = itemNameLabel
        
        let itemBuyCntLabel = UILabel()
        self.addSubview(itemBuyCntLabel)
        self.itemBuyCntLabel = itemBuyCntLabel
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
        itemPriceLabel.font = UIFont.systemFontOfSize(14)
        itemPriceLabel.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(itemNameLabel.snp_bottom).offset(5)
            make.left.equalTo(self.snp_left).offset(10)
        }
        itemBuyCntLabel.font = UIFont.systemFontOfSize(14)
        itemBuyCntLabel.snp_makeConstraints { (make) -> Void in
            make.right.equalTo(self).offset(-20)
            make.top.equalTo(20)
        }
    }
    
    func height() -> CGFloat {
        return 50
    }
    
    func setItem1(item: Item) {
        self.item = item
        self.itemPriceLabel.text = "￥" + self.item.itemPrice
        self.itemNameLabel.text = self.item.itemName
        self.itemBuyCntLabel.text = "已购买 \(self.item.orderCnt) 次"
    }
    
    func showPrice(price: Int) -> String {
        return String(Double(price) / 100.0)
    }
}
