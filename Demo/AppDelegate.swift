//
//  AppDelegate.swift
//  Demo
//
//  Created by Ben Sarrazin on 2017-01-12.
//  Copyright © 2017 Berzerker IO. All rights reserved.
//

import Leanplum
import LeanplumLocation
import UIKit
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        configureRemoteNotifications(for: application)
        Leanplum.setAppId("app_rlm4Ro4T5wlJkqAeosr1ov8TAkRb6zmEE4zK7T1AYcw", withDevelopmentKey: "dev_qRhQhrFogY9piWPnKaa6NvKoCmOQq2YKztrbveFQcnQ")
        Leanplum.trackAllAppScreens()
        Leanplum.start()
        print("\(#function)\n\(Leanplum.deviceId())")
        return true
    }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        print("\(#function)\n\(userInfo)")
        completionHandler(.newData)
    }
    
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print(error)
    }
    
    // MARK: - Configuration
    
    private func configureRemoteNotifications(for application: UIApplication) {
        let options: UNAuthorizationOptions = [.alert, .badge, .sound]
        UNUserNotificationCenter.current().requestAuthorization(options: options) { (_, _) in }
        UNUserNotificationCenter.current().delegate = self
        application.registerForRemoteNotifications()
    }
    
}

extension AppDelegate: UNUserNotificationCenterDelegate {
    
//    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
//        print("\(#function)\n\(response)")
//        completionHandler()
//    }
    
//    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
//        print("\(#function)\n\(notification)")
//        completionHandler(.alert)
//    }
    
}

