//
//  LatestRate.swift
//  CurrencyCalculator
//
//  Created by Albert Essilfie on 10/23/22.
//

import Foundation

struct LatestContainer:Decodable{
    
    let success: Bool
    let timestamp: Int
    let base, date: String
    let rates: [String: Double]
}
