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
    @IBOutlet weak var splitNumLabel: UILabel!
    @IBOutlet weak var stepprer: UIStepper!
    
    var res: Result?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Looks for single or multiple taps.
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        updateUI()
    }

    //Calls this function when the tap is recognized.
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    @IBAction func tipChanged(_ sender: UIButton) {
        updateUI(tipButton: sender)
        
        billTextField.endEditing(true)
    }
    
    @IBAction func stepperValChanged(_ sender: UIStepper) {
        splitNumLabel.text = String(format: "%.0f", sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        var tip: Float = 0.0
        res = Result()
        res?.tip = "0%"
        var numOfPeople: Float = 2.0
        var billTotal: Float = 0.0
        
        if let text = splitNumLabel.text {
            numOfPeople = Float(text) ?? 2.0
            res?.people = text
        }
        if tenPctButton.isSelected {
            tip = 0.1
            res?.tip = "10%"
        } else if twentyPctButton.isSelected {
            tip = 0.2
            res?.tip = "20%"
        }
        
        if let billTotalText = billTextField.text {
            billTotal = Float(billTotalText) ?? 0.0
        }
        
        res?.amount = billTotal * (1.0 + tip) / numOfPeople
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    private func updateUI(tipButton: UIButton? = nil) {
        switch tipButton?.currentTitle {
        case "0%":
            zeroPctButton.isSelected = !zeroPctButton.isSelected
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = false
        case "10%":
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = !tenPctButton.isSelected
            twentyPctButton.isSelected = false
        case "20%":
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = !twentyPctButton.isSelected
        default:
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = false
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC: ResultViewController = segue.destination as! ResultViewController
            destinationVC.res = res
        }
    }
}
