//
//  DetailRooter.swift
//  QPlay
//
//  Created by Apple on 23/06/22.
//

import Foundation
import UIKit
import AVKit

protocol DetailRooterProtocol {
    func showDetail(game: Game)
    func popDetail()
    func presentVideo(with url: String)
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
    
    func presentVideo(with url: String) {
        guard let url = URL(string: url) else { return }
        let avPlayer = AVPlayer(url: url)
        
        let avPlayerController = AVPlayerViewController()
        avPlayerController.player = avPlayer
        
        navigationController.present(avPlayerController, animated: true) {
            avPlayerController.player?.play()
        }
    }
}
