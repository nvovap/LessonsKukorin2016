//
//  Comment.swift
//  LessonsKukorin2016
//
//  Created by Владимир Невинный on 27.01.16.
//  Copyright © 2016 Владимир Невинный. All rights reserved.
//

import UIKit

class Comment {
    var id: String
    var user: User
    var createdAt: String
    var commentText: String
    var numberOfLikes: Int = 0
    
    let cardId: String
    
    var userDidLike = false
    
    init(id: String, user: User, createdAt: String, commentText: String, numberOfLikes: Int, cardId: String, userDidLike: Bool) {
        self.id = id
        self.user = user
        self.createdAt = createdAt
        self.commentText = commentText
        self.numberOfLikes = numberOfLikes
        self.cardId = cardId
        self.userDidLike = userDidLike
    }
    
    
    static let allComment = [
        Comment(id: "id1", user: User.allUsers()[0], createdAt: "today", commentText: "Test", numberOfLikes: 12, cardId: "card1", userDidLike: false),
        Comment(id: "id2", user: User.allUsers()[0], createdAt: "yesterday", commentText: "Test two", numberOfLikes: 2, cardId: "card2", userDidLike: true)
    ]
    
}
