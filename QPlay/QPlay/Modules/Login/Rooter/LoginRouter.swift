//
//  LoginRooter.swift
//  QPlay
//
//  Created by Apple on 23/06/22.
//

import Foundation
import UIKit
import FirebaseAuth
import GoogleSignIn

protocol LoginRouterProtocol {
    var navigationController: UINavigationController { get set }
    func presentLogin(presenter: LoginPresenterProtocol)
    func showGoogleView(config: GIDConfiguration, viewController: UIViewController, completion: @escaping (GIDGoogleUser?) -> Void)
    func showModuleHome()
}

class LoginRooter: LoginRouterProtocol {
    var navigationController: UINavigationController
    
    init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func presentLogin(presenter: LoginPresenterProtocol) {
        navigationController.setViewControllers([LoginViewController(presenter: presenter)], animated: true)
    }
    
    func showGoogleView(config: GIDConfiguration, viewController: UIViewController, completion: @escaping (GIDGoogleUser?) -> Void) {
        GIDSignIn.sharedInstance.signIn(with: config, presenting: viewController) { user, _ in
            guard let user = user else {
                completion(nil)
                return
            }
            completion(user)
        }
    }
    
    func showModuleHome() {
        let homeModule: HomeModuleProtocol = HomeModule(base: navigationController)
        homeModule.startHome()
    }
    
}
