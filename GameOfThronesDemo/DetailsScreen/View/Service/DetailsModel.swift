//
//  Model.swift
//  GOT
//
//  Created by Mahmoud Diab on 15/10/2022.
//

import Foundation

// MARK: - Welcome
struct CharacterResponseModel: Decodable {
    let url: String?
    let name, gender, culture, born: String?
    let died: String?
    let titles, aliases: [String]?
    let father, mother, spouse: String?
    let allegiances, books, povBooks: [String]?
    let tvSeries, playedBy: [String]?
}
 
typealias CharacterRemoteResult = (Result<CharacterResponseModel, RemoteError>) -> ()
