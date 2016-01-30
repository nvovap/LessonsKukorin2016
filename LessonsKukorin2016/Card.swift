//
//  Card.swift
//  LessonsKukorin2016
//
//  Created by Владимир Невинный on 26.01.16.
//  Copyright © 2016 Владимир Невинный. All rights reserved.
//

import UIKit
import Parse


class Card : PFObject, PFSubclassing {
    
    @NSManaged var title: String!
    @NSManaged var cardDescription: String!
    @NSManaged var numberOfComments: Int
    @NSManaged var cardImage: PFFile
    
    override init() {
        super.init()
    }
    
    init(title: String, cardDescription: String, cardImage: PFFile, numberOfComments: Int) {
        super.init()
        self.title = title
        self.cardDescription = cardDescription
        self.cardImage = cardImage
        self.numberOfComments = numberOfComments
    }
    
    func incrementNumberOfComments() {
        numberOfComments += 1
        self.saveInBackground()
    }
    
    //MARK: - PFSubclassing
    override class func initialize() {
        struct Static {
            static var onceToken: dispatch_once_t = 0
        }
        
        dispatch_once(&Static.onceToken) {
            self.registerSubclass()
        }
    }
    
    static func parseClassName() -> String {
        return "Card"
    }
}
