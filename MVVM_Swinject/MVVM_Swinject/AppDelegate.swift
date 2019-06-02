//
//  AppDelegate.swift
//  MVVM_Swinject
//
//  Created by Joe on 19/05/19.
//  Copyright © 2019 Joe. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        Swinject.setup()
        
        window = UIWindow()
        window?.rootViewController = Swinject.resolve(ViewController.self)
        window?.makeKeyAndVisible()
        
        return true
    }
}

