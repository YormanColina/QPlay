//
//  CollectionCell.swift
//  QPlay
//
//  Created by Apple on 13/07/22.
//

import UIKit

protocol CollectionCellProtocol: AnyObject {
    func showDetail()
    func saveInLocalStorage(title: String)
}

class CollectionCell: UICollectionViewCell {
    // MARK: IBOutlets
    @IBOutlet private weak var collectionView: UICollectionView!
    
    // MARK: Properties
    private var games: [Game] = []
    private var section: Int = 0
    private var seenGames: [Game] = []
    weak var delegate: CollectionCellProtocol?
  
    // MARK: Methods
    private func configureCollection() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "GamesViewCell", bundle: nil), forCellWithReuseIdentifier: "GamesViewCell")
        collectionView.register(UINib(nibName: "SeenCell", bundle: nil), forCellWithReuseIdentifier: "SeenCell")
        collectionView.backgroundColor = UIColor(named: "darkBlue")
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 30)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureCollection()
    }
    
    func configureCellInfo(games: [Game], section: Int) {
        self.games = games
        self.section = section
        collectionView.reloadData()
    }
    
}
// MARK: UICollectionViewDataSource
extension CollectionCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch self.section {
        case 0:
            guard let cell = registerCell(with: "GamesViewCell", indexPath: indexPath) as? GamesViewCell else {
                return UICollectionViewCell()
            }
            cell.configureCell(game: games[indexPath.row])
            return cell
        default:
            guard let cell = registerCell(with: "SeenCell", indexPath: indexPath) as? SeenCell else {
                return UICollectionViewCell()
            }
            if seenGames.count > 0 {
                cell.configurateCell(game: seenGames[indexPath.row])
            }
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch self.section {
        case 0:
            return games.count
        default:
            return seenGames.count
        }
    }
    
    private func registerCell(with identifier: String, indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath)
        return cell
    }
}

// MARK: UICollectionViewDelegateFlowLayout
extension CollectionCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch self.section {
        case 0:
           return CGSize(width: 250, height: 320)
        default:
            return CGSize(width: 260, height: 100)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 25
    }
}

// MARK: UICollectionViewDelegate
extension CollectionCell: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.saveInLocalStorage(title: games[indexPath.row].title)
        delegate?.showDetail()
    }
}


