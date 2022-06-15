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
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var result: Float = 0.0
    var bill: Float?
    var split: Float?
    var pctRate: Float?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
 
        switch sender {
        case zeroPctButton:
            zeroPctButton.isSelected = true
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = false
        case tenPctButton:
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = true
            twentyPctButton.isSelected = false
        case twentyPctButton:
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = true
        default:
            print("Error")
        }
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(Int(sender.value))
    }
    
    @IBAction func calculatePressed(_ sender: UIButton){
        let pctValue:[Float:Bool] = [
            0.0 : zeroPctButton.isSelected,
            0.1 : tenPctButton.isSelected,
            0.2 : twentyPctButton.isSelected
        ]
        
        let billText: String?
        billText = billTextField.text
        bill = Float(billText ?? "0.0") ?? 0.0
        
        let splitNumber: String?
        splitNumber = splitNumberLabel.text
        split = Float(splitNumber ?? "0") ?? 0.0
        
        for pct in pctValue {
            if pct.value == true {
                pctRate = Float(String(pct.key)) ?? 0.0
            }
        }
        
        result = ((bill ?? 0.0) * (1.0 + (pctRate ?? 0.0))) / (split ?? 0.0)
        print("결과: \(result)")
        performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult"{
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.totalValue = result
            destinationVC.split = split
            destinationVC.pctValue = pctRate
            
        }
    }
}

