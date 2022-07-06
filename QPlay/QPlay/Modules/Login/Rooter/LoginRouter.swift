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
import RxCocoa
import RxSwift

protocol LoginRouterProtocol {
    func presentLogin(presenter: LoginPresenterProtocol)
    func showGoogleView(config: GIDConfiguration, viewController: UIViewController, completion: @escaping (GIDGoogleUser?) -> Void)
    func showGoogleViewRx(config: GIDConfiguration) -> Observable<GIDGoogleUser>
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
    
    func showGoogleViewRx(config: GIDConfiguration) -> Observable<GIDGoogleUser> {
        return Observable.create { observer in
            guard let viewController = self.navigationController.viewControllers.first else {
                observer.onError(RxError.noElements)
                return Disposables.create()
            }
            
            GIDSignIn.sharedInstance.signIn(with: config, presenting: viewController) { user, _ in
                guard let user = user else {
                    observer.on(.error(RxError.noElements))
                    return
                }
                
                observer.on(.next(user))
                observer.on(.completed)
            }
                                
            return Disposables.create()
        }
    }
}
