//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Yun Ni on 2024-05-13.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var billtotal = "0.0"
    var tips = 10
    var numberOfpeople = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()

        totalLabel.text = billtotal
        settingsLabel.text = "Split between \(numberOfpeople) people, with \(tips)% tip."
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
