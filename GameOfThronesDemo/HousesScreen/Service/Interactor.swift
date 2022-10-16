//
//  HousesRepo.swift
//  GOT
//
//  Created by Mahmoud Diab on 12/10/2022.
//

import Foundation

// MARK: Houses Result
typealias HousesViewResult = (Result<[HouseTarget], DefaultErrorModel>) -> ()


// MARK: Interactor types
enum HousesInteractorType {
    case remote(_ provider: HousesRemoteType)
    
    var interactor: HousesInteractor {
        switch self {
        case .remote(let provider):
            return HousesRemoteStore(provider)
        }
    }
}


// MARK: Interactor -
protocol HousesInteractor{
    func getHouses(page: Int,completion: @escaping HousesViewResult)
}


struct HousesRemoteStore: HousesInteractor {
    // MARK: Properties -
    private let remote: HousesRemote?
    
    
    // MARK: Initializers -
    init(_ provider: HousesRemoteType) {
        self.remote = provider.remoteEngine
    }
    
    
    // MARK: Functions -
    func getHouses(page: Int,completion: @escaping HousesViewResult) {
        let endPoint =  HousesEndPoint.getHouses(page)
        remote?.getHouses(endPoint: HousesEndPoint.getHouses(page)) { result in
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
