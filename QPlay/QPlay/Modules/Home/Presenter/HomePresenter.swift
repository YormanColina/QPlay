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
    func getHome() -> Observable<[Game]>
    func presentDetail()
    func saveGameSenn(title: String)
}

class HomePresenter: HomePresenterProtocol {
    private let interactor: HomeInteractorProtocol
    private let router: HomeRouterProtocol
    
    init(interactor: HomeInteractorProtocol, router: HomeRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
    
    func showModule() {
        router.presentHome(presenter: self)
    }
    
    func getHome() -> Observable<[Game]> {
        let observable = interactor.makeRequest()
        return observable
    }
    
    func presentDetail() {
        router.showModuleDetail()
    }
    
    func saveGameSenn(title: String) {
        interactor.savedInUserDefaults(title: title)
    }
    
}
