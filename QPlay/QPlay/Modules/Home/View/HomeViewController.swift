//
//  HomeViewController.swift
//  QPlay
//
//  Created by Apple on 23/06/22.
//

import UIKit
import RxSwift

class HomeViewController: UIViewController {
    // MARK: IBOutlets
    @IBOutlet private weak var collectionView: UICollectionView!
    
    // MARK: Properties
    private let presenter: HomePresenterProtocol
    private let disposeBag = DisposeBag()
    private var games: [Game] = []
    
    init(presenter: HomePresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: String(describing: HomeViewController.self), bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        takeInformation()
        configureCollection()
    }
    
    private func takeInformation() {
        presenter.callservices()
            .subscribe { [weak self] games in
                guard let games = games.element else { return }
                self?.games = games
                self?.collectionView.reloadData()
            }.disposed(by: disposeBag)
    }
    
    private func configureCollection() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "CollectionCell", bundle: nil), forCellWithReuseIdentifier: "CollectionCell")
    }
    
    private func setupUI() {
        view.backgroundColor = UIColor(named: "darkBlue")
        collectionView.backgroundColor = UIColor(named: "darkBlue")
    }

}

// MARK: UICollectionViewDataSource
extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as? CollectionCell else {
            return UICollectionViewCell()
        }
        cell.configureCellInfo(games: games)
        return cell
    }
    
}

// MARK: UICollectionViewDelegate
extension HomeViewController: UICollectionViewDelegate {
    
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: 400)
    }
}
