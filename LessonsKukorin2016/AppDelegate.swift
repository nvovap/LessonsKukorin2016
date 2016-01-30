//
//  AppDelegate.swift
//  LessonsKukorin2016
//
//  Created by Владимир Невинный on 26.01.16.
//  Copyright © 2016 Владимир Невинный. All rights reserved.
//

import UIKit
import Parse


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        
        
     //   Parse.enableLocalDatastore()
        
        //register PFSubclassing 
        
        
        Card.initialize()
        Comment.initialize()
        User.initialize()
        
        // Initialize Parse.
        Parse.setApplicationId("x9oLAsbfe4A6M1PvZ3lz4WkY0AyuXVJDQbxzbgTO",
            clientKey: "XM4EP4IeZfG8m1aBEzk7mKctGarPdG8pruks3opJ")
        
        
        // [Optional] Track statistics around application opens.
        PFAnalytics.trackAppOpenedWithLaunchOptions(launchOptions)
        
     
        
       /* let card = PFObject(className: "Card")
        card["title"] = "Ferrari"
        card["Desc"] = "It's card my dream!!!"
        
        card.saveInBackgroundWithBlock { (success, error) -> Void in
            if success == true {
                print("Object has been saved.")
            } else {
                print("Object don't save.")
            }
        }*/
        
        
//        let query = PFQuery(className:"Card")
//        query.getObjectInBackgroundWithId("1YBOWJv7HA5") {
//            (gameScore: PFObject?, error: NSError?) -> Void in
//            if error != nil {
//                print(error)
//            } else if let gameScore = gameScore {
//                print(gameScore)
//            }
//        }
        
        //try! card.save()
        //card.saveInBackground()
        //card.saveEventually() //this mezod save data don't internet connection
        
        
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

