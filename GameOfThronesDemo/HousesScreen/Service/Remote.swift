//
//  HousesRemoteService.swift
//  GameOfThronesDemo
//
//  Created by Mahmoud Diab on 12/10/2022.
//

import Foundation

enum HousesRemoteType {
    case urlSessionProvider
    
    var remoteEngine: HousesRemote {
        switch self {
        case .urlSessionProvider:
            return HousesRemoteURLSession(URLSessionEngine(sessionType: .urlSession(config: .defaultConfig)))
        }
    }
}

protocol HousesRemote {
    func getHouses(endPoint: HousesEndPoint, completion: @escaping HousesRemoteResult)
}

struct HousesRemoteURLSession: HousesRemote  {
    private let networkEngine: NetworkEngine
    
    init(_ networkEngine: NetworkEngine) {
        self.networkEngine = networkEngine
    }
    
    func getHouses(endPoint: HousesEndPoint, completion: @escaping HousesRemoteResult ){
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
    
    private func mapError(_ error: APIError)-> HousesRemoteError{
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
