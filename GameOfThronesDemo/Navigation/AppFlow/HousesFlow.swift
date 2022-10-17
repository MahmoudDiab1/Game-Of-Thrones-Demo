//
//  HousesFlow.swift
//  GOT
//
//  Created by Mahmoud Diab on 15/10/2022.
//

import Foundation
import UIKit


struct HousesCoordinator: Coordinator {
    // MARK: Properties -
    let navigationController: UINavigationController
    
    // MARK: Initializers -
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: Functions -
    func start() {
        let presenter = HousesPresenter( .remote(.urlSessionProvider))
        let controller = HousesViewController(coordinator: self, presenter: presenter)
        navigationController.pushViewController(controller, animated: true)
    }
}

// MARK: Flow -
extension HousesCoordinator: HousesFlow { 
    func coordinateToHousDetails(house: HouseTarget) {
        let houseDetailsCoordinator = HousDetailsCoordinator(navigationController, model: house)
        coordinate(to: houseDetailsCoordinator)
    }
}
