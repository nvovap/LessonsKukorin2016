//
//  User.swift
//  LessonsKukorin2016
//
//  Created by Владимир Невинный on 27.01.16.
//  Copyright © 2016 Владимир Невинный. All rights reserved.
//

import UIKit
import Parse


class User : PFUser {
    
    @NSManaged var profileImage: PFFile
    @NSManaged var cardIds: [String]!
    
    
    func joinCard(cardId: String) {
        
        if self.cardIds == nil {
            self.cardIds = [cardId]
        } 
        
        self.cardIds.insert(cardId, atIndex: 0)
        self.saveInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
            if let error = error {
                print("\(error.localizedDescription)")
            }
        }
    }
    
    override class func initialize() {
        struct Static {
            static var onceToken: dispatch_once_t = 0
        }
        
        dispatch_once(&Static.onceToken) {
            self.registerSubclass()
        }
    }
    
    
}
