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
    func presentDetail(game: Game)
    func saveGameSenn(title: String)
    func seenGames() -> [String]
    func playVideo(url: String)
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
    
    func presentDetail(game: Game) {
        router.showModuleDetail(game: game)
    }
    
    func saveGameSenn(title: String) {
        interactor.savedGameInUserDefaults(title: title)
    }
    
    func seenGames() -> [String] {
        return interactor.searchSeenGames()
    }
    
    func playVideo(url: String) {
        router.play(url: url)
    }
    
}
