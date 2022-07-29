//
//  UsersCell.swift
//  QPlay
//
//  Created by Apple on 26/07/22.
//

import UIKit

class UsersCell: UICollectionViewCell {

    @IBOutlet weak var imageUser: UIImageView!
    @IBOutlet weak var imageUser2: UIImageView!
    @IBOutlet weak var imageUser3: UIImageView!
    @IBOutlet weak var imageUser4: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCell()
    }
    
    func configureCell(game: Game) {
        
    }
    
    private func setupCell() {
        imageUser.layer.cornerRadius = imageUser.bounds.width / 2
        imageUser.layer.borderColor = UIColor.white.cgColor
        imageUser.layer.borderWidth = 0.5
        imageUser.image = UIImage(named: "gente1")
        
        imageUser2.layer.cornerRadius = imageUser.bounds.width / 2
        imageUser2.layer.borderColor = UIColor.white.cgColor
        imageUser2.layer.borderWidth = 0.5
        imageUser2.image = UIImage(named: "gente2")
        
        imageUser3.layer.cornerRadius = imageUser.bounds.width / 2
        imageUser3.layer.borderColor = UIColor.white.cgColor
        imageUser3.layer.borderWidth = 0.5
        imageUser3.image = UIImage(named: "gente3")
        
        imageUser4.layer.cornerRadius = imageUser.bounds.width / 2
        imageUser4.layer.borderColor = UIColor.white.cgColor
        imageUser4.layer.borderWidth = 0.5
        imageUser4.image = UIImage(named: "gente4")
    }
}
