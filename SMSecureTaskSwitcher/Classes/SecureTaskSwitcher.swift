//
//  SecureTaskSwitcher.swift
//  SMSecureTaskSwitcher
//
//  Created by Miroslaw Stanek on 25/10/2021.
//

import Foundation
import UIKit

public class SecureTaskSwitcher {
    
    let secureWindow: UIWindow
    let notificationCenter: NotificationCenter
    let mainScreen: UIScreen
    let configuration: SMSecureTaskSwitcherConfiguration
    
    public init(configuration: SMSecureTaskSwitcherConfiguration = SMSecureTaskSwitcherBlurredConfiguration(),
         notificationCenter: NotificationCenter = NotificationCenter.default,
         mainScreen: UIScreen = UIScreen.main) {
        self.notificationCenter = notificationCenter
        self.mainScreen = mainScreen
        self.configuration = configuration
        
        self.secureWindow = UIWindow.init(frame: self.mainScreen.bounds)
        self.secureWindow.windowLevel = UIWindow.Level.alert + 10
        self.secureWindow.backgroundColor = UIColor.clear
        self.secureWindow.isHidden = true
        
        self.secureWindow.rootViewController = securedViewController()
        
        setupObservers()
    }
    
    private func securedViewController() -> UIViewController {
        let rootViewController: UIViewController = UIViewController()
        rootViewController.view.backgroundColor = UIColor.clear
        return rootViewController
    }
    
    private func setupObservers() {
        self.notificationCenter.addObserver(self,
                                            selector: #selector(applicationWillEnterForeground),
                                            name: UIApplication.willEnterForegroundNotification,
                                            object: nil)
    }
    
    public func applicationDidEnterBackground() {
        self.updateSecureView()
        self.secureWindow.isHidden = false
    }
    
    @objc
    public func applicationWillEnterForeground() {
        self.secureWindow.isHidden = true
    }
    
    private func updateSecureView() {
        if let view = self.secureWindow.rootViewController?.view {
            for (_, subview) in view.subviews.enumerated() {
                subview.removeFromSuperview()
            }
        }
        
        self.secureWindow.rootViewController?.view
            .addSubview(self.configuration.secureView(forFrame: self.mainScreen.bounds))
    }
}


