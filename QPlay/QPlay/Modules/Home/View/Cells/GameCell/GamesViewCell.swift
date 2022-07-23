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
    @IBOutlet weak var blurEfect: UIVisualEffectView!
    @IBOutlet weak var playImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layoutIfNeeded()
        setupUI()
    }
    
    private func setupUI() {
        layer.shadowRadius = 5
        layer.shadowOpacity = 0.3
        layer.shadowOffset = CGSize(width: 3, height: 5)
        layer.cornerRadius = 30
        layer.borderWidth = 0.3
        layer.borderColor = UIColor.darkGray.cgColor
        contentView.layer.cornerRadius = 30
        contentView.layer.masksToBounds = true
        
        containerView.layer.cornerRadius = 30
        containerPlayerButtonView.layer.cornerRadius = containerPlayerButtonView.bounds.width / 2
        containerPlayerButtonView.backgroundColor = UIColor(named: "customPurple")
        
        blurEfect.layer.cornerRadius = 30
        blurEfect.layer.masksToBounds = true
        titleLabel.textColor = .white
        
        playImageView.tintColor = .white
        playImageView.image = UIImage(named: "play")?.withRenderingMode(.alwaysTemplate)
        containerView.layer.mask = createMask()
    }
    
    func configureCell(game: Game) {
        titleLabel?.text = game.title
        studio?.text = game.studio
        cellImage.kf.setImage(with: URL(string: game.galleryImages[1]))
    }
    
    private func createMask() -> CAShapeLayer {
        containerView.layoutIfNeeded()
        let path = UIBezierPath()
        let p1 = CGPoint(x: 0, y: 140)
        let p2 = CGPoint(x: 0, y: 40)
        let p3 = CGPoint(x: 40, y: 10)
        let p4 = CGPoint(x: 210, y: 25)
        let p5 = CGPoint(x: 240, y: 51)
        let p6 = CGPoint(x: containerView.bounds.width, y: 150)
        let controlP1 = CGPoint(x: 3, y: 5)
        let controlP2 = CGPoint(x: 236, y: 27)
        
        path.move(to: p1)
        path.addLine(to: p2)
        path.addQuadCurve(to: p3, controlPoint: controlP1)
        path.addLine(to: p4)
        path.addQuadCurve(to: p5, controlPoint: controlP2)
        path.addLine(to: p6)
        path.addLine(to: p1)
        path.close()
        
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        return mask
    }

}
