//
//  LoginInteractor.swift
//  QPlay
//
//  Created by Apple on 23/06/22.
//

import Foundation
import GoogleSignIn
import FirebaseAuth

protocol LoginInteractorProtocol {
    var config : GIDConfiguration { get }
    func authenticateUser(user: GIDGoogleUser, completion: @escaping (Bool) -> Void)
    
}

class LoginInteractor: LoginInteractorProtocol {
    
    let config : GIDConfiguration = GIDConfiguration.init(clientID: "698440841281-t8ec0f966ns54gaanhfklnfn02114tuk.apps.googleusercontent.com")
    
    func authenticateUser(user: GIDGoogleUser, completion: @escaping (Bool) -> Void) {
        
        guard  let idToken = user.authentication.idToken else {
            completion(false)
            return
        }
        
        let credential = GoogleAuthProvider.credential(withIDToken: idToken,
                                                       accessToken: user.authentication.accessToken)
        
        Auth.auth().signIn(with: credential) { success, error in
          completion(error == nil)
        }
    }
}


