//
//  LoginPresenter.swift
//  QPlay
//
//  Created by Apple on 23/06/22.
//

import Foundation
import UIKit

protocol LoginPresenterProtocol {
    var interactor: LoginInteractorProtocol { get set }
    var router: LoginRouterProtocol { get set }
    func showModule()
    func googleSignIn(viewController: UIViewController, completion: @escaping (Bool) -> Void)
    func presentHome()
}

class LoginPresenter: LoginPresenterProtocol {
    var interactor: LoginInteractorProtocol
    var router: LoginRouterProtocol
    
    init(interactor: LoginInteractorProtocol, router: LoginRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
    
    func showModule() {
        router.presentLogin(presenter: self)
    }
    
    func googleSignIn(viewController: UIViewController, completion: @escaping (Bool) -> Void) {
        router.showGoogleView(config: interactor.config, viewController: viewController) { user in
            guard let user = user else {
                completion(false)
                return
            }
            self.interactor.authenticateUser(user: user) { authenticated in
               completion(authenticated)
            }
        }
    }
    
    func presentHome() {
        router.showModuleHome()
    }
    
}
