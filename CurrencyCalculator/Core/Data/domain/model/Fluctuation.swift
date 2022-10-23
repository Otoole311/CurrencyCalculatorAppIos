//
//  Fluctuation.swift
//  CurrencyCalculator
//
//  Created by Albert Essilfie on 10/23/22.
//

import Foundation

struct FluctuationContainer: Decodable{
    
    let success, fluctuation:Bool
    let start_date, end_date, base:String
    let rates: [String: FluctuationData]
}

struct FluctuationData: Decodable{
    let start_rate, end_rate,change,chage_pct:Double
}
