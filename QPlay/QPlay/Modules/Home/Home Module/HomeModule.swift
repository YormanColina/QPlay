//
//  HomeModule.swift
//  QPlay
//
//  Created by Apple on 21/06/22.
//

import Foundation
import UIKit

protocol HomeModuleProtocol {
    func startHome()
}

class HomeModule: HomeModuleProtocol {
    private let presenter: HomePresenterProtocol
    
    init(base: UINavigationController) {
        let router: HomeRouterProtocol = HomeRouter(base: base)
        let interactor: HomeInteractorProtocol = HomeInteractor()
        let presenter: HomePresenterProtocol = HomePresenter(interactor: interactor, router: router)
        self.presenter = presenter
    }
    
    func startHome() {
        presenter.showModule()
    }
}
