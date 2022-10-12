//
//  APIError.swift
//  GameOfThronesDemo
//
//  Created by Mahmoud Diab on 12/10/2022.
//

import Foundation

enum APIError: Error {
    case offline
    case invalidData
    case requestFailed
    case jsonConversionFail
    case jsonParsingFail
    case responseUnsuccessfull
    case error(error:String)
    case APIError(error:APIErrorModel)
    var code : Int {
        switch self {
        case .offline:
            return 0
        case .invalidData:
            return 1
        case .requestFailed :
            return 2
        case .jsonConversionFail:
            return 3
        case .jsonParsingFail:
            return 4
        case .responseUnsuccessfull:
            return 5
        case .error:
            return 6
        case .APIError:
            return 7
        }
    }
    var localizedDescription: String {
        switch self {
        case .offline :
            return "APIError.Offline"
        case .invalidData:
            return "APIError.Invalid data"
        case .requestFailed:
            return "APIError.request failed"
        case .jsonConversionFail:
            return "APIError.jsonConversionFail"
        case .jsonParsingFail:
            return "APIError.jsonParsingFail"
        case .responseUnsuccessfull:
            return "APIError.responseUnsuccessful"
        case .error(let error):
            return "\(error)."
        case .APIError(let apiError ):
            return "\(apiError)."
        }
    }
}

struct APIErrorModel : Decodable {
    let code: Int
    let errorType : String?
    let errorDetail : String?
}
