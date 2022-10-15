//
//  HousesRemoteResult.swift.swift
//  GameOfThronesDemo
//
//  Created by Mahmoud Diab on 13/10/2022.
//

import Foundation 

enum RemoteError: Error {
    case offline
    case invalidData
    case serverError
}

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

typealias HousesResponseModel = [HouseModel]
typealias HousesRemoteResult = (Result<HousesResponseModel, RemoteError>) -> ()
