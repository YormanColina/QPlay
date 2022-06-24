//
//  LoginViewController.swift
//  QPlay
//
//  Created by Apple on 21/06/22.
//

import UIKit

class LoginViewController: UIViewController {
    // MARK: IBOutlets
    
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var facebookButtom: UIButton!
    @IBOutlet private weak var loginButtom: UIButton!
    @IBOutlet private weak var googleButtom: UIButton!
    
    
    init() {
        super.init(nibName: String(describing: LoginViewController.self), bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        self.navigationController?.navigationBar.prefersLargeTitles = false
        self.navigationController?.navigationItem.title = "Qplay"
        loginButtom.layer.cornerRadius = loginButtom.bounds.height / 2
        
        facebookButtom.layer.borderWidth = 0.5
        facebookButtom.layer.borderColor = UIColor.white.cgColor
        facebookButtom.layer.cornerRadius = facebookButtom.bounds.height / 2
        
        googleButtom.layer.borderWidth = 0.5
        googleButtom.layer.borderColor = UIColor.white.cgColor
        googleButtom.layer.cornerRadius = facebookButtom.bounds.height / 2
        
        imageView.image = UIImage(named: "videoImage")
    }
}
