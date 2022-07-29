//
//  DescriptionCell.swift
//  QPlay
//
//  Created by Apple on 26/07/22.
//

import UIKit

class DescriptionCell: UICollectionViewCell {
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureCell()
    }

    private func configureCell() {
        descriptionLabel.text = "The Lord of the Rings is an epic high-fantasy novel by English author and scholar J. R. R. Tolkien. Set in Middle-earth, intended to be Earth at some time in the distant past, the story began as a sequel to Tolkien's 1937 children's book The Hobbit, but eventually developed into a much larger work. Written in stages between 1937 and 1949, The Lord of the Rings is one of the best-selling books ever written, with over 150 million copies sold.[2]. The title refers to the story's main antagonist, the Dark Lord Sauron, who in an earlier age created the One Ring to rule the other Rings of Power given to Men, Dwarves, and Elves, in his campaign to conquer all of Middle-earth. From homely beginnings in the Shire, a hobbit land reminiscent of the English countryside, the story ranges across Middle-earth, following the quest to destroy the One Ring mainly through the eyes of the hobbits Frodo, Sam, Merry and Pippin. Although often called a trilogy, the work was intended by Tolkien to be one volume of a two-volume set along with The Silmarillion.[3][T 2] For economic reasons, The Lord of the Rings was published over the course of a year from 29 July 1954 to 20 October 1955 in three volumes[3][4] titled The Fellowship of the Ring, The Two Towers, and The Return of the King. The work is divided internally into six books, two per volume, with several appendices of background material. Some later editions print the entire work in a single volume, following the author's original intent. Tolkien's work, after an initially mixed reception by the literary establishment, has been the subject of extensive analysis of its themes and origins. Influences on this earlier work, and on the story of The Lord of the Rings, include philology, mythology, Christianity, earlier fantasy works, and his own experiences in the First World War. The Lord of the Rings has since been reprinted many times and translated into at least 38 languages.[b] Its enduring popularity has led to numerous references in popular culture, the founding of many societies by fans of Tolkien's works,[5] and the publication of many books about Tolkien and his works. It has inspired many derivative works, including paintings, music, films, television, video games, and board games. It has helped to create and shape the modern fantasy genre, within which it is considered one of the greatest books of all time.."
    }
}
