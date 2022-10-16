//
//  HousesRemoteService.swift
//  GameOfThronesDemo
//
//  Created by Mahmoud Diab on 12/10/2022.
//

import Foundation

// MARK: Remote types -
enum HousesRemoteType {
    case urlSessionProvider
    
    var remoteEngine: HousesRemote {
        switch self {
        case .urlSessionProvider:
            return HousesRemoteURLSession(URLSessionEngine(sessionType: .urlSession(config: .defaultConfig)))
        }
    }
}

// MARK: Remote -
protocol HousesRemote {
    func getHouses(endPoint: Endpoint, completion: @escaping HousesRemoteResult)
}

struct HousesRemoteURLSession: HousesRemote  {
    
    // MARK: Properties -
    private let networkEngine: NetworkEngine
    
    
    // MARK: Initializers -
    init(_ networkEngine: NetworkEngine) {
        self.networkEngine = networkEngine
    }
    
    
    // MARK: Functions -
    func getHouses(endPoint: Endpoint, completion: @escaping HousesRemoteResult ){
        guard let request = endPoint.urlRequest else {return}
        
        networkEngine.fetchData(request: request) { (result:Result<HousesResponseModel, APIError>)  in
            switch result {
            case .success(let result):
                completion(.success(result))
                
            case .failure(let error):
                let error = mapError(error)
                completion(.failure(error))
            }
        }
    }
    
    // TODO: Map errors based on a real business requirement
    private func mapError(_ error: APIError)-> RemoteError{
        switch error {
        case .offline, .requestFailed:
            return  .offline
        case .invalidData, .responseUnsuccessfull:
            return .invalidData
        default:
            return .serverError
        }
    }
}
