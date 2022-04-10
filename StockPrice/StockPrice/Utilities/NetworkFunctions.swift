//
//  NetworkFunctions.swift
//  StockPrice
//
//  Created by admin on 4/10/22.
//

import Foundation
import PromiseKit
import Alamofire
import SwiftyJSON



func getStockPriceURL(_ symbol : String) -> String{
    let url = "\(APIURL)\(symbol)?apikey=\(apiKey)"
    return url
}



func getStockPrice(_ url : String) -> Promise<stockPriceModel>{
    
    return Promise<stockPriceModel> { seal -> Void in
        
        AF.request(url).responseJSON { response in
        
            if response.error != nil {
                seal.reject(response.error!)
            }
            
            let StockPriceModel = stockPriceModel("", "")
            //get data here

            let stockPriceArray = JSON(response.data!).arrayValue
            
            guard let stockPrice = stockPriceArray.first else {return seal.fulfill(StockPriceModel)}
            
            StockPriceModel.name = stockPrice["name"].stringValue
            StockPriceModel.symbol = stockPrice["symbol"].stringValue
            StockPriceModel.price = stockPrice["price"].doubleValue
            StockPriceModel.dayHigh = stockPrice["dayHigh"].doubleValue
            StockPriceModel.dayLow = stockPrice["dayLow"].doubleValue
            seal.fulfill(StockPriceModel)

        }// end of response

    }// end is return Promise
}// end of function

