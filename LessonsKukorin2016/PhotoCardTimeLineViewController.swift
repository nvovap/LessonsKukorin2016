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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

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
