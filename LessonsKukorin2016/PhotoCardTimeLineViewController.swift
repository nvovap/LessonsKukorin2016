//
//  PhotoCardTimeLineViewController.swift
//  LessonsKukorin2016
//
//  Created by Владимир Невинный on 26.01.16.
//  Copyright © 2016 Владимир Невинный. All rights reserved.
//

import UIKit

class PhotoCardTimeLineViewController: UIViewController {
    
    
    @IBOutlet weak var CollectionView: UICollectionView!
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    @IBOutlet weak var currentFullnameButton: UIButton!
    
    
    private let cards = Card.createCard()

    override func viewDidLoad() {
        super.viewDidLoad()

        backgroundImageView.image = UIImage(named: "cloud")
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.Dark)
        let bluerEffectView = UIVisualEffectView(effect: blurEffect)
        bluerEffectView.frame = view.frame
        
        backgroundImageView.addSubview(bluerEffectView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
