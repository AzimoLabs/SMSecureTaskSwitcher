//
//  AppDelegate.swift
//  SMSecureTaskSwitcher_Example
//
//  Created by Miroslaw Stanek on 25/10/2021.
//  Copyright © 2021 Mateusz Kuźnik. All rights reserved.
//

import Foundation
import UIKit
import SMSecureTaskSwitcher

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var secureTaskSwitcher: SMSecureTaskSwitcher?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        secureTaskSwitcher = SMSecureTaskSwitcher()
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {}

    func applicationDidEnterBackground(_ application: UIApplication) {
        self.secureTaskSwitcher?.applicationDidEnterBackground()

    }

    func applicationWillEnterForeground(_ application: UIApplication) {}

    func applicationDidBecomeActive(_ application: UIApplication) {}

    func applicationWillTerminate(_ application: UIApplication) {}
}
