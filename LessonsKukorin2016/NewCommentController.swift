//
//  NewCommentController.swift
//  LessonsKukorin2016
//
//  Created by Владимир Невинный on 28.01.16.
//  Copyright © 2016 Владимир Невинный. All rights reserved.
//

import UIKit

class NewCommentController: UIViewController {
    
    @IBOutlet weak var navigationBar: UINavigationBar!
    @IBOutlet weak var currentUserProfileImage: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var commentContentTextView: UITextView!
    
    
    override func viewDidLoad() {
        commentContentTextView.becomeFirstResponder()
        commentContentTextView.text = ""
        
        //Handle Text View
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
    }
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
    
    func keyboardWillShow(notification: NSNotification) {
        let userInfo = notification.userInfo ?? [:]
        
        let keyboardSize = (userInfo[UIKeyboardFrameBeginUserInfoKey] as! NSValue).CGRectValue()
        
        self.commentContentTextView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height, right: 0)
        self.commentContentTextView.scrollIndicatorInsets = self.commentContentTextView.contentInset
    }
    
    func keyboardWillHide(notification: NSNotification) {
        self.commentContentTextView.contentInset = UIEdgeInsetsZero
        self.commentContentTextView.scrollIndicatorInsets = UIEdgeInsetsZero
    }
    
    
    @IBAction func addComment(sender: AnyObject) {
        commentContentTextView.resignFirstResponder()
        
        self.dismissViewControllerAnimated(true, completion: nil)        
    }
    
    
    @IBAction func close(sender: AnyObject) {
        commentContentTextView.resignFirstResponder()
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
}
