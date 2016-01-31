//
//  NewCardViewController.swift
//  LessonsKukorin2016
//
//  Created by Владимир Невинный on 29.01.16.
//  Copyright © 2016 Владимир Невинный. All rights reserved.
//

import UIKit
import Parse

class NewCardViewController: UIViewController {
    
    
    @IBOutlet weak var newCardTitleTextField: UITextField!
    @IBOutlet weak var newCardDescriptionTextView: UITextView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var selectImageButton: UIButton!
    
    var photoTakingHelper: PhotoTakingHelper?
    
    private var cardImage: UIImage!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        newCardTitleTextField.becomeFirstResponder()
        newCardTitleTextField.delegate = self
        
        newCardDescriptionTextView.delegate = self
        
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    @IBAction func getImage(sender: AnyObject) {
        photoTakingHelper = PhotoTakingHelper(viewController: self, callback: { (image: UIImage?) -> Void in
            if let image = image {
                self.cardImage = image
                self.imageView.image = image
            }
        })
    }
    
    
    @IBAction func close(sender: AnyObject) {
        hideKeyboard()
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func hideKeyboard() {
        if newCardDescriptionTextView.isFirstResponder() {
            newCardDescriptionTextView.resignFirstResponder()
        } else if newCardTitleTextField.isFirstResponder() {
            newCardTitleTextField.resignFirstResponder()
        }
    }
       
    @IBAction func addNewCard(sender: AnyObject) {
        createNewCard()
        
        hideKeyboard()
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    private struct ImageSize {
        static let height: CGFloat = 480.0
    }
    
    func resizeImage(fromImage image: UIImage) -> PFFile! {
        let ratio = image.size.width / image.size.height
        
        let newSize = CGSizeMake(ImageSize.height * ratio, ImageSize.height)
        let newRect = CGRectMake(0, 0, newSize.width, newSize.width)
        
        
       // image.resiz
        
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        
        image.drawInRect(newRect)
        let resizedImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
       // let resizeImage =
        
        //let resizedImage = image.stretchableImageWithLeftCapWidth(NSInteger(newSize.width - image.size.width), topCapHeight: NSInteger(newSize.height - image.size.height))
        
        
       // let resizedImage = image.resizableImageWithCapInsets(UIEdgeInsets(top: 0, left: 0, bottom: 100  , right: 100), resizingMode: UIImageResizingMode.Stretch)
        
        
        let imageData = UIImageJPEGRepresentation(resizedImage, 0.8)
        return PFFile(name: "image.jpg", data: imageData!)
    }
    
    func createNewCard() {
        
        let newCard = Card(title: newCardTitleTextField.text!, cardDescription: newCardDescriptionTextView.text!, cardImage: resizeImage(fromImage: self.cardImage), numberOfComments: 0)
        
        newCard.saveInBackgroundWithBlock { (success, error: NSError?) -> Void in
            if error == nil {
                let currentUser = User.currentUser()!
                
                currentUser.joinCard(newCard.objectId!)
                
                let center = NSNotificationCenter.defaultCenter()
                let notification = NSNotification(name: "NewCardCreated", object: nil, userInfo: ["newCardObject" : newCard])
                
                center.postNotification(notification)
                
            } else {
                print("\(error?.localizedDescription)")
            }
            
        }
    }
}

extension NewCardViewController: UITextFieldDelegate {
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if newCardDescriptionTextView.text == "description" && textField.text?.isEmpty == false {
            newCardDescriptionTextView.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
    
        return true
    }
}

extension NewCardViewController: UITextViewDelegate {
    func textViewShouldBeginEditing(textView: UITextView) -> Bool {
        textView.text = ""
        return true
    }
    
  
    func textViewShouldEndEditing(textView: UITextView) -> Bool {
        if textView.text.isEmpty {
            textView.text = "description"
        }
        
        return true
    }
}
