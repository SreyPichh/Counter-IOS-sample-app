//
//  ViewController.swift
//  Counter
//
//  Created by Jilay-PC on 8/24/18.
//  Copyright © 2018 Jilay-PC. All rights reserved.
//

import UIKit
import ReactorKit
import RxSwift

class ViewController: UIViewController {
    private let subview: ViewControllerSubview = ViewControllerSubview()
    var disposeBag: DisposeBag = DisposeBag()
}
extension ViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.addSubview(self.subview.addBnt)
        self.view.addSubview(self.subview.textResult)
        self.view.addSubview(self.subview.minusBnt)
        self.reactor = ViewControllerReactor()
        print(self.reactor)
    }
    override func viewDidLayoutSubviews() {
        self.subview.updateContraint(ViewController: self)
    }
}
//bind view with ReactorKit
extension ViewController: StoryboardView {
    func bind(reactor: ViewControllerReactor) {
        self.subview.addBnt.rx.tap
            .map{Reactor.Action.increaseNumber}
            .bind(to: reactor.action)
            .disposed(by: self.disposeBag)
        self.subview.minusBnt.rx.tap
            .map{Reactor.Action.decreaseNumber}
            .bind(to: reactor.action)
            .disposed(by: self.disposeBag)
        self.reactor?.state
            .map { String($0.resultState) } //convert resultState type Int to String
            .bind(to: self.subview.textResult.rx.text)
            .disposed(by: self.disposeBag)
    }
}


