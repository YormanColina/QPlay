//
//  DetailPresenter.swift
//  QPlay
//
//  Created by Apple on 23/06/22.
//

import Foundation
import UIKit

protocol DetailPresenterProtocol {
    func showModule(game: Game)
    func popDetail()
}

class DetailPresenter: DetailPresenterProtocol {
    private let interactor: DetailInteractorProtocol
    private let router: DetailRooterProtocol
    
    init(interactor: DetailInteractorProtocol, router: DetailRooterProtocol) {
        self.interactor = interactor
        self.router = router
    }
    
    func showModule(game: Game) {
        router.showDetail(game: game)
    }
    
    func popDetail() {
        router.popDetail()
    }
}
