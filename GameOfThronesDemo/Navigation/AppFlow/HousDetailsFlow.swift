//
//  HousDetailsFlow.swift
//  GOT
//
//  Created by Mahmoud Diab on 15/10/2022.
//

import Foundation
import UIKit

class HousDetailsCoordinator: Coordinator {
    // MARK: Properties -
    let navigationController: UINavigationController 
    private var housDetailsModel: HouseTarget
    
    // MARK: Initializers -
    init(_ navigationController: UINavigationController, model: HouseTarget) {
        self.navigationController = navigationController
        self.housDetailsModel = model
    }
    
    // MARK: Functions -
    func start() {
        let presenter = HouseDetailsPresenter(.remote(.urlSessionProvider), model: housDetailsModel)
        let controller = HouseDetailsViewController(presenter:  presenter) 
        navigationController.pushViewController(controller, animated: true)
    }
}
