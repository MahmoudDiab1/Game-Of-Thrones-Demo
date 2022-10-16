//
//  HouseDetailsEndPoint.swift
//  GOT
//
//  Created by Mahmoud Diab on 15/10/2022.
//

import Foundation

enum HouseDetailsEndPoint: Endpoint {
    case getCharacter(url: URL)
}

extension HouseDetailsEndPoint {
    var urlRequest: URLRequest? {
        switch self {
        case .getCharacter(let url):
            var urlRequest = URLRequest(url: url )
            urlRequest.httpMethod = "GET"
            return urlRequest
        }
    }
}
