//
//  Convert.swift
//  CurrencyCalculator
//
//  Created by Albert Essilfie on 10/23/22.
//

import Foundation

struct ConvertContainer: Decodable{
    
    let date: String
    let historical: String
    let info: Info
    let query: Query
    let result: Float
    let success: Bool
}

struct Info: Decodable{
    let rate: Float
    let timestamp: Int
}

struct Query:Decodable{
    let amount: Float
    let from: String
    let to : String
}
