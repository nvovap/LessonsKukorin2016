//
//  CommentCell.swift
//  LessonsKukorin2016
//
//  Created by Владимир Невинный on 27.01.16.
//  Copyright © 2016 Владимир Невинный. All rights reserved.
//

import UIKit

class CommentCell: UITableViewCell {
    
    @IBOutlet weak var userProfileImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var commentTextLabel: UILabel!
    @IBOutlet weak var createdAtLabel: UILabel!    
    @IBOutlet weak var likeButton: UIButton!
    
    private var currentUserDidLike: Bool = false
    
    var comment: Comment! {
        didSet {
            updateUI()
        }
    }
    
    private func changeLikeButtonColor() {
        if currentUserDidLike {
            likeButton.tintColor = UIColor.redColor()
        } else {
            likeButton.tintColor = UIColor.lightGrayColor()
        }
    }
    
    func updateUI() {
//        userProfileImageView.image = comment.user.profileImage
//        userNameLabel.text = comment.user.fullName
//        createdAtLabel.text = comment.createdAt
        commentTextLabel.text = comment.commentText
        
        userProfileImageView.layer.cornerRadius = userProfileImageView.bounds.width / 2
        userProfileImageView.clipsToBounds = true
        
        likeButton.setTitle("❤️ \(comment.numberOfLikes) likes", forState: UIControlState.Normal)
    }
    
    @IBAction func likeButtonClicked(sender: UIButton) {
//        comment.userDidLike = !comment.userDidLike
//        
//        if comment.userDidLike {
//            comment.numberOfLikes++
//        } else {
//            comment.numberOfLikes--
//        }
        
        likeButton.setTitle("❤️ \(comment.numberOfLikes) likes", forState: UIControlState.Normal)
        
    //    currentUserDidLike = comment.userDidLike
        
        changeLikeButtonColor()
        
    }
    

}
