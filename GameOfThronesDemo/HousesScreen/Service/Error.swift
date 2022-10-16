//
//  HousesError.swift
//  GameOfThronesDemo
//
//  Created by Mahmoud Diab on 12/10/2022.
//

import Foundation

// MARK: Alert model -
struct AlertErrorModel {
    let title:String?
    let message:String?
}

// MARK: Error Model -
enum DefaultErrorModel:Error {
    case offline
    case serverError
    
    // TODO: Initialize alert model based on a real business requirement -
    var asAlertModel: AlertErrorModel {
        switch self {
         case .offline:
            return AlertErrorModel(title: "Offline mode",
                                   message: "Sorry, you aren't connected to the internet")
        case .serverError:
            return AlertErrorModel(title: "Data isn't available",
                                   message: "Sorry, Data isn't available")
        }
    }
}
