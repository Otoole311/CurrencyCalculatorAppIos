//
//  LatestRatesRequest.swift
//  CurrencyCalculator
//
//  Created by Albert Essilfie on 10/23/22.
//

import Foundation

enum LatestRateRequest: RequestProtocol
{
    case getLatestRate(base:String?, symbols:[String]?)
    
    var path: String{
        "/exchangerates_data/latest"
    }
    
    var urlParams: [String : String?]{
        
        switch self
        {
            
        case let .getLatestRate(base, symbols):
            var params:[String:String] = [:]
            
            if let base = base{
                params["base"] = base
            }
            
            if let symbols = symbols{
                params["symbols"] = ArrayUtils.getArrayContentSeparatedByCommas(symbols)
            }
            
            return params
        }
    }
    
    var requestType: RequestType{
        .GET
    }
}
