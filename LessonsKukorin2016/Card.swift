//
//  Card.swift
//  LessonsKukorin2016
//
//  Created by Владимир Невинный on 26.01.16.
//  Copyright © 2016 Владимир Невинный. All rights reserved.
//

import UIKit

class Card {
    var title = ""
    var description = ""
    var numberOfComment = 0
    var cardImage: UIImage!
    
    
    init(title: String, description: String, cardImage: UIImage!) {
        self.title = title
        self.description = description
        self.cardImage = cardImage
        self.numberOfComment = 1
    }
    
    //dummy data
    static func createCard() -> [Card]{
        return [Card(title: "Ferrari 430 Hamann", description: "It's Car of dream", cardImage: UIImage(named: "Ferrari430Hamann")), Card(title: "Ford Shelby GT 350R", description: "It's butifull Car", cardImage: UIImage(named: "FordShelbyGT350R")), Card(title: "Infiniti FX35", description: "It's good Car", cardImage: UIImage(named: "InfinitiFX35"))]
    }
}
