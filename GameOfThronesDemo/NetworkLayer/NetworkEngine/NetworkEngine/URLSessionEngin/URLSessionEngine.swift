//
//  URLSessionEngine.swift
//  GameOfThronesDemo
//
//  Created by Mahmoud Diab on 12/10/2022.
//

import Foundation

//MARK: URLSessionEngine Type -
class URLSessionEngine: NetworkEngine {
    
    // MARK: Properties -
    private var sessionInstance: SessionTypeProtocol?
    
    init(sessionType: SessionType){
        self.sessionInstance = sessionType.instance
    }
    // fetchData without body
    func fetchData <ResponseType:Decodable>
    (request: URLRequest,  completion:@escaping(Result<ResponseType,APIError>)->()) {
      request.log()
        
        let session = sessionInstance?.session
        
        /// Get session Instance
        let task = session?.dataTask(with: request) { data, response, error in
            
            // data?.logResponse()
            if let error = error {
                if (error  as NSError).code == -1009 {
                    completion (.failure(.offline))
                    return
                }
            }
            
            /// requestFailed
            guard let httpResponse = response as? HTTPURLResponse
            else { completion(.failure(.requestFailed)); return}
            /// responseUnsuccessful
            guard httpResponse.statusCode >= 200 && httpResponse.statusCode < 2999 else {
                completion(.failure(.responseUnsuccessfull))
                return
            }
            /// invalidData
            guard let dataResponse = data else {
                completion(.failure(.invalidData))
                return
            }
            
            /// Decode
            do {
                let dataObject = try JSONDecoder().decode(ResponseType.self, from: dataResponse)
                
                DispatchQueue.main.async { completion(.success(dataObject)) }
            } catch {
                let error = try? JSONDecoder().decode(APIErrorModel.self, from: dataResponse)
                DispatchQueue.main.async {
                    if error?.errorType != nil  {
                        guard let errorModelResult = error else { return }
                        completion(.failure(.APIError(error: errorModelResult)))
                    } else {
                        completion( .failure(.jsonConversionFail) )
                    }
                }
            }
        }
        task?.resume()
    }
}
