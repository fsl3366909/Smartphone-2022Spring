//
//  ViewController.swift
//  Asignment3-2
//
//  Created by user204690 on 2/15/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var tblView: UITableView!
    let images = ["food1","food2","food3","food4","food5","food6", "food7","food8","food9","food10"]
        let imageNames = ["food1","food2","food3","food4","food5","food6", "food7","food8","food9","food10"]
        override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view.
        }

        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
               return images.count
           }
           
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = Bundle.main.loadNibNamed("TableViewCell", owner: self, options: nil)?.first as! TableViewCell
               
               cell.imgView.image = UIImage(named:images[indexPath.row])
               cell.lblImage.text = imageNames[indexPath.row]
               
               return cell
           }

}

