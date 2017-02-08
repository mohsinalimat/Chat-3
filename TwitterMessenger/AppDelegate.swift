//
//  AppDelegate.swift
//  TwitterMessenger
//
//  Created by 1amageek on 2017/01/31.
//  Copyright © 2017年 Stamp inc. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        NSSetUncaughtExceptionHandler { exception in
            debugPrint(exception.name)
            debugPrint(exception.reason ?? "")
            debugPrint(exception.callStackSymbols)
        }
//        let navigationController: UINavigationController = UINavigationController(rootViewController: ViewController())
//        self.window = UIWindow(frame: UIScreen.main.bounds)
//        self.window?.rootViewController = navigationController
//        self.window?.makeKeyAndVisible()
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        
        let notification: Notification = Notification(name: Notification.Name(rawValue: "mssgr.oauth.notification"), object: nil, userInfo: ["mssgr.callback.key": url])
        NotificationCenter.default.post(notification)
        
        return true
    }
}
