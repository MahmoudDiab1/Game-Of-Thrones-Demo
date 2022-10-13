//
//  Coordinator.swift
//  GameOfThronesDemo
//
//  Created by Mahmoud Diab on 13/10/2022.
//


import UIKit

public protocol Coordinator : class {

    var childCoordinators: [Coordinator] { get set }

    
    init(navigationController:UINavigationController)

    func start()
}
