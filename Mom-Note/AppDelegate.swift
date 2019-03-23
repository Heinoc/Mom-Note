//
//  AppDelegate.swift
//  Mom-Note
//
//  Created by Heinoc on 2018/12/21.
//  Copyright © 2018 Heinoc. All rights reserved.
//

import UIKit

import ESTabBarController_swift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UITabBarControllerDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let defaults = UserDefaults.standard
        let userID = defaults.string(forKey: LoginInfo.userID)
        
        if userID == nil || userID == "" {
            let login = LoginController()
            let nav = UINavigationController(rootViewController: login)
            
            self.window?.rootViewController = nav
        } else {
            let tab = customTabbar()
            self.window?.rootViewController = tab
        }
        self.window?.makeKeyAndVisible()

        return true
    }
    
    func customTabbar() -> ESTabBarController {
        let tabBarController = ESTabBarController()
        
        tabBarController.delegate = self
        tabBarController.title = "MomNote"
//        tabBarController.shouldHijackHandler = {
//            tabbarController, viewController, index in
//            if index == 2 {
//                return true
//            }
//            return false
//        }
//        tabBarController.didHijackHandler = {
//            [weak tabBarController] tabbarController, viewController, index in
//
//            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
//                //                let vc = FMPlayController()
//                //                tabBarController?.present(vc, animated: true, completion: nil)
//            }
//        }
        
        let recordController = RecordController()
        recordController.date = Date()
        let historyController = HistoryController()
        
        recordController.title = "记录"
        historyController.title = "历史"
        
        recordController.tabBarItem = ESTabBarItem.init(ESTabBarItemContentView(), title: "记录", image: UIImage(named: "icon_record"), selectedImage: UIImage(named: "icon_record"))
        historyController.tabBarItem = ESTabBarItem.init(ESTabBarItemContentView(), title: "历史", image: UIImage(named: "icon_record"), selectedImage: UIImage(named: "icon_record"))
        
        let navRecord = BaseNavigationController.init(rootViewController: recordController)
        let navHistory = BaseNavigationController.init(rootViewController: historyController)
        
        tabBarController.viewControllers = [navRecord, navHistory]
        
        return tabBarController
        
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

