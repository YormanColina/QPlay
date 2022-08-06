//
//  LoginPresenter.swift
//  QPlay
//
//  Created by Apple on 23/06/22.
//

import UIKit
import RxSwift
import RxCocoa
import GoogleSignIn

protocol LoginPresenterProtocol {
    var authObservable: Observable<Bool> { get }
    func showModule()
    func presentHome()
    func googleSignIn() -> Observable<Bool>
}

class LoginPresenter: LoginPresenterProtocol {
    // MARK: Properties
    private let disposeBag = DisposeBag()
    private let interactor: LoginInteractorProtocol
    private let router: LoginRouterProtocol
    private let subject: PublishSubject<Bool>
    var authObservable: Observable<Bool> {
        return subject
    }
    
    // MARK: Initializers
    init(interactor: LoginInteractorProtocol, router: LoginRouterProtocol) {
        self.interactor = interactor
        self.router = router
        self.subject = PublishSubject<Bool>()
    }
    
    // MARK: Methods
    func showModule() {
        router.presentLogin(presenter: self)
    }
    
    func presentHome() {
        router.showModuleHome()
    }
    
    func googleSignIn() -> Observable<Bool> {
        return router
            .showGoogleViewRx(config: interactor.config)
            .flatMap { (user) in self.interactor.authenticateUser(user: user)}
    }
    
}
