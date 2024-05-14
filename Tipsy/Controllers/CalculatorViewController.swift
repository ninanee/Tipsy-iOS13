//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    var tip = 0.10
    var numOfPeople = 0
    var total = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func tipChanged(_ sender: UIButton) {
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        sender.isSelected = true

        let buttonName = sender.currentTitle!
        
        let buttonTitle = String(buttonName.dropLast())
                
        let buttonTitleAsANumber = Double(buttonTitle)!
     
        tip = buttonTitleAsANumber / 100
        
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        sender.minimumValue = 0
        let senderValue = Int(sender.value)
        splitNumberLabel.text = String(senderValue)
        numOfPeople = senderValue
        
    }
    
    
    @IBAction func calculatedPressed(_ sender: UIButton) {
        let bill = billTextField.text
        if(bill != ""){
            total = Double(bill!)!
        }

        let split = Double ((total * (1+tip)) / Double (numOfPeople))
        print(split)
        
        performSegue(withIdentifier: "transitToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "transitToResult") {
            let destVC = segue.destination as! ResultsViewController
            
            destVC.tips = Int(tip * 100)
            destVC.numberOfpeople = numOfPeople
            destVC.billtotal = String(total)
        }
    }
   
    

}

