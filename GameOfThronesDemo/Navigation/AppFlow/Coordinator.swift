//
//  Coordinator.swift
//  GOT
//
//  Created by Mahmoud Diab on 29/10/2022.
//

import Foundation

protocol Coordinator {
   func start()
   func coordinate(to coordinator: Coordinator)
}

extension Coordinator {
   func coordinate(to coordinator: Coordinator) {
       coordinator.start()
   }
}

 
