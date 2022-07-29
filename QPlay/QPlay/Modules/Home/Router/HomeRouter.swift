//
//  HomeRooter.swift
//  QPlay
//
//  Created by Apple on 23/06/22.
//

import Foundation
import UIKit
import AVKit

protocol HomeRouterProtocol {
    func presentHome(presenter: HomePresenterProtocol)
    func showModuleDetail(game: Game)
    func play(url: String)
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
    
    func play(url: String) {
        guard let url = URL(string: url) else { return }
        let avPlayer = AVPlayer(url: url)
        
        let avPlayerController = AVPlayerViewController()
        avPlayerController.player = avPlayer
        
        base.present(avPlayerController, animated: true) {
            avPlayerController.player?.play()
        }
    }
}

