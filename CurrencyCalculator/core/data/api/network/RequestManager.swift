//
//  RequestManager.swift
//  CurrencyCalculator
//
//  Created by Albert Essilfie on 10/3/22.
//

import Foundation

protocol RequestManagerProtocol {
  func perform<T: Decodable>(_ request: RequestProtocol) async throws -> T
}

class RequestManager: RequestManagerProtocol {
    let apiManager: APIManagerProtocol
    let parser: DataParserProtocol
    //let accessTokenManager: AccessTokenManagerProtocol
    // 1
    init(
        apiManager: APIManagerProtocol = APIManager(),
        parser: DataParserProtocol = DataParser() // 2
       // accessTokenManager: AccessTokenManagerProtocol = AccessTokenManager()
    ) {
        self.apiManager = apiManager
        self.parser = parser
        //self.accessTokenManager = accessTokenManager
      }
    
    func perform<T: Decodable>(_ request: RequestProtocol)
      async throws -> T {
        // 1
        let authToken = ""//try await requestAccessToken()
        // 2
        let data = try await apiManager.perform(request,
          authToken: authToken)

        // 3
        let decoded: T = try parser.parse(data: data)
        return decoded
    }
    
//    func requestAccessToken() async throws -> String {
//
////        if accessTokenManager.isTokenValid() {
////            return accessTokenManager.fetchToken()
////        }
//
//        // 1
//        let data = try await apiManager.requestToken()
//        //let token: APIToken = try parser.parse(data: data)
//        let token = ""
//        return token
//
////        try accessTokenManager.refreshWith(apiToken: token)
////          return token.bearerAccessToken
//    }
}
