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



