//
//  UsersCell.swift
//  QPlay
//
//  Created by Apple on 26/07/22.
//

import UIKit

class UsersCell: UICollectionViewCell {

    @IBOutlet weak var imageUser: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCell()
    }
    
    func configureCell(game: Game) {
        
    }
    
    private func setupCell() {
        imageUser.layer.cornerRadius = imageUser.bounds.width / 2
        imageUser.layer.borderColor = UIColor.white.cgColor
        imageUser.layer.borderWidth = 0.2
    }
}
