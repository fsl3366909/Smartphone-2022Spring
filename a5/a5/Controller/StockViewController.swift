//
//  StockViewController.swift
//  a5
//
//  Created by Ziming Gong on 3/2/22.
//

import UIKit
import SwiftyJSON
import SwiftSpinner
import Alamofire

class StockViewController: UIViewController {

    @IBOutlet weak var lblCapitation: UILabel!
    @IBOutlet weak var lblSysbol: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func getMarketCapitation(_ sender: Any) {
        
        guard let sysbol = lblSysbol.text else{return}
        
        let targetUrl = "\(url)\(sysbol.uppercased())?limit=1&apikey=\(apiKeys)"
        
        AF.request(targetUrl).responseJSON { response in
            SwiftSpinner.hide(nil)
            if response.error  != nil{
                print(response.error)
                return
            }
        
        
            let infos = JSON(response.data!).array
            
            guard let capitalizations = infos!.first else {
                return
            }
            
            let i = Info()
            
            i.symbol = capitalizations["symbol"].stringValue
            i.marketCapitalization = capitalizations["marketCapitalization"].floatValue
            
            self.lblCapitation.text = "\(i.symbol) :$ \(i.marketCapitalization)"
        }
        
    }
    
}
