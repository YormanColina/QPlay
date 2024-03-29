//
//  LoginModule.swift
//  QPlay
//
//  Created by Apple on 21/06/22.
//

import Foundation
import UIKit

protocol LoginModuleProtocol {
    func start()
}

class LoginModule: LoginModuleProtocol {
    let presenter: LoginPresenterProtocol
    
    init(navigation: UINavigationController) {
        let interactor: LoginInteractorProtocol = LoginInteractor()
        let router: LoginRouterProtocol = LoginRooter(navigation)
        let presenter = LoginPresenter(interactor: interactor, router: router)
        self.presenter = presenter
    }
    
    func start() {
        presenter.showModule()
    }
}

