//
//  APIManagerMock.swift
//  CurrencyCalculatorTests
//
//  Created by Albert Essilfie on 10/6/22.
//

import Foundation
// 1
@testable import CurrencyCalculator

// 2
struct APIManagerMock: APIManagerProtocol {
  // 3
  func perform(_ request: RequestProtocol, authToken: String) async throws -> Data {
    return try Data(contentsOf: URL(fileURLWithPath: request.path), options: .mappedIfSafe)
  }
   // 4
  func requestToken() async throws -> Data {
      Data(AccessTokenTestHelper.generateValidToken().utf8)
  }
}
