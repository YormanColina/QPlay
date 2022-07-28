//
//  SeenCell.swift
//  QPlay
//
//  Created by Apple on 14/07/22.
//

import UIKit
import Kingfisher

class SeenCell: UICollectionViewCell {
    //MARK: @IBOutlets
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var timeLabel: UILabel!
    @IBOutlet private weak var cellImageView: UIImageView!
    @IBOutlet private weak var imageViewButton: UIImageView!
    @IBOutlet private weak var containerButtonView: UIView!
    @IBOutlet private weak var studioLabelLoaderView: UIView!
    @IBOutlet private weak var titleLabelLoaderView: UIView!
    @IBOutlet private weak var cellImageLoaderView: UIView!
    
    
    // MARK: Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    private func setupUI() {
        self.backgroundColor = UIColor(named: "superDarkGray")
        layer.masksToBounds = true
        layer.cornerRadius = 20
        layer.borderWidth = 0.3
        layer.borderColor = UIColor(named: "superDarkGray")?.cgColor
        
        contentView.layer.cornerRadius = 20
        contentView.layer.masksToBounds = true
        
        cellImageView.layer.cornerRadius = 12
        
        titleLabel.textColor = .white
        timeLabel.textColor = .lightGray
        
        containerButtonView.layer.cornerRadius = containerButtonView.bounds.width / 2
        imageViewButton.contentMode = .scaleAspectFill
        imageViewButton.image = UIImage(named: "play")?.withRenderingMode(.alwaysTemplate)
        imageViewButton.tintColor = .white
        
        studioLabelLoaderView.backgroundColor = UIColor(named: "darkBlue")
        titleLabelLoaderView.backgroundColor = UIColor(named: "darkBlue")
        cellImageLoaderView.backgroundColor = UIColor(named: "darkBlue")
        studioLabelLoaderView.layer.cornerRadius = 10
        titleLabelLoaderView.layer.cornerRadius = 10
        cellImageLoaderView.layer.cornerRadius = 12
    }
    
    func configurateCell(game: Game, loaderState: Bool) {
        titleLabel.text = game.title
        timeLabel.text = game.studio
        cellImageView.kf.setImage(with: URL(string: game.galleryImages[0]))
        titleLabelLoaderView.isHidden = loaderState
        studioLabelLoaderView.isHidden = loaderState
        cellImageLoaderView.isHidden = loaderState
    }

}

