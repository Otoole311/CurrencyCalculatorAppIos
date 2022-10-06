//
//  AccessTokenTestHelper.swift
//  CurrencyCalculatorTests
//
//  Created by Albert Essilfie on 10/6/22.
//

import Foundation
@testable import CurrencyCalculator

enum AccessTokenTestHelper {
  // 1
  static func randomString() -> String {
    let letters = "abcdefghijklmnopqrstuvwxyz"
    return String(letters.shuffled().prefix(8))
  }
  // 2
  static func randomAPIToken() -> APIToken {
    return APIToken(tokenType: "Bearer", expiresIn: 10,
      accessToken: AccessTokenTestHelper.randomString())
  }
    
  // 3
  static func generateValidToken() -> String {
    """
    {
      "token_type": "Bearer",
      "expires_in": 10,
      "access_token": \"\(randomString())\"
    }
    """
  }
}
