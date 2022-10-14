//
//  HousDetailsEndPoint.swift
//  GameOfThronesDemo
//
//  Created by Mahmoud Diab on 13/10/2022.
//

import Foundation

enum HousDetailsEndPoint: Endpoint {
    case getHouseDetails(url: String)
}

extension HousDetailsEndPoint {
    var urlRequest: URLRequest? {
        switch self {
        case .getHouseDetails(let url):
            let url = (URL(string: url ) ?? URL(string:""))!
            var urlRequest = URLRequest(url: url )
            urlRequest.httpMethod = "GET"
            return urlRequest
        }
    }
}
