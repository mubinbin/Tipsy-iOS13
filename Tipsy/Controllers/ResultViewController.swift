//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Binbin Mu on 10/16/24.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var res: Result?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let r = res, let amount = r.amount, let people = r.people, let tip = r.tip {
            totalLabel.text = String(format: "%.2f", amount)
            settingsLabel.text = "Split between \(people) with \(tip) tip"
        } else {
            totalLabel.text = String(format: "%.2f", 0)
            settingsLabel.text = "Something went wrong"
        }
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
}
