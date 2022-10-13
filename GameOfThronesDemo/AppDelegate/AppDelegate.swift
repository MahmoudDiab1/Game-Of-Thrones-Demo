//
//  AppDelegate.swift
//  GameOfThronesDemo
//
//  Created by Mahmoud Diab on 12/10/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

 
    var window: UIWindow?
    // Make the first coordinator with a strong reference
    var houseCoordinator : HouseCoordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UINavigationController()
        
        // Initialise the first coordinator with the main navigation controller
        houseCoordinator = HouseCoordinator(navigationController: window?.rootViewController as! UINavigationController)
        
        // The start method will actually display the main view
        houseCoordinator?.start()
        
        window?.makeKeyAndVisible()
        return true
    }
 
 


}

