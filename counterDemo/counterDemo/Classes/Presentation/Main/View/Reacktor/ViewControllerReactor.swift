//
//  ViewControllerReactor.swift
//  counterDemo
//
//  Created by Jilay-PC on 9/6/18.
//  Copyright © 2018 pich. All rights reserved.
//

import Foundation
import UIKit
import SnapKit
import RxSwift
import ReactorKit
import RxCocoa

final class ViewControllerReactor: Reactor {
    enum Action {
        case increaseNumber
        case decreaseNumber
    }
    enum Mutation {
        case increaseValue
        case decreaseValue
    }
    struct State {
        var resultState: Int
        
    }
    let initialState: ViewControllerReactor.State
    init() {
        self.initialState = State(resultState: 0)
    }
    func mutate(action: ViewControllerReactor.Action) -> Observable<ViewControllerReactor.Mutation> {
        switch action {
        case .increaseNumber:
            return Observable.just(Mutation.increaseValue)
        case .decreaseNumber:
            return Observable.just(Mutation.decreaseValue)
            
        }
    }
    func reduce(state: ViewControllerReactor.State, mutation: ViewControllerReactor.Mutation) -> ViewControllerReactor.State {
        var newState = state
        switch mutation {
        case .increaseValue:
            newState.resultState += 1
        case .decreaseValue:
            newState.resultState -= 1
        }
        return newState
    }
}
