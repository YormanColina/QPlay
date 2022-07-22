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
    @IBOutlet private weak var containerTabBarView: UIView!
    @IBOutlet private weak var tabBarView: UITabBar!
    
    // MARK: Properties
    private let presenter: HomePresenterProtocol
    private let disposeBag = DisposeBag()
    private var games: [Game] = []
    
    
    // MARK: Initializers
    init(presenter: HomePresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: String(describing: HomeViewController.self), bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    
    // MARK: Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        takeInformation()
        configureCollection()
    }
    
    private func takeInformation() {
        presenter.getHome()
            .subscribe { [weak self] games in
                guard let self = self, let games = games.element else { return }
                self.games = games
                self.collectionView.reloadData()
            }.disposed(by: disposeBag)
    }
    
    private func configureCollection() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "CollectionCell", bundle: nil), forCellWithReuseIdentifier: "CollectionCell")
        collectionView.register(UINib(nibName: "HeaderHomeView", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader , withReuseIdentifier: "HeaderHomeView")
    }
    
    private func setupUI() {
        view.backgroundColor = UIColor(named: "darkBlue")
        collectionView.backgroundColor = UIColor(named: "darkBlue")
        tabBarView.barTintColor = UIColor(named: "superDarkGray")
        
        tabBarView.layer.cornerRadius = 20
        tabBarView.layer.masksToBounds = true
    }
    
}

// MARK: UICollectionViewDataSource
extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as? CollectionCell else {
            return UICollectionViewCell()
        }
        cell.delegate = self
        cell.configureCellInfo(games: games, section: indexPath.section)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HeaderHomeView", for: indexPath) as? HeaderHomeView else {
            return UICollectionReusableView()
        }
        
        switch indexPath.section {
        case 0 :
            header.configureHeader(text: "Explore new release movies", fontSize: 31, color: .white)
            return header
        default:
            header.configureHeader(text: "Continue Watching", fontSize: 17, color: .white)
            return header
        }
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
}

// MARK: UICollectionViewDelegate
extension HomeViewController: UICollectionViewDelegate {
    
}

// MARK: UICollectionViewDelegateFlowLayout
extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch indexPath.section {
        case 0:
            return CGSize(width: UIScreen.main.bounds.width, height: 320)
        default:
            return CGSize(width: UIScreen.main.bounds.width, height: 100)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        switch section {
        case 0:
            return CGSize(width: UIScreen.main.bounds.width, height: 150)
        default:
            return CGSize(width: UIScreen.main.bounds.width, height: 75)
        }
    }
}

// MARK: CollectionCellProtocol
extension HomeViewController: CollectionCellProtocol {
    func showDetail() {
        presenter.presentDetail()
    }
}
