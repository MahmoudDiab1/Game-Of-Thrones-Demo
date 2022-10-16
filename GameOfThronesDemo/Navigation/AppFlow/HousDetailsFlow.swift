//
//  HousDetailsFlow.swift
//  GOT
//
//  Created by Mahmoud Diab on 15/10/2022.
//

import Foundation
import UIKit

protocol HousDetailsFlow{
    
}

class HousDetailsCoordinator: Coordinator {
    
    let navigationController: UINavigationController 
    private var housDetailsModel: HouseTarget
    
    init(_ navigationController: UINavigationController, model: HouseTarget) {
        self.navigationController = navigationController
        self.housDetailsModel = model
    }
    
    func start() {
        let presenter = HouseDetailsPresenter(.remote(.urlSessionProvider), model: housDetailsModel)
        let controller = HouseDetailsViewController(presenter:  presenter, coordinator: self) 
        navigationController.pushViewController(controller, animated: true)
    }
}

// MARK: - Flow Methods
extension HousDetailsCoordinator: HousDetailsFlow {
    
}
