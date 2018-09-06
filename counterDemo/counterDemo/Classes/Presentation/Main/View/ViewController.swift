//
//  ViewController.swift
//  counterDemo
//
//  Created by Jilay-PC on 9/6/18.
//  Copyright © 2018 pich. All rights reserved.
//

import UIKit
import ReactorKit
import RxSwift

class ViewController: UIViewController {
    var subview: ViewControllerSubView = ViewControllerSubView()
    var disposeBag: DisposeBag = DisposeBag()
}

extension ViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.addSubview(self.subview.addBtn)
        self.view.addSubview(self.subview.minusBtn)
        self.view.addSubview(self.subview.number)
        self.reactor = ViewControllerReactor()
    }
    override func viewDidLayoutSubviews() {
        self.subview.ViewControllerUpdateConstrains()
    }
}
//bind view with ReactorKit
extension ViewController: StoryboardView {
    func bind(reactor: ViewControllerReactor) {
        self.subview.addBtn.rx.tap
            .map{Reactor.Action.increaseNumber}
            .bind(to: reactor.action)
            .disposed(by: self.disposeBag)
        self.subview.minusBtn.rx.tap
            .map{Reactor.Action.decreaseNumber}
            .bind(to: reactor.action)
            .disposed(by: self.disposeBag)
        self.reactor?.state
            .map { String($0.resultState) } //convert resultState type Int to String
            .bind(to: self.subview.number.rx.text)
            .disposed(by: self.disposeBag)
    }
}

