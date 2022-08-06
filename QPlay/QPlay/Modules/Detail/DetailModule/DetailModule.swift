//
//  DetailModule.swift
//  QPlay
//
//  Created by Apple on 21/06/22.
//

import UIKit

protocol DetailModuleProtocol {
    func startDetail(game: Game)
    var presenter: DetailPresenterProtocol { get }
}

class DetailModule {
    let presenter: DetailPresenterProtocol
    private var game: Game?
    
    init(base: UINavigationController, game: Game) {
        let router: DetailRooterProtocol = DetailRooter(base: base)
        let interactor: DetailInteractorProtocol = DetailInteractor()
        let presenter = DetailPresenter(interactor: interactor, router: router)
        self.presenter = presenter
        self.game = game
    }
    
    func startDetail() {
        guard let game = game else { return }
        presenter.showModule(game: game)
    }
    
}
