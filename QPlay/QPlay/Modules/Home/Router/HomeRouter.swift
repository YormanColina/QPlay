//
//  HomeRooter.swift
//  QPlay
//
//  Created by Apple on 23/06/22.
//

import Foundation
import UIKit

protocol HomeRouterProtocol {
    func presentHome(presenter: HomePresenterProtocol)
    func showModuleDetail()
}

class HomeRouter: HomeRouterProtocol {
    private var base: UINavigationController
    
    init(base: UINavigationController) {
        self.base = base
    }
    
    func presentHome(presenter: HomePresenterProtocol) {
        base.setViewControllers([HomeViewController(presenter: presenter)], animated: true)
    }
    
    func showModuleDetail() {
        let detailModule = DetailModule(base: base)
        detailModule.startDetail()
    }
}

