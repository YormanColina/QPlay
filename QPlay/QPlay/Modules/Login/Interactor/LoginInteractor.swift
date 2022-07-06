//
//  LoginInteractor.swift
//  QPlay
//
//  Created by Apple on 23/06/22.
//

import Foundation
import GoogleSignIn
import FirebaseAuth
import RxSwift
import RxCocoa

protocol LoginInteractorProtocol {
    var config : GIDConfiguration { get }
    func authenticateUser(user: GIDGoogleUser) -> Observable<Bool>
}

class LoginInteractor: LoginInteractorProtocol {
    let config : GIDConfiguration = GIDConfiguration.init(clientID: "698440841281-t8ec0f966ns54gaanhfklnfn02114tuk.apps.googleusercontent.com")
    
    func authenticateUser(user: GIDGoogleUser) -> Observable<Bool> {
        return Observable.create { observer in
            guard  let idToken = user.authentication.idToken else {
                observer.on(.error(RxError.unknown))
                return Disposables.create()
            }
            
            let credential = GoogleAuthProvider.credential(withIDToken: idToken,
                                                           accessToken: user.authentication.accessToken)
            
            Auth.auth().signIn(with: credential) { success, error in
              observer.on(.next(error == nil))
            }
            
            return Disposables.create()
        }
    }
}


