//
//  ViewController.swift
//  Week4ProtocolAndDelegate
//
//  Created by user204690 on 2/23/22.
//

import UIKit

class ViewController: UIViewController , SendNameDelegate{
    func setName(firstName: String, lastName: String) {
        lblFirstName.text = firstName
        lblLastName.text = lastName
    }
    
    func setWelcomeText(welcomeText: String) {
        lblWelcome.text = welcomeText
    }
    

    @IBOutlet weak var lblLastName: UILabel!
    @IBOutlet weak var lblFirstName: UILabel!
    
    
    @IBOutlet weak var lblWelcome: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func getNameFromUser(_ sender: Any) {
        performSegue(withIdentifier: "Segue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
              if segue.identifier == "Segue" {
                  let secondVC = segue.destination as! GetNameViewController
                  
                  guard let first = lblFirstName.text else{return}
                  guard let last = lblLastName.text else{return}
                  secondVC.firstName = first
                  secondVC.lastName = last
                  
                  secondVC.sendNameDelegate = self
              }
          }
}

