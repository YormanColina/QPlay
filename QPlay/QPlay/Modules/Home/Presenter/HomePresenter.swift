//
//  HomePresneter.swift
//  QPlay
//
//  Created by Apple on 23/06/22.
//

import Foundation
import RxSwift
import RxCocoa

protocol HomePresenterProtocol {
    var interactor: HomeInteractorProtocol { get set }
    var router: HomeRooterProtocol { get set}
    func showModule()
    func callservices() -> Observable<[Game]>
}

class HomePresenter: HomePresenterProtocol {
    var interactor: HomeInteractorProtocol
    var router: HomeRooterProtocol
    
    init(interactor: HomeInteractorProtocol, router: HomeRooterProtocol) {
        self.interactor = interactor
        self.router = router
    }
    
    func showModule() {
        router.presentHome(presenter: self)
    }
    
    func callservices() -> Observable<[Game]> {
        let observable = interactor.makeRequest()
        return observable
    }
}
