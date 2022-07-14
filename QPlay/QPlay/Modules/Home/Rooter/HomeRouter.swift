//
//  HomeRooter.swift
//  QPlay
//
//  Created by Apple on 23/06/22.
//

import Foundation
import UIKit

protocol HomeRooterProtocol {
    func presentHome(presenter: HomePresenterProtocol)
}

class HomeRooter: HomeRooterProtocol {
    var base: UINavigationController
    
    init(base: UINavigationController) {
        self.base = base
    }
    
    func presentHome(presenter: HomePresenterProtocol) {
        base.pushViewController(HomeViewController(presenter: presenter), animated: true)
    }
}

