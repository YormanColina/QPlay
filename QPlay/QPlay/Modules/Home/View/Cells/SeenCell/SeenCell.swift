//
//  SeenCell.swift
//  QPlay
//
//  Created by Apple on 14/07/22.
//

import UIKit
import Kingfisher

class SeenCell: UICollectionViewCell {
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var timeLabel: UILabel!
    @IBOutlet private weak var cellImageView: UIImageView!
    @IBOutlet private weak var imageViewButton: UIImageView!
    @IBOutlet private weak var containerButtonView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    private func setupUI() {
        containerButtonView.layer.cornerRadius = containerButtonView.bounds.width / 2
        titleLabel.textColor = .white
        timeLabel.textColor = .lightGray
        
        layer.shadowOpacity = 0.9
        layer.shadowOffset = CGSize(width: 3, height: 5)
        layer.masksToBounds = false
        layer.cornerRadius = 20
        layer.borderWidth = 0.3
        layer.borderColor = UIColor.darkGray.cgColor
        
        contentView.layer.cornerRadius = 20
        contentView.layer.masksToBounds = true
        imageViewButton.contentMode = .scaleAspectFill
        
    }
    
    func configurateCell(game: Game) {
        titleLabel.text = game.title
        timeLabel.text = game.studio
        cellImageView.kf.setImage(with: URL(string: game.galleryImages[1]))
    }

}
