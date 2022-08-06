//
//  LoginViewController.swift
//  QPlay
//
//  Created by Apple on 21/06/22.
//

import UIKit
import RxCocoa
import RxSwift

class LoginViewController: UIViewController {
    // MARK: IBOutlets
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var facebookButtom: UIButton!
    @IBOutlet private weak var loginButtom: UIButton!
    @IBOutlet private weak var googleButtom: UIButton!
    @IBOutlet private weak var imageLogoGoogle: UIImageView!
    @IBOutlet private weak var imageFacebookLogo: UIImageView!
    
    // MARK: Properties
    private let presenter: LoginPresenterProtocol
    private let disposeBag = DisposeBag()
    
    // MARK: Initializers
    init(presenter: LoginPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: String(describing: LoginViewController.self), bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    // MARK: Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        subscribeToAuthUser()
        setupUI()
    }
    
    private func subscribeToAuthUser() {
        presenter.googleSignIn()
            .subscribe(onNext: { result in
            if result {
                self.presenter.presentHome()
            }
        }, onError: { error in
            print(error.localizedDescription)
        })
        .disposed(by: disposeBag)
    }
    
    private func setupUI() {
        loginButtom.layer.cornerRadius = loginButtom.bounds.height / 2
        
        facebookButtom.layer.borderWidth = 0.3
        facebookButtom.layer.borderColor = UIColor.white.cgColor.copy(alpha: 0.5)
        facebookButtom.layer.cornerRadius = facebookButtom.bounds.height / 2
        
        googleButtom.layer.borderWidth = 0.3
        googleButtom.layer.borderColor = UIColor.white.cgColor.copy(alpha: 0.5)
        googleButtom.layer.cornerRadius = googleButtom.bounds.height / 2
        
        imageView.image = UIImage(named: "videoImage")
        
        imageLogoGoogle.image = UIImage(named: "googleLogo")?.withRenderingMode(.alwaysTemplate)
        imageLogoGoogle.tintColor = .white
        
        imageFacebookLogo.image = UIImage(named: "facebookLogo")?.withRenderingMode(.alwaysTemplate)
        imageFacebookLogo.tintColor = .white
        
        navigationController?.isNavigationBarHidden = false
        self.navigationItem.title = "Qplay"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white,
                                                                        NSAttributedString.Key.font: UIFont(name: "Arial Rounded MT Bold", size: 22)!]
    }
    
    //MARK: IBActions
    @IBAction func login(_ sender: Any) {
        presenter.googleSignIn()
            .subscribe(onNext: { (success) in
                guard success else { return }
                self.presenter.presentHome()
            }).disposed(by: disposeBag)
    }
    
}


