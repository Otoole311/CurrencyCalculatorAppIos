//
//  Symbol.swift
//  CurrencyCalculator
//
//  Created by Albert Essilfie on 10/6/22.
//

import Foundation

struct SymbolsContainer: Decodable{
    let succes: Bool
    let symbols: [String: String]
}
