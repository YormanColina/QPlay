//
//  LoginPresenter.swift
//  QPlay
//
//  Created by Apple on 23/06/22.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa
import GoogleSignIn

protocol LoginPresenterProtocol {
    func showModule()
    func googleSignIn(completion: @escaping (Bool) -> Void)
    func presentHome()
}

class LoginPresenter: LoginPresenterProtocol {
    private let disposeBag = DisposeBag()
    private let interactor: LoginInteractorProtocol
    private let router: LoginRouterProtocol
    
    init(interactor: LoginInteractorProtocol, router: LoginRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
    
    func showModule() {
        router.presentLogin(presenter: self)
    }
    
    func presentHome() {
        router.showModuleHome()
    }
    
    func googleSignIn(completion: @escaping (Bool) -> Void) {
        router.showGoogleViewRx(config: interactor.config).subscribe(onNext: { (user) in
            self.authenticateUser(user: user) { authenticate in
                completion(authenticate)
            }
        }, onError: { (error) in
            print(error.localizedDescription)
        }).disposed(by: disposeBag)
    }
    
    
    func authenticateUser(user: GIDGoogleUser, completion: @escaping (Bool) -> Void)  {
        interactor.authenticateUser(user: user)
            .subscribe { event in
                completion(event)
            } onError: { error in
                print(error.localizedDescription)
            }.disposed(by: disposeBag)
    }
    
    func ObservableView() -> Observable<Bool> {
        return Observable.create { observer in
           
            return Disposables.create()
        }
    }
}
