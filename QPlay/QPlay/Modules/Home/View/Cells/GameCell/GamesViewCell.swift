//
//  GamesViewCell.swift
//  QPlay
//
//  Created by Apple on 13/07/22.
//

import UIKit
import Kingfisher

protocol GamesViewCellDelegate: AnyObject {
    func playVideo(url: String)
}

class GamesViewCell: UICollectionViewCell {
    // MARK: @IBOutlets
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var studio: UILabel!
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var cellImage: UIImageView!
    @IBOutlet private weak var containerPlayerButtonView: UIView!
    @IBOutlet private weak var blurEfect: UIVisualEffectView!
    @IBOutlet private weak var playImageView: UIImageView!
    @IBOutlet private weak var playVideoButton: UIButton!
    @IBOutlet private weak var userImage1: UIImageView!
    @IBOutlet private weak var userImage2: UIImageView!
    @IBOutlet private weak var userImage3: UIImageView!
    @IBOutlet private weak var userImage4: UIImageView!
    
    weak var delegate: GamesViewCellDelegate?
    private var url: String?
    
    // MARK: Methods
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
        
        userImage1.layer.cornerRadius = userImage1.bounds.width / 2
        userImage1.layer.borderColor = UIColor.white.cgColor
        userImage1.layer.borderWidth = 0.5
        userImage1.image = UIImage(named: "gente1")
        
        userImage2.layer.cornerRadius = userImage2.bounds.width / 2
        userImage2.layer.borderColor = UIColor.white.cgColor
        userImage2.layer.borderWidth = 0.5
        userImage2.image = UIImage(named: "gente2")
        
        userImage3.layer.cornerRadius = userImage3.bounds.width / 2
        userImage3.layer.borderColor = UIColor.white.cgColor
        userImage3.layer.borderWidth = 0.5
        userImage3.image = UIImage(named: "gente3")
        
        userImage4.layer.cornerRadius = userImage4.bounds.width / 2
        userImage4.layer.borderColor = UIColor.white.cgColor
        userImage4.layer.borderWidth = 0.5
        userImage4.image = UIImage(named: "gente4")
    }
    
    func configureCell(game: Game) {
        titleLabel?.text = game.title
        studio?.text = game.studio
        cellImage.kf.setImage(with: URL(string: game.galleryImages[1]))
        self.url = game.videosUrls.mobile
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

    @IBAction func playVideo(_ sender: Any) {
        guard let url = url else { return }
        delegate?.playVideo(url: url)
    }
}
