//
//  DetailsCoordinator.swift
//  GameOfThronesDemo
//
//  Created by Mahmoud Diab on 13/10/2022.
//

import UIKit



class DetailsCoordinator: Coordinator{
     
    var childCoordinators: [Coordinator] = []
    
    unowned let navigationController:UINavigationController
    
    // We use this delegate to keep a reference to the parent coordinator
    weak var delegate: DetailsRouter?
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let detailsViewController : DetailsViewController = DetailsViewController()
        detailsViewController.delegate = self
        self.navigationController.pushViewController(detailsViewController, animated: true)
    }
}

extension DetailsCoordinator : DetailsRouter {
    func navigateBackToMasterView(detailsCoordinator: DetailsCoordinator) {
        self.delegate?.navigateBackToMasterView(detailsCoordinator: self)
    }
}



