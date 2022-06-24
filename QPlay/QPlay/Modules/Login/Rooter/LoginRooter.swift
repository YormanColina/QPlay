//
//  LoginRooter.swift
//  QPlay
//
//  Created by Apple on 23/06/22.
//

import Foundation
import UIKit

protocol LoginRouterProtocol {
    var navigationController: UINavigationController { get set }
    func presentLogin()
}

class LoginRooter: LoginRouterProtocol {
    var navigationController: UINavigationController
    
    init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func presentLogin() {
        navigationController.setViewControllers([LoginViewController()], animated: true)
    }
}
