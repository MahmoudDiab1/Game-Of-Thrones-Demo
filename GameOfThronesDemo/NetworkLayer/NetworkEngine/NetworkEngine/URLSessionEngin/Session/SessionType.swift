//
//  SessionType.swift
//  GameOfThronesDemo
//
//  Created by Mahmoud Diab on 12/10/2022.
//

import Foundation

enum SessionType {
    case urlSession(config: SessionConfigurationType)
    var instance: SessionTypeProtocol {
        switch self {
        case .urlSession(let config):
            switch config {
            case .defaultConfig:
                return DefaultSession(.defaultConfig)
            }
        }
    }
}

protocol SessionTypeProtocol {
    var session: URLSession { get }
}

struct DefaultSession: SessionTypeProtocol {
    var session: URLSession
    init (_ sessionConfigurationType: SessionConfigurationType) {
        session = URLSession(configuration: sessionConfigurationType.config.configuration)
    }
}
