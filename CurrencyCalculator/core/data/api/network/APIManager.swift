//
//  APIManager.swift
//  CurrencyCalculator
//
//  Created by Albert Essilfie on 10/3/22.
//

import Foundation

/**
 This method expects an object that conforms to RequestProtocol,
 an authentication token and returns Data.
 If the request fails, it throws an error.
 */
protocol APIManagerProtocol {
    func perform(_ request: RequestProtocol, authToken: String) async throws -> Data
    //func requestToken() async throws -> Data
}


class APIManager: APIManagerProtocol {
    
    private let urlSession: URLSession

    
    init(urlSession: URLSession = URLSession.shared) {
        self.urlSession = urlSession
    }
    
    //apimanager protocol function
    func perform(_ request: RequestProtocol, authToken: String = "") async throws -> Data {
      // 1
      let (data, response) = try await urlSession.data(for: request.createURLRequest(authToken: authToken))
      // 2
      guard let httpResponse = response as? HTTPURLResponse,
        httpResponse.statusCode == 200
      else {
        // 3
        throw NetworkError.invalidServerResponse
      }
      return data
    }

//    func requestToken() async throws -> Data {
//      try await perform(AuthTokenRequest.auth)
//    }
}
