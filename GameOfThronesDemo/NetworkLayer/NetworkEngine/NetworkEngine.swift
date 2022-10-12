//
//  Engine.swift
//  GameOfThronesDemo
//
//  Created by Mahmoud Diab on 12/10/2022.
//

import Foundation

//MARK: Network Engine protocol -
protocol NetworkEngine {
    func fetchData <ResponseType: Decodable>
    (request: URLRequest, completion: @escaping  (Result<ResponseType, APIError>) -> ())
}
