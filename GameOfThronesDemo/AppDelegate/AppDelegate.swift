//
//  AppDelegate.swift
//  GameOfThronesDemo
//
//  Created by Mahmoud Diab on 12/10/2022.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    //MARK: Variables -
    var window: UIWindow?
    var coordinator: AppCoordinator?
    
    //MARK: App lifeCycle -
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        MusicPlayer.shared.startBackgroundMusic(backgroundMusicFileName: "game_of_thrones") 
        window = UIWindow()
        coordinator = AppCoordinator(window: window!)
        coordinator?.start()
        
        return true
    }
}

