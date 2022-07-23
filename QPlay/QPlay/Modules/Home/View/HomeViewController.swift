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
    
    private func setupTransparentNagigatioNBar() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        navigationItem.compactAppearance = appearance
        navigationItem.scrollEdgeAppearance = appearance
        navigationItem.standardAppearance = appearance
    }
    
    private func customizingNavigationBar(image: UIImage, imageWidth: CGFloat, imageHeight: CGFloat) -> UIBarButtonItem {
        let buttonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 44, height: 44))
        let leftImageView = UIImageView(frame: .zero)
        
        leftImageView.translatesAutoresizingMaskIntoConstraints = false
        leftImageView.widthAnchor.constraint(equalToConstant: imageWidth - 5).isActive = true
        leftImageView.heightAnchor.constraint(equalToConstant: imageHeight - 5).isActive = true
        leftImageView.contentMode = .scaleAspectFit
        
        leftView.widthAnchor.constraint(equalToConstant: 44).isActive = true
        leftView.heightAnchor.constraint(equalToConstant: 44).isActive = true
        leftView.layer.borderColor = UIColor.lightGray.cgColor
        leftView.layer.borderWidth = 0.3
        
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        leftView.backgroundColor = .clear
        leftView.addSubview(leftImageView)
        leftView.addSubview(button)
        leftView.layer.cornerRadius = 21
        leftImageView.tintColor = .white
        leftImageView.image = image
        leftImageView.leadingAnchor.constraint(equalTo: leftView.leadingAnchor, constant: 14).isActive = true
        leftImageView.topAnchor.constraint(equalTo: leftView.topAnchor, constant: 14).isActive = true
        button.topAnchor.constraint(equalTo: leftView.topAnchor).isActive = true
        button.leadingAnchor.constraint(equalTo: leftView.leadingAnchor).isActive = true
        button.trailingAnchor.constraint(equalTo: leftView.trailingAnchor).isActive = true
        button.bottomAnchor.constraint(equalTo: leftView.bottomAnchor).isActive = true
        buttonItem.customView = leftView

        return buttonItem
    }
    
    private func setupUI() {
        view.backgroundColor = UIColor(named: "darkBlue")
        collectionView.backgroundColor = UIColor(named: "darkBlue")
        tabBarView.barTintColor = UIColor(named: "superDarkGray")
        
        tabBarView.layer.cornerRadius = 30
        tabBarView.layer.masksToBounds = true
        setupTransparentNagigatioNBar()
        let image = UIImage(named: "bars")?.withRenderingMode(.alwaysTemplate)
        let image2 = UIImage(named: "search")?.withRenderingMode(.alwaysTemplate)
        
        navigationItem.leftBarButtonItem = customizingNavigationBar(image: image!, imageWidth: 20, imageHeight: 20)
        navigationItem.rightBarButtonItem = customizingNavigationBar(image: image2!, imageWidth: 20, imageHeight: 20)
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
            header.configureHeader(text: "Explore new release movies", fontSize: 30, color: .white)
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
            return CGSize(width: UIScreen.main.bounds.width, height: 340)
        default:
            return CGSize(width: UIScreen.main.bounds.width, height: 100)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        switch section {
        case 0:
            return CGSize(width: UIScreen.main.bounds.width, height: 150)
        default:
            return CGSize(width: UIScreen.main.bounds.width, height: 50)
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 200
    }
}

// MARK: CollectionCellProtocol
extension HomeViewController: CollectionCellProtocol {
    func showDetail() {
        presenter.presentDetail()
    }
}
