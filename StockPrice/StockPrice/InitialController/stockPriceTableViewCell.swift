//
//  stockPriceTableViewCell.swift
//  StockPrice
//
//  Created by admin on 4/10/22.
//

import UIKit

class stockPriceTableViewCell: UITableViewCell {

    @IBOutlet weak var lblSymbol: UILabel!
    @IBOutlet weak var lblCompanyName: UILabel!
    
    var name = ""
    var symbol = ""
    
    var sendstockPriceDelegate :SendStockDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    @IBAction func getPriceAction(_ sender: Any) {
        
        let currentURL = getStockPriceURL(symbol)
        print(currentURL)
        
        
        getStockPrice(currentURL).done { stockPriceModel in
            stockPriceModel.name = self.name
            self.sendstockPriceDelegate?.sendStockData(stockPriceModel)
            
        }
        .catch { error in
            print(error.localizedDescription)
        }
    }
}
