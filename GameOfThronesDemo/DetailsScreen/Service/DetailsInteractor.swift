//
//  Interactor.swift
//  GOT
//
//  Created by Mahmoud Diab on 15/10/2022.
//

import Foundation
 
// MARK: Result -
typealias CharacterViewResult = (Result<CharacterTarget, DefaultErrorModel>) -> ()

// MARK: Interactor -
protocol HouseDetailsInteractor{
    func getCharacter(url: URL, completion: @escaping CharacterViewResult)
}

struct HouseDetailsRemoteStore: HouseDetailsInteractor {
    // MARK: Properties -
    private let remote: HouseDetailsRemote?
    
    
    // MARK: Initializers -
    init(_ provider: HouseDetailsRemoteType) {
        self.remote = provider.remoteEngine
    }
    
    // MARK: Functions -
    func getCharacter(url: URL, completion: @escaping CharacterViewResult) {
        remote?.getCharacter(endPoint: HouseDetailsEndPoint.getCharacter(url: url)){ result in
            switch result {
            case .success(let character):
                let item = adapt(character)
                completion(.success(item))
                
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
    private func adapt(_ item: CharacterResponseModel) -> CharacterTarget{
        return  CharacterAdapter(item)
    }
}

// MARK: Interactor type -
enum HouseDetailesInteractorType {
    case remote(_ provider: HouseDetailsRemoteType)
    var interactor: HouseDetailsInteractor {
        switch self {
        case .remote(let provider):
            return HouseDetailsRemoteStore(provider)
        }
    }
}
