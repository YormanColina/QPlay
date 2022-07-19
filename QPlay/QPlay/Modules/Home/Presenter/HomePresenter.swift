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
    func showModule()
    func callservices() -> Observable<[Game]>
    func presentDetail()
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
    
    func presentDetail() {
        router.showModuleDetail()
    }
    
    
}
