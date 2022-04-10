//
//  ViewController.swift
//  StockPrice
//
//  Created by admin on 4/10/22.
//

import UIKit

class ViewController: UIViewController, SendStockDelegate {

    @IBOutlet weak var lblDayLow: UILabel!
    @IBOutlet weak var lblDayHigh: UILabel!
    @IBOutlet weak var lblSymbol: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblCompanyName: UILabel!
    @IBOutlet weak var tblView: UITableView!
    
    
    var stockModel : [stockPriceModel]?
    override func viewDidLoad() {
        super.viewDidLoad()
       stockModel = initializeStocks()
        
    }
    func initializeStocks() -> [stockPriceModel]{
        let apple = stockPriceModel("Apple","AAPL");
        let google = stockPriceModel("Alphabet","GOOG");
        let facebook = stockPriceModel("Facebook","FB");
        let amazon = stockPriceModel("Amazon","AMZN");
        let microsoft = stockPriceModel("Mircrosoft Corporation","MSFT");

    var modelArr = [stockPriceModel]()
    modelArr.append(apple)
    modelArr.append(google)
    modelArr.append(facebook)
    modelArr.append(amazon)
    modelArr.append(microsoft)

    return modelArr
}
    func sendStockData(_ StockPriceModel: stockPriceModel) {
        lblSymbol.text = StockPriceModel.symbol
        lblCompanyName.text = StockPriceModel.name
        lblDayHigh.text = "\(StockPriceModel.dayHigh)"
        lblDayLow.text = "\(StockPriceModel.dayLow)"
        lblPrice.text = "\(StockPriceModel.price)"
        
    }
    
    
    
}
