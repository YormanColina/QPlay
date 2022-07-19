//
//  HeaderHomeView.swift
//  QPlay
//
//  Created by Apple on 19/07/22.
//

import UIKit
import SwiftUI

class HeaderHomeView: UICollectionReusableView {
    @IBOutlet private weak var titleHeader: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureHeader(text: String, fontSize: CGFloat, color: UIColor) {
        titleHeader.text = text
        titleHeader.numberOfLines = 0
        titleHeader.font = titleHeader.font.withSize(fontSize)
        titleHeader.textColor = color
    }
    
}
