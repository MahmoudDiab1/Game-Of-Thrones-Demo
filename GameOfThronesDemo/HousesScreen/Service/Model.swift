//
//  HousesRemoteResult.swift.swift
//  GOT
//
//  Created by Mahmoud Diab on 13/10/2022.
//

import Foundation 

// MARK: Response Model -
struct HouseModel: Decodable {
    let url: String?
    let name, region, coatOfArms, words: String?
    let titles, seats: [String]?
    let currentLord, heir, overlord: String?
    let founder: String?
    let diedOut: String?
    let ancestralWeapons: [String]?
    let cadetBranches, swornMembers: [String]?
}

// MARK: Result Error -
enum RemoteError: Error {
    case offline
    case invalidData
    case serverError
}

// MARK: House Response Result
typealias HousesResponseModel = [HouseModel]
typealias HousesRemoteResult = (Result<HousesResponseModel, RemoteError>) -> ()
