//
//  HistoryCell.swift
//  hackathon
//
//  Created by zhouqi on 15/12/10.
//  Copyright © 2015年 zhouqi. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class HistoryCell: UITableViewCell {
    @IBOutlet weak var itemPriceLabel:UILabel!
//    @IBOutlet weak var itemNameLabel:UILabel!
    @IBOutlet weak var buyTimeLabel:UILabel!
    var history:BuyHistory!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        let itemPriceLabel = UILabel()
        self.addSubview(itemPriceLabel)
        self.itemPriceLabel = itemPriceLabel
        self.itemPriceLabel.frame = CGRectMake(0, 0, 100, 100)
        
        let buyTimeLabel = UILabel()
        self.addSubview(buyTimeLabel)
        self.buyTimeLabel = buyTimeLabel
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        itemPriceLabel.font = UIFont.systemFontOfSize(14)
        itemPriceLabel.snp_makeConstraints(closure: { (make) -> Void in
            make.left.equalTo(self).offset(10)
            make.top.equalTo(self.snp_top).offset(10)
        })
        buyTimeLabel.font = UIFont.systemFontOfSize(14)
        buyTimeLabel.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(itemPriceLabel.snp_bottom).offset(5)
            make.left.equalTo(self.snp_left).offset(10)
        }
//        itemBuyCntLabel.font = UIFont.systemFontOfSize(14)
//        itemBuyCntLabel.snp_makeConstraints { (make) -> Void in
//            make.right.equalTo(self).offset(-20)
//            make.top.equalTo(20)
//            //            make.left.equalTo(contentView.snp_centerX)
//            //            make.height.equalTo(20)
//            //            make.width.equalTo(100)
//        }
        //        itemPriceLabel.backgroundColor = UIColor.blueColor()
        //        itemBuyCntLabel.backgroundColor = UIColor.greenColor()
    }

}
