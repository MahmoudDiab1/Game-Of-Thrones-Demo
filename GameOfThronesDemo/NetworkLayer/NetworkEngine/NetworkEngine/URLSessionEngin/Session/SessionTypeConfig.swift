//
//  SessionTypeConfig.swift
//  GameOfThronesDemo
//
//  Created by Mahmoud Diab on 12/10/2022.
//

import Foundation

enum SessionConfigurationType {
    case defaultConfig
    var config: SessionConfigurationTypeProtocol{
        switch self {
        case .defaultConfig:
            return DefaultSessionConfiguration()
        }
    }
}
protocol SessionConfigurationTypeProtocol {
    var configuration: URLSessionConfiguration { get }
}

struct DefaultSessionConfiguration: SessionConfigurationTypeProtocol {
    var configuration: URLSessionConfiguration = {
        let configuration = URLSessionConfiguration.default
        configuration.allowsCellularAccess = true
        return configuration
    }()
}

