//
//  HousesError.swift
//  GameOfThronesDemo
//
//  Created by Mahmoud Diab on 12/10/2022.
//

import Foundation

struct AlertErrorModel {
    let title:String?
    let message:String?
}

enum DefaultErrorModel:Error {
    case offline
    case serverError
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
