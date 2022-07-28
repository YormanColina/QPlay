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
    func showModuleDetail(game: Game)
}

class HomeRouter: HomeRouterProtocol {
    private var base: UINavigationController
    
    init(base: UINavigationController) {
        self.base = base
    }
    
    func presentHome(presenter: HomePresenterProtocol) {
        base.setViewControllers([HomeViewController(presenter: presenter)], animated: true)
    }
    
    func showModuleDetail(game: Game) {
        let detailModule = DetailModule(base: base, game: game)
        detailModule.startDetail()
    }
}

