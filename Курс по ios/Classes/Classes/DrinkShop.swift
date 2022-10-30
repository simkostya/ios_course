//
//  DrinkShop.swift
//  Classes
//
//  Created by Костя Симончик on 30.10.22.
//

import Foundation
import UIKit

// singleton manager class
class DrinkShop {
    static let shared = DrinkShop()
    var totalCash = 0
    var totalVolume = 0.0
    // function buying beer
    func buyIt(_ n: Drink) {
        totalCash += n.price
        totalVolume += 0.5
        n.balance -= 0.5
    }
}
