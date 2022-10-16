//
//  Remote.swift
//  GOT
//
//  Created by Mahmoud Diab on 15/10/2022.
//

import Foundation

enum HouseDetailsRemoteType {
    case urlSessionProvider
    
    var remoteEngine: HouseDetailsRemote {
        switch self {
        case .urlSessionProvider:
            return HouseDetailsRemoteURLSession(URLSessionEngine(sessionType: .urlSession(config: .defaultConfig)))
        }
    }
}

protocol HouseDetailsRemote {
    func getCharacter(endPoint: Endpoint, completion: @escaping CharacterRemoteResult)
}

struct HouseDetailsRemoteURLSession: HouseDetailsRemote  {
    private let networkEngine: NetworkEngine
    
    init(_ networkEngine: NetworkEngine) {
        self.networkEngine = networkEngine
    }
    
    func getCharacter(endPoint: Endpoint, completion: @escaping CharacterRemoteResult ){
        guard let request = endPoint.urlRequest else {return}
         
        networkEngine.fetchData(request: request) { (result:Result<CharacterResponseModel, APIError>)  in
            switch result {
            case .success(let result):
                completion(.success(result))
                
            case .failure(let error):
                let error = mapError(error)
                completion(.failure(error))
            }
        }
    }
    
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
