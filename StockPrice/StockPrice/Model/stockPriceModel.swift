//
//  stockPriceModel.swift
//  StockPrice
//
//  Created by admin on 4/10/22.
//

import Foundation


class stockPriceModel{
    init(_ name : String, _ symbol : String){
        self.name = name
        self.symbol = symbol
    }
    var name = ""
    var symbol = ""
    var price : Double = 0.0
    var dayHigh : Double = 0.0
    var dayLow : Double = 0.0
    
    
    
    
}
