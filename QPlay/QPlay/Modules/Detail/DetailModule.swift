//
//  DetailModule.swift
//  QPlay
//
//  Created by Apple on 21/06/22.
//

import UIKit


protocol DetailModuleProtocol {
    func startDetail()
    var presenter: DetailPresenterProtocol { get }
}

class DetailModule {
    let presenter: DetailPresenterProtocol
    
    init(base: UINavigationController) {
        let router: DetailRooterProtocol = DetailRooter(base: base)
        let interactor: DetailInteractorProtocol = DetailInteractor()
        let presenter = DetailPresenter(interactor: interactor, router: router)
        self.presenter = presenter
    }
    
    func startDetail() {
        presenter.showModule()
    }
    
}
