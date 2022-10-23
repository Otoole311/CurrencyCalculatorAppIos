//
//  ConvertRequests.swift
//  CurrencyCalculator
//
//  Created by Albert Essilfie on 10/23/22.
//

import Foundation

/**
 Currency conversion endpoint, which can be used to convert any amount from one currency to another. In order to convert currencies, please use the API's convert endpoint, append the from and to parameters and set them to your preferred base and target currency codes.
 
 **Parameters **
 * amount : the amount to be converted
 * from: The three-letter currency code of the currency you would like to convert from
 * to: The three-letter currency code of the currency you would like to convert to.
 * date: Specify a date (format YYYY-MM-DD) to use historical rates for this conversion.
 
 */
enum ConvertRequest:RequestProtocol{
    
    case convert(amount:Float, from:String, to:String, date:String?)
    
    var path: String{
        "/exchangerates_data/convert"
    }
    
    var urlParams: [String : String?]{
        
        switch self{
            
        case let .convert(amount, from, to,date):
            var params = ["amount": String(amount), "from": from, "to": to ]
            
            if let date = date{
                params["date"] = date
            }
            
            return params
        }
    }
    
    var requestType: RequestType{
        .GET
    }
}
