//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Joobang Lee on 2022/06/15.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    var totalValue: Float?
    var split: Float?
    var pctValue: Float?
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = String(totalValue ?? 0.0)
        settingsLabel.text = "Split between \(split ?? 0.0) people, with \(String((pctValue ?? 0.0) * 100))% tip."

    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true)
    }
}
