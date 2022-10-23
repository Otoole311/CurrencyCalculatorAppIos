//
//  FluctuationRequest.swift
//  CurrencyCalculator
//
//  Created by Albert Essilfie on 10/23/22.
//

import Foundation

/**
 Fluctuation endpoint you will be able to retrieve information about how currencies fluctuate on a day-to-day basis. To use this feature, simply append a start_date and end_date and choose which currencies (symbols) you would like to query the API for. Please note that the maximum allowed timeframe is 365 days.
 
 **Parameters**
 
 * end_date: The end date of your preferred timeframe.
 * start_date: The start date of your preferred timeframe.
 * base: Enter the three-letter currency code of your preferred base currency.
 * symbols: Enter a list of comma-separated currency codes to limit output currencies.
 
 */

enum FluctuationRequest:RequestProtocol
{
    case getFluctuationDuringPeriod(end_date:String, start_date:String, base:String?, symbols:[String]?)
    
    var path: String{
        "/exchangerates_data/fluctuation"
    }
    
    var urlParams: [String : String?]{
        
        switch self{
            
        case let .getFluctuationDuringPeriod(end_date, start_date,base, symbols):
            var params = ["end_date":end_date, "start_date": start_date]
            
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
