//
//  ViewControllerSubview.swift
//  counterDemo
//
//  Created by Jilay-PC on 9/6/18.
//  Copyright © 2018 pich. All rights reserved.
//

import Foundation
import SnapKit

class ViewControllerSubView{
    lazy var addBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("+", for: UIControlState.normal)
        btn.backgroundColor = UIColor.darkGray
        return btn
    }()
    lazy var minusBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("-", for: .normal)
        btn.backgroundColor = UIColor.darkGray
        return btn
    }()
    lazy var number: UITextField = {
        let num = UITextField()
        num.text = "0"
        return num
    }()
    
    func ViewControllerUpdateConstrains() {
        self.addBtn.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(40)
            make.centerY.equalToSuperview()
            make.height.equalTo(40)
            
        }
        self.minusBtn.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-40)
            make.centerY.equalToSuperview()
            make.height.equalTo(40)
        }
        self.number.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.height.equalTo(40)
        }
    }
}
