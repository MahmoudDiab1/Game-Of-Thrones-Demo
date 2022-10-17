//
//  AppCoordinator.swift
//  GOT
//
//  Created by Mahmoud Diab on 15/10/2022.
//

import UIKit

struct AppCoordinator: Coordinator {
    // MARK: Properties -
    private let window: UIWindow
    
    // MARK: Initializers -
    init(window: UIWindow) {
        self.window = window
    }
    
    // MARK: Functions -
    func start() {
        let navController = UINavigationController ()
        navController.styleNav()
        
        window.rootViewController = navController
        window.makeKeyAndVisible()
        
        let startCoordinator = HousesCoordinator(navigationController: navController)
        coordinate(to: startCoordinator)
    }
}

