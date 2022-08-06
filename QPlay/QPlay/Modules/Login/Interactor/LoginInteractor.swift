//
//  LoginInteractor.swift
//  QPlay
//
//  Created by Apple on 23/06/22.
//

import GoogleSignIn
import FirebaseAuth
import RxSwift
import RxCocoa
import Foundation

protocol LoginInteractorProtocol {
    var config : GIDConfiguration { get }
    func authenticateUser(user: GIDGoogleUser) -> Observable<Bool>
}

class LoginInteractor: LoginInteractorProtocol {
    let config : GIDConfiguration = GIDConfiguration.init(clientID: "698440841281-t8ec0f966ns54gaanhfklnfn02114tuk.apps.googleusercontent.com")
    let storage = UserDefaults.standard
    
    func authenticateUser(user: GIDGoogleUser) -> Observable<Bool> {
        return Observable.create { observer in
            guard  let idToken = user.authentication.idToken else {
                observer.on(.error(RxError.unknown))
                return Disposables.create()
            }
            
            let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: user.authentication.accessToken)
            
            Auth.auth().signIn(with: credential) { success, error in
//                guard let user = success?.user else { return }
//                self.saveUser(user: user)
                observer.on(.next(error == nil))
            }
            return Disposables.create()
        }
    }
    
    private func saveUser(user: User) {
        var users = storage.object(forKey: "users") as? [User] ?? [User]()
        
        if !users.contains(user) {
            users.append(user)
            storage.set(users, forKey: "users")
        }
    }
}
 
