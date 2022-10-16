//
//  AppDelegate.swift
//  GameOfThronesDemo
//
//  Created by Mahmoud Diab on 12/10/2022.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    //MARK: Properties -
    var window: UIWindow?
    var coordinator: AppCoordinator?
    lazy var musicPlayer: MusicPlayer = {
        let player = DefaultMusicPlayer()
        return player
    }()
    
    
    //MARK: App lifeCycle -
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        /// Background Music
        musicPlayer.startBackgroundMusic(.GOTBackground)
        
        /// Navigation
        window = UIWindow()
        coordinator = AppCoordinator(window: window!)
        coordinator?.start()
        
        return true
    }
}

