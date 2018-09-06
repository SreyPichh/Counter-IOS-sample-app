//
//  ViewControllerSubview.swift
//  Counter
//
//  Created by Jilay-PC on 8/24/18.
//  Copyright © 2018 Jilay-PC. All rights reserved.
//

import Foundation
import UIKit
import SnapKit
import RxSwift
import RxCocoa

class ViewControllerSubview {
    lazy var addBnt: UIButton = {
        let addButton = UIButton()
        addButton.setTitle("+", for: UIControlState.normal)
        addButton.backgroundColor = UIColor.darkGray
        return addButton
    }()
    lazy var textResult: UILabel = {
        let textLabel = UILabel()
        textLabel.text = "0"
        textLabel.font = UIFont.boldSystemFont(ofSize: 25)
        textLabel.textColor = UIColor.gray
        return textLabel
    }()
    lazy var minusBnt: UIButton = {
        let minusButton = UIButton()
        minusButton.setTitle("-", for: UIControlState.normal)
        
        minusButton.backgroundColor = UIColor.darkGray
        return minusButton
    }()
    func updateContraint(ViewController: ViewController) {
        self.addBnt.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(40)
            make.centerY.equalToSuperview()
            make.height.equalTo(40)
        }
        self.textResult.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
        self.minusBnt.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-40)
            make.centerY.equalToSuperview()
            make.height.equalTo(40)
        }
    }
}
