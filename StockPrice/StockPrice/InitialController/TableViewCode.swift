//
//  TableViewCode.swift
//  StockPrice
//
//  Created by admin on 4/10/22.
//

import Foundation
import UIKit

extension ViewController : UITableViewDelegate, UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let rows = stockModel?.count else { return 0 }
        return rows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = Bundle.main.loadNibNamed("stockPriceTableViewCell", owner: self, options: nil)?.first as! stockPriceTableViewCell
        
        guard let stockModel1 = stockModel?[indexPath.row] else {return cell}

        
        cell.lblSymbol.text = stockModel1.symbol
        cell.lblCompanyName.text = stockModel1.name
        cell.name = stockModel1.name
        cell.symbol = stockModel1.symbol
        cell.sendstockPriceDelegate = self
        
        return cell
    }
}
