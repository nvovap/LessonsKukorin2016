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
        
        card.cardImage.getDataInBackgroundWithBlock { (data: NSData?, error: NSError?) -> Void in
            if let error = error {
                print("\(error.localizedDescription)")
            }  else {
                if let data = data {
                    dispatch_async(dispatch_get_main_queue(), { () -> Void in
                        self.cardImagrView.image = UIImage(data: data)
                    })
                }
            }
            
        }
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.layer.cornerRadius = 10.0
        self.clipsToBounds = true
        
    }
}
