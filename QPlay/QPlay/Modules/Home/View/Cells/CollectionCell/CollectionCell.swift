//
//  CollectionCell.swift
//  QPlay
//
//  Created by Apple on 13/07/22.
//

import UIKit

class CollectionCell: UICollectionViewCell {
    // MARK: IBOutlets
    @IBOutlet private weak var collectionView: UICollectionView!
    
    // MARK: Properties
    private var games: [Game] = []
    
    
    // MARK: Methods
    private func configureCollection() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "GamesViewCell", bundle: nil), forCellWithReuseIdentifier: "GamesViewCell")
        collectionView.register(UINib(nibName: "SeenCell", bundle: nil), forCellWithReuseIdentifier: "SeenCell")
        collectionView.backgroundColor = UIColor(named: "darkBlue")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureCollection()
    }
    
    func configureCellInfo(games: [Game]) {
        self.games = games
        collectionView.reloadData()
    }

}

extension CollectionCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            let cell = registerCell(with: "GamesViewCell", type: GamesViewCell.self)
            return cell
        default:
            let cell = registerCell(with: "SeenCell", type: SeenCell.self)
            return cell
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return games.count
    }
    
    private func registerCell(with identifier: String, type: Any) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as? type else {
            return UICollectionViewCell()
        }
        return cell
    }
    
    
}

extension CollectionCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 250, height: 350)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
}

extension CollectionCell: UICollectionViewDelegate {
    
}
