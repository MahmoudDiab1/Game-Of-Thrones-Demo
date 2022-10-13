//
//  HousesEndPoint.swift
//  GameOfThronesDemo
//
//  Created by Mahmoud Diab on 12/10/2022.
//

import Foundation

enum HousesEndPoint: Endpoint {
    case getHouses
}

extension HousesEndPoint {
    var baseUrl: String{
        switch self {
        case .getHouses:
            return "anapioficeandfire.com"
        }
    }
    
    var method: String {
        switch self {
        case .getHouses:
            return "GET"
        }
    }
    
    var scheme:String  {
        switch self  {
        default:
            return "https"
        }
    }
    
    var base: String {
        switch self {
        default:
            return baseUrl
        }
    }
    
    var path : String {
        switch self {
        case .getHouses:
            return "/api/houses/"
        }
    }
    
    var parameter: [URLQueryItem]? {
        return nil
    }
}
