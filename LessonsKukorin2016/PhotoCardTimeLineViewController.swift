//
//  PhotoCardTimeLineViewController.swift
//  LessonsKukorin2016
//
//  Created by Владимир Невинный on 26.01.16.
//  Copyright © 2016 Владимир Невинный. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class PhotoCardTimeLineViewController: UIViewController {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    @IBOutlet weak var currentFullnameButton: UIButton!
    
    
    private var cards = [Card]()

    
    func fetchCards() {
        
        let currentUser = User.currentUser()!
        let cardIds = currentUser.cardIds
        
        if cardIds.count > 0 {
            let cardQuery = PFQuery(className: Card.parseClassName())
            cardQuery.orderByDescending("updateAt")
            cardQuery.whereKey("objectId", containedIn: cardIds)
            
            cardQuery.findObjectsInBackgroundWithBlock({ (objects : [PFObject]?, error : NSError?) -> Void in
                if error == nil {
                    if let cardObjects = objects {
                        self.cards.removeAll()
                        
                        for cardObject in cardObjects {
                            let card = cardObject as! Card
                            self.cards.append(card)
                        }
                        
                        self.collectionView.reloadData()
                    }
                } else {
                    print("\(error!.localizedDescription)")
                }
                
            })
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        if PFUser.currentUser() == nil {
            userLogIn()
        } else {
            fetchCards()
            
            let center = NSNotificationCenter.defaultCenter()
   
            
            center.addObserverForName("NewCardCreated", object: nil, queue: NSOperationQueue.mainQueue(), usingBlock: { (notification : NSNotification) -> Void in
                if let newCardObject = notification.userInfo?["newCardObject"] as? Card {
                    if !self.cardWasDisplayed(newCardObject) {
                        self.cards.insert(newCardObject, atIndex: 0)
                        self.collectionView.reloadData()
                    }
                }
            })
        }
    }
    
    func cardWasDisplayed(newCard: Card) -> Bool {
        for card in cards {
            if card.objectId == newCard.objectId {
                return true
            }
        }
        
        return false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        backgroundImageView.image = UIImage(named: "cloud")
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.Dark)
        let bluerEffectView = UIVisualEffectView(effect: blurEffect)
        bluerEffectView.frame = view.frame
        
        backgroundImageView.addSubview(bluerEffectView)
    }

    
    @IBAction func logOut(sender: UIButton) {
        PFUser.logOutInBackgroundWithBlock { (error) -> Void in
            if error == nil {
                print("log out success!")
                self.userLogIn()
            }
            
        }
    }
    
    
    
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }

    
    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ShowCard" {
            
            let cell = sender as! CardCell
            let card = cell.card
            
            let navigationViewController = segue.destinationViewController as! UINavigationController
            let cardViewController = navigationViewController.topViewController as! CardViewController
            
            
            cardViewController.card = card
        }
    }


}

extension PhotoCardTimeLineViewController: UICollectionViewDataSource {
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cards.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! CardCell
        
        cell.card = self.cards[indexPath.row]
        
        return cell
    }
}

extension PhotoCardTimeLineViewController: PFLogInViewControllerDelegate {
    
    func userLogIn() {
        let signInController = PFSignUpViewController()
        signInController.delegate = self
        
        
        let logInController = PFLogInViewController()
        logInController.delegate = self
        logInController.signUpController = signInController
        
        self.presentViewController(logInController, animated: true, completion: nil)
    }
    
    
    func logInViewController(logInController: PFLogInViewController, didLogInUser user: PFUser) {
        print(user)
        logInController.dismissViewControllerAnimated(true, completion: nil)
    }
}


extension PhotoCardTimeLineViewController: PFSignUpViewControllerDelegate {
    func signUpViewController(signUpController: PFSignUpViewController, didSignUpUser user: PFUser) {
        signUpController.dismissViewControllerAnimated(true, completion: nil)
    }
}
