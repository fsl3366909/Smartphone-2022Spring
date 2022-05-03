//
//  ViewController.swift
//  BMI
//
//  Created by admin on 5/3/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var weighttextfield: UITextField!
    
    @IBOutlet weak var heightfeettextfield: UITextField!
    
    @IBOutlet weak var heightinchtextfield: UITextField!
    
    @IBOutlet weak var BMIlabel: UILabel!
    
    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func BMICalculateAction(_ sender: Any) {
        let doubleHF=Double(heightfeettextfield.text!)
        let doubleHI=Double(heightinchtextfield.text!)
        let doubleweight=Double(weighttextfield.text!)
        BMIlabel.text=String (format: "%.2f", calculation(heightfeet: doubleHF!,heightinch: doubleHI!,weight: doubleweight!))
       
        if calculation(heightfeet: doubleHF!,heightinch: doubleHI!,weight: doubleweight!)<=18.5
        {
            label.text = "Underweight"
            
        }
        if calculation(heightfeet: doubleHF!,heightinch: doubleHI!,weight: doubleweight!)<25&&calculation(heightfeet: doubleHF!,heightinch: doubleHI!,weight: doubleweight!)>18.5        {
            label.text = "Healthy Weight"
            
        }
        if calculation(heightfeet: doubleHF!,heightinch: doubleHI!,weight: doubleweight!)<30&&calculation(heightfeet: doubleHF!,heightinch: doubleHI!,weight: doubleweight!)>=25        {
            label.text = "Over Weight"
            
            if calculation(heightfeet: doubleHF!,heightinch: doubleHI!,weight: doubleweight!)>=30
        {
            label.text = "Obese"
            
        }
        
    }
    func calculation(heightfeet: Double, heightinch: Double, weight: Double) -> Double {
        let hf = heightfeet*12
        let hi = heightinch
        let w = weight
        let h = hf+hi
        var result = w/(h*h)*703
        result=floor(result*10)/10
        
        return result
    }
    
}

}
