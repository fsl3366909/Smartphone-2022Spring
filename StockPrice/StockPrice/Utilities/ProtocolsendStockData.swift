//
//  ProtocolsendStockData.swift
//  StockPrice
//
//  Created by admin on 4/10/22.
//

import Foundation
protocol SendStockDelegate{
    
    func sendStockData(_ StockPriceModel : stockPriceModel)
}
