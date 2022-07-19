//
//  DetailRooter.swift
//  QPlay
//
//  Created by Apple on 23/06/22.
//

import Foundation
import UIKit

protocol DetailRooterProtocol {
    func showDetail()
}

class DetailRooter: DetailRooterProtocol {
    var navigationController: UINavigationController
    
    init(base: UINavigationController) {
        navigationController = base
    }
    
    func showDetail() {
        let detailModule = DetailModule(base: navigationController)
        navigationController.pushViewController(DetailViewController(presenter: detailModule.presenter), animated: true)
    }
}
