//
//  GamesViewCell.swift
//  QPlay
//
//  Created by Apple on 13/07/22.
//

import UIKit
import Kingfisher

class GamesViewCell: UICollectionViewCell {
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var studio: UILabel!
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var cellImage: UIImageView!
    @IBOutlet private weak var containerPlayerButtonView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    private func setupUI() {
        layer.shadowColor = UIColor.lightGray.cgColor
        layer.shadowRadius = 5
        layer.shadowOpacity = 0.3
        layer.shadowOffset = CGSize(width: 3, height: 5)
        layer.masksToBounds = false
        layer.cornerRadius = 20
        layer.borderWidth = 0.3
        layer.borderColor = UIColor.darkGray.cgColor
        
        contentView.layer.cornerRadius = 20
        contentView.layer.masksToBounds = true
        
        containerView.layer.cornerRadius = 20
        
        containerPlayerButtonView.layer.cornerRadius = containerPlayerButtonView.bounds.width / 2
        containerPlayerButtonView.backgroundColor = UIColor(named: "customPurple")
        
        cellImage.contentMode = .scaleAspectFill
    }
    
    func configureCell(game: Game) {
        titleLabel?.text = game.title
        studio?.text = game.studio
        cellImage.kf.setImage(with: URL(string: game.galleryImages[1]))
    }

}
