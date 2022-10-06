//
//  SymbolsRequest.swift
//  CurrencyCalculator
//
//  Created by Albert Essilfie on 10/6/22.
//

import Foundation

enum SymbolsRequest:RequestProtocol{
    case getAllSymbols
    
    var path: String{
        "exchangerates_data/symbols"
    }
    
    var requestType: RequestType{
        .GET
    }
}
