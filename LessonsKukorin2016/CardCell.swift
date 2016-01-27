//
//  CardCell.swift
//  LessonsKukorin2016
//
//  Created by Владимир Невинный on 26.01.16.
//  Copyright © 2016 Владимир Невинный. All rights reserved.
//

import UIKit


class CardCell: UICollectionViewCell {

    @IBOutlet weak var cardImagrView: UIImageView!
    @IBOutlet weak var cardTitleLabel: UILabel!
    @IBOutlet weak var cardDescriptionLabel: UILabel!
    
    
    var card: Card! {
        didSet {
            updateUI()
        }
    }
    
    func updateUI() {
        cardTitleLabel.text = card.title
        cardDescriptionLabel.text = card.description
        cardImagrView.image = card.cardImage
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.layer.cornerRadius = 10.0
        self.clipsToBounds = true
        
    }
}
