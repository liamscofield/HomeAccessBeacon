//
//  AppDelegate.swift
//  HomeAccessBeacon
//
//  Created by AlienLi on 16/1/22.
//  Copyright © 2016年 MarcoLi. All rights reserved.
//

import UIKit
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate  {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        if LocationManager.sharedManager.respondsToSelector("requestAlwaysAuthorization") {
            LocationManager.sharedManager.requestAlwaysAuthorization()
        }
        
        UIApplication.sharedApplication().registerUserNotificationSettings(UIUserNotificationSettings(forTypes: [.Alert, .Badge, .Sound], categories: nil))

        
        LocationManager.sharedManager.delegate = LocationManager.sharedManager
        
        LocationManager.sharedManager.startMonitoringForRegion(LocationManager.region)
        LocationManager.region.notifyOnEntry = true
        LocationManager.region.notifyOnExit = true
        
        
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
        BlueToothCenter.defaultCenter.stopBlueToothServices()

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
        BlueToothCenter.defaultCenter.startBlueToothServices()

    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        

    }
    
       
    func application(application: UIApplication, didReceiveLocalNotification notification: UILocalNotification){
        let alertController = UIAlertController(title: notification.alertBody, message: nil, preferredStyle: UIAlertControllerStyle.Alert)
        
        let action: UIAlertAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
        
        alertController.addAction(action)
        self.window?.rootViewController?.presentViewController(alertController, animated: true, completion: nil)
    }
}



