//
//  Drink.swift
//  Classes
//
//  Created by Костя Симончик on 30.10.22.
//

import UIKit

// class of beer bottle
class Drink {
    let name: String
    let price: Int
    let country: String
    var balance: Double
    
    init(name: String, price: Int, country: String, balance: Double) {
        self.name = name
        self.price = price
        self.country = country
        self.balance = balance
    }
    
}
