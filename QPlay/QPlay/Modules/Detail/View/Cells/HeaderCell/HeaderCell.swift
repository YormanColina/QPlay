//
//  HeaderCell.swift
//  QPlay
//
//  Created by Apple on 26/07/22.
//

import UIKit

class HeaderCell: UICollectionViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var studioLabel: UILabel!
    @IBOutlet weak var saveGameButton: UIButton!
    @IBOutlet weak var saveImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    func configureCell(game: Game) {
        titleLabel.text = game.title
        studioLabel.text = game.studio
    }
    
    private func setupUI() {
        saveGameButton.layer.cornerRadius = saveGameButton.bounds.width / 2
        saveGameButton.layer.borderWidth = 0.2
        saveGameButton.layer.borderColor = UIColor.lightGray.cgColor
        
        saveImage.image = UIImage(named: "save")?.withRenderingMode(.alwaysTemplate)
        saveImage.tintColor = .white
    }

}
