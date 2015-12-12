//
//  ProfileViewController.swift
//  hackathon
//
//  Created by zhouqi on 15/12/12.
//  Copyright © 2015年 zhouqi. All rights reserved.
//

import UIKit
import SnapKit

class ProfileViewController: UIViewController {
    
    override func viewDidLoad() {
        let head = View()
        self.view.addSubview(head)
        head.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(self.view.snp_left).offset(10)
            make.right.equalTo(self.view.snp_right).offset(-10)
            make.top.equalTo(self.view.snp_top).offset(10)
            make.height.equalTo(200)
        }
        let avatar = View()
        head.addSubview(avatar)
        avatar.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(25)
            make.top.equalTo(25)
            make.width.equalTo(150)
            make.height.equalTo(150)
        }
        
        let list = View()
        head.addSubview(list)
        list.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(25)
            make.height.equalTo(150)
//            make.left.equalTo(make.snp_right)
        }
        
        
        let message = View()
        self.view.addSubview(message)
        message.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(self.view.snp_left).offset(10)
            make.right.equalTo(self.view.snp_right).offset(-10)
            make.top.equalTo(head.snp_bottom).offset(20)
            make.bottom.equalTo(self.view.snp_top).offset(-10)
        }
    }
}
