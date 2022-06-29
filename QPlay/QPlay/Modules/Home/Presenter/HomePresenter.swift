//
//  HomePresneter.swift
//  QPlay
//
//  Created by Apple on 23/06/22.
//

import Foundation

protocol HomePresenterProtocol {
    var interactor: HomeInteractorProtocol { get set }
    var router: HomeRooterProtocol { get set}
    func showModule()
}

class HomePresenter: HomePresenterProtocol {
    var interactor: HomeInteractorProtocol
    var router: HomeRooterProtocol
    
    init(interactor: HomeInteractorProtocol, router: HomeRooterProtocol) {
        self.interactor = interactor
        self.router = router
    }
    
    func showModule() {
        router.presentHome()
    }
}
