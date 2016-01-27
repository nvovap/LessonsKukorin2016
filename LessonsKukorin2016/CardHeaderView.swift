//
//  CardHeaderView.swift
//  LessonsKukorin2016
//
//  Created by Владимир Невинный on 27.01.16.
//  Copyright © 2016 Владимир Невинный. All rights reserved.
//

import UIKit

class CardHeaderView: UIView {

    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var cardDescriptionLabel: UILabel!
    @IBOutlet weak var  numberOfCommentsLabel: UILabel!
    
    var card: Card! {
        didSet {
            updateUI()
        }
    }
    
    func updateUI() {
        numberOfCommentsLabel.text = "\(card.numberOfComment) comments"
        cardDescriptionLabel.text = card.description
        backgroundImageView.image = card.cardImage
    }
}
