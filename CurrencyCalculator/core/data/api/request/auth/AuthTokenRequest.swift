//
//  AuthTokenRequest.swift
//  CurrencyCalculator
//
//  Created by Albert Essilfie on 10/4/22.
//

import Foundation
// 1
enum AuthTokenRequest: RequestProtocol {
    case auth
    // 2
    var path: String {
        "/convert"
        
    }
    // 3
    var headers: [String : String]{
        [
            "apikey": APIConstants.APIKEY
        ]
    }
    // 4
    var addAuthorizationToken: Bool {
        false
    }
    // 5
    var requestType: RequestType {
        .GET
    }
}
