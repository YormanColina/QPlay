//
//  DetailViewController.swift
//  QPlay
//
//  Created by Apple on 23/06/22.
//

import UIKit
import Kingfisher
import AVKit

class DetailViewController: UIViewController {
    
    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var containerViewOfCollection: UIView!
    @IBOutlet private weak var detailImageView: UIImageView!
    @IBOutlet private weak var backButton: UIButton!
    @IBOutlet private weak var backImageView: UIImageView!
    @IBOutlet private weak var playNowButton: UIButton!
    
    private let presenter: DetailPresenterProtocol
    private let game: Game
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollection()
        setupUI()
    }

    init(presenter: DetailPresenterProtocol, game: Game) {
        self.presenter = presenter
        self.game = game
        super.init(nibName: String(describing: DetailViewController.self), bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    private func configureCollection() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "HeaderCell", bundle: nil), forCellWithReuseIdentifier: "HeaderCell")
        collectionView.register(UINib(nibName: "UsersCell", bundle: nil), forCellWithReuseIdentifier: "UsersCell")
        collectionView.register(UINib(nibName: "DescriptionCell", bundle: nil), forCellWithReuseIdentifier: "DescriptionCell")
        collectionView.register(UINib(nibName: "HeaderHomeView", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HeaderHomeView")
        collectionView.backgroundColor = UIColor(named: "darkBlue")
        collectionView.layer.cornerRadius = 30
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 30)
    }
    private func setupUI() {
        containerViewOfCollection.layer.borderColor = UIColor.black.cgColor
        containerViewOfCollection.layer.borderWidth = 0.2
        containerViewOfCollection.layer.cornerRadius = 30
        containerViewOfCollection.backgroundColor = UIColor(named: "darkBlue")
        
        backButton.layer.cornerRadius = backButton.bounds.width / 2
        backButton.layer.borderWidth = 0.5
        backButton.layer.borderColor = UIColor.white.cgColor
        backButton.backgroundColor = UIColor(named: "superDarkGray")
        backImageView.image = UIImage(named: "back")?.withRenderingMode(.alwaysTemplate)
        backImageView.tintColor = .white
        
        navigationController?.navigationBar.isHidden = true
        
        detailImageView.kf.setImage(with: URL(string: game.galleryImages[0]))
        detailImageView.contentMode = .scaleAspectFill
        
        playNowButton.layer.cornerRadius = 35
    }
    @IBAction func playVideo(_ sender: Any) {
        print(game.videosUrls.tablet)
        presenter.playVideo(with: game.videosUrls.mobile)
    }
    @IBAction func popDetail() {
        presenter.popDetail()
    }
}

extension DetailViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            guard let headerCell = registerCell(identifier: "HeaderCell", indexPath: indexPath) as? HeaderCell else {
                return UICollectionViewCell()
            }
            headerCell.configureCell(game: game)
            return headerCell
        case 1:
            guard let usersCell = registerCell(identifier: "UsersCell", indexPath: indexPath) as? UsersCell else {
                return UICollectionViewCell()
            }
            return usersCell
        default:
            guard let descriptionCell = registerCell(identifier: "DescriptionCell", indexPath: indexPath) as? DescriptionCell else {
                return UICollectionViewCell()
            }
            return descriptionCell
        }
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HeaderHomeView", for: indexPath) as? HeaderHomeView else {
            return UICollectionReusableView()
        }

        switch indexPath.section {
        case 0:
            return header
        case 1:
            header.configureHeader(text: "Cast", fontSize: 14, color: .lightGray)
            return header
        default:
            header.configureHeader(text: "Storyline", fontSize: 14, color: .lightGray)
            return header
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    private func registerCell(identifier: String, indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath)
        return cell
    }
}

extension DetailViewController: UICollectionViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print(scrollView.contentOffset.y)
    }
}

extension DetailViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch indexPath.section {
        case 0:
            return CGSize(width: UIScreen.main.bounds.width - 60, height: 160)
        case 1:
            return CGSize(width: UIScreen.main.bounds.width - 60, height: 50)
        default:
            return CGSize(width: UIScreen.main.bounds.width - 60, height: 870)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        switch section {
        case 0:
            return CGSize(width: 0, height: 0)
        default:
            return CGSize(width: UIScreen.main.bounds.width, height: 50)
        }
    }
}
