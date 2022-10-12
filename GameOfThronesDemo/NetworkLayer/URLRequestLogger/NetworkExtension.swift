//
//  NetworkExtension.swift
//  GameOfThronesDemo
//
//  Created by Mahmoud Diab on 12/10/2022.
//

import Foundation

extension URLRequest {
    func log() {
        print("\n")
        print("_______________________________ URLREQUEST _________________________________")
        print("_URL      \(String(describing: self.url!))")
        print("_BODY     \(String(describing: self.httpBody ?? nil))")
        print("_METHOD   \(String(describing: self.httpMethod!))")
        print("_HEADERS  \(self.allHTTPHeaderFields ?? ["":""])")
        print("____________________________________________________________________________")
    }
}
extension Data {
    func logResponse() {
        do {
            let json = try JSONSerialization.jsonObject(with: self, options: [])
            print("\n")
            print("🦋🦋🦋🦋🦋🦋🦋🦋🦋🦋🦋🦋 DATA RESPONSE 🦋🦋🦋🦋🦋🦋🦋🦋🦋🦋")
            print("DATA -> \(self)")
            print("_______")
            print("JSON Object")
            print(json)
            print("🦋🦋🦋🦋🦋🦋🦋🦋🦋🦋🦋🦋🦋🦋🦋🦋🦋🦋🦋🦋🦋🦋🦋🦋🦋🦋🦋🦋🦋")
            
        } catch let error as NSError  {
            print("_________________________ ERROR RESPONSE __________________________________")
            print("_ERR_CODE       \(error.code)")
            print("_ERR_DOMAIN     \(error.domain.description)")
            print("_ERR_USER_INFO  \(error.userInfo.values)")
            print("____________________________________________________________________________")
        }
    }
}
