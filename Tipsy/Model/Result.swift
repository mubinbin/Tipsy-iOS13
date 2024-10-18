//
//  Result.swift
//  Tipsy
//
//  Created by Binbin Mu on 10/18/24.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import Foundation

struct Result {
    var amount: Float?
    var tip: String?
    var people: String?
    
    init(amount: Float? = nil, tip: String? = nil, people: String? = nil) {
        self.amount = amount
        self.tip = tip
        self.people = people
    }
}
