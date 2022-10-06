//
//  NetworkError.swift
//  CurrencyCalculator
//
//  Created by Albert Essilfie on 10/3/22.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case unauthorised
    case timeout
    case serverError
    case invalidServerResponse
}
