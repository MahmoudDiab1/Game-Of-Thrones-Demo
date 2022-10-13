//
//  HousesRepo.swift
//  GameOfThronesDemo
//
//  Created by Mahmoud Diab on 12/10/2022.
//

import Foundation

typealias HousesViewResult = (Result<[HouseTarget], GetHousesError>) -> ()

protocol HousesInteractor{
    func getHouses(completion:@escaping HousesViewResult)
}

struct HousesRemoteStore: HousesInteractor {
    
    private let remote: HousesRemote?
    
    init(_ provider: HousesRemoteType) {
        self.remote = provider.remoteEngine
    }
    
    func getHouses(completion: @escaping HousesViewResult) {
        remote?.getHouses(endPoint: .getHouses) { result in
            switch result {
            case .success(let houses):
                let items = adapt(houses)
                completion(.success(items))
                
            case .failure( let error):
                switch error {
                case .offline:
                    completion(.failure(.offline))
                default:
                    completion(.failure(.serverError))
                }
            }
        }
    }
    
    private func adapt(_ items: HousesResponseModel) -> [HouseTarget]{
        return items.map{ HouseAdapter($0) }
    } 
}


enum HousesInteractorType {
    case remote(_ provider: HousesRemoteType)
    
    var interactor: HousesInteractor {
        switch self {
        case .remote(let provider):
            return HousesRemoteStore(provider)
        }
    }
}
