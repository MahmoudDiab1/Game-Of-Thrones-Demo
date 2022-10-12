//
//  HousesEndPoint.swift
//  GameOfThronesDemo
//
//  Created by Mahmoud Diab on 12/10/2022.
//

import Foundation

protocol Endpoint {
    var baseUrl: String {get}
    var scheme: String {get}
    var base: String {get}
    var path: String {get}
    var parameter: [ URLQueryItem ]? {get}
    var method: String {get}
}

extension Endpoint {
    var urlRequest :URLRequest? {
        var request:URLRequest?
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
}
