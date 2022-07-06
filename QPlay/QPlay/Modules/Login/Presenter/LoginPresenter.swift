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
    func googleSignIn()
    func presentHome()
    var authObservable: Observable<Bool> { get }
}

class LoginPresenter: LoginPresenterProtocol {
    private let disposeBag = DisposeBag()
    private let interactor: LoginInteractorProtocol
    private let router: LoginRouterProtocol
    private let subject: PublishSubject<Bool>
    var authObservable: Observable<Bool> {
        return subject
    }
    
    init(interactor: LoginInteractorProtocol, router: LoginRouterProtocol) {
        self.interactor = interactor
        self.router = router
        self.subject = PublishSubject<Bool>()
    }
    
    func showModule() {
        router.presentLogin(presenter: self)
    }
    
    func presentHome() {
        router.showModuleHome()
    }
    
    func googleSignIn() {
        router.showGoogleViewRx(config: interactor.config).subscribe(onNext: { (user) in
            self.authenticateUser(user: user) { authenticated in
                self.subject.on(.next(authenticated))
            }
        }, onError: { (error) in
            self.subject.on(.error(RxError.unknown))
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
