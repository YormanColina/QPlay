//
//  DetailViewController.swift
//  QPlay
//
//  Created by Apple on 23/06/22.
//

import UIKit

class DetailViewController: UIViewController {
    
    private let presenter: DetailPresenterProtocol

    override func viewDidLoad() {
        super.viewDidLoad()
    }


    init(presenter: DetailPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: String(describing: DetailViewController.self), bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
}
