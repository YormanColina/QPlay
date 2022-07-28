//
//  DetailViewController.swift
//  QPlay
//
//  Created by Apple on 23/06/22.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet private weak var collectionView: UICollectionView!
    
    private let presenter: DetailPresenterProtocol

    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollection()
    }

    init(presenter: DetailPresenterProtocol) {
        self.presenter = presenter
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
    }
}

extension DetailViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            let headerCell = registerCell(identifier: "HeaderCell", indexPath: indexPath)
            return headerCell
        case 1:
            let usersCell = registerCell(identifier: "UsersCell", indexPath: indexPath)
            return usersCell
        default:
            let descriptionCell = registerCell(identifier: "DescriptionCell", indexPath: indexPath)
            return descriptionCell
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        <#code#>
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        <#code#>
    }
    
    private func registerCell(identifier: String, indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath)
        return cell
    }
}

extension DetailViewController: UICollectionViewDelegate {
    
}

extension DetailViewController: UICollectionViewDelegateFlowLayout {
    
}
