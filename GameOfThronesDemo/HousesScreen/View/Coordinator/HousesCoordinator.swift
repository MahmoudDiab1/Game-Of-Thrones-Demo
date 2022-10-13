//
//  HouseCoordinator.swift
//  GameOfThronesDemo
//
//  Created by Mahmoud Diab on 13/10/2022.
//


import UIKit

class HouseCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    
    unowned let navigationController:UINavigationController
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() { 
        let housesViewController: HousesViewController = HousesViewController(router: self)
        self.navigationController.viewControllers = [housesViewController]
    }
}

extension HouseCoordinator: HousesViewControllerRouter {
    
    // Navigate to next page
    func navigateToDetailsPage() {
        let detailsCoordinator = DetailsCoordinator(navigationController: navigationController)
        detailsCoordinator.delegate = self
        childCoordinators.append(detailsCoordinator)
        detailsCoordinator.start()
    }
}

extension HouseCoordinator: DetailsRouter {
    func navigateBackToMasterView(detailsCoordinator: DetailsCoordinator) {
        navigationController.popToRootViewController(animated: true)
        childCoordinators.removeLast()
    } 
}

