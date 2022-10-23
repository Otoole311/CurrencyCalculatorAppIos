//
//  ArrayUtils.swift
//  CurrencyCalculator
//
//  Created by Albert Essilfie on 10/23/22.
//

import Foundation

//test.map{String($0)}.joined(separator: ","))

struct ArrayUtils{
    
    static func getArrayContentSeparatedByCommas(_ a:[String])-> String{
        return a.map{String($0)}.joined(separator: ",")
    }
}
