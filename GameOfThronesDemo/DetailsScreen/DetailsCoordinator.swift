//
//  SecondCoordinator.swift
//  CoordinatorDemo
//
//  Created by Saad El Oulladi on 29/09/2018.
//  Copyright © 2018 touti. All rights reserved.
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
        let detailsViewController : DetailsViewController = DetailsViewController(router: self)
        self.navigationController.pushViewController(detailsViewController, animated: true)
    }
}

extension DetailsCoordinator : DetailsRouter {
    func navigateBackToMasterView(detailsCoordinator: DetailsCoordinator) {
        self.delegate?.navigateBackToMasterView(detailsCoordinator: self)
    }
}



