//
//  LoginPresenter.swift
//  QPlay
//
//  Created by Apple on 23/06/22.
//

import Foundation

protocol LoginPresenterProtocol {
    var interactor: LoginInteractorProtocol { get set }
    var router: LoginRouterProtocol { get set }
    func showModule()
}

class LoginPresenter: LoginPresenterProtocol {
    var interactor: LoginInteractorProtocol
    var router: LoginRouterProtocol
    
    init(interactor: LoginInteractorProtocol, router: LoginRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
    
    func showModule() {
        router.presentLogin()
    }
}
