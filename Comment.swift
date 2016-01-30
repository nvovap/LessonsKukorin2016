//
//  Comment.swift
//  LessonsKukorin2016
//
//  Created by Владимир Невинный on 27.01.16.
//  Copyright © 2016 Владимир Невинный. All rights reserved.
//

import UIKit
import Parse

class Comment : PFObject, PFSubclassing {
    
    @NSManaged var user: PFUser
    @NSManaged var commentText: String
    @NSManaged var numberOfLikes: Int
    @NSManaged var cardId: String
    @NSManaged var likeUserIds: [String]!
    
    
    init( user: PFUser,  commentText: String, numberOfLikes: Int, cardId: String) {
        super.init()
        
        self.user = user
        self.commentText = commentText
        self.numberOfLikes = numberOfLikes
        self.cardId = cardId
        self.likeUserIds = [String]()
    }
    
    
    //MARK: - Like / Dislike
    func like() {
        if let currentUserObjectId = User.currentUser()?.objectId {
            if !likeUserIds.contains(currentUserObjectId) {
                numberOfLikes += 1
                likeUserIds.insert(currentUserObjectId, atIndex: 0)
                self.saveInBackground()
            }
        }
    }
    
    func disLike() {
        if let currentUserObjectId = User.currentUser()?.objectId {
            if let index = likeUserIds.indexOf(currentUserObjectId) {
                numberOfLikes -= 1
                likeUserIds.removeAtIndex(index)
                self.saveInBackground()
            }
        }
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
        return "Comment"
    }
    
}
