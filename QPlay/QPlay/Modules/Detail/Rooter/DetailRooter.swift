//
//  DetailRooter.swift
//  QPlay
//
//  Created by Apple on 23/06/22.
//

import Foundation
import UIKit

protocol DetailRooterProtocol {
    func showDetail(game: Game)
    func popDetail() 
}

class DetailRooter: DetailRooterProtocol {
    private var navigationController: UINavigationController
    
    init(base: UINavigationController) {
        navigationController = base
    }
    
    func showDetail(game: Game) {
        let detailModule = DetailModule(base: navigationController, game: game)
        navigationController.pushViewController(DetailViewController(presenter: detailModule.presenter, game: game), animated: true)
    }
    
    func popDetail() {
        navigationController.popViewController(animated: true)
    }
}
