//
//  HousesEndPoint.swift
//  GameOfThronesDemo
//
//  Created by Mahmoud Diab on 12/10/2022.
//

import Foundation

enum HousesEndPoint: Endpoint {
    case getHouses(_ page: Int)
}

extension HousesEndPoint {
    private var baseUrl: String{
        return "anapioficeandfire.com"
    }
    
    private var method: String {
        return "GET"
    }
    
    private var scheme: String {
        return "https"
    }
    
    private var base: String {
        return baseUrl
    }
    
    private var path : String {
        return "/api/houses/"
    }
    
    private var parameter: [URLQueryItem]? {
        switch self {
        case .getHouses(let page):
            let parameters = [URLQueryItem(name: "page", value: "\(page)")]
            return parameters
        }
    } 
    
    private func buildUrlRequest() -> URLRequest? {
        var request: URLRequest?
        var components = URLComponents()
        components.scheme = self.scheme
        components.host = self.base
        components.path = self.path
        components.queryItems = self.parameter
        if let url = components.url {
            request = URLRequest(url: url)
            request?.httpMethod = self.method
        }
        return request
    }
    
    
    var urlRequest: URLRequest? {
        switch self {
        case .getHouses:
            return buildUrlRequest()
        } 
    }
}
