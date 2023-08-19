//
//  Order.swift
//  Project10-CupcakeCorner(100SUI)
//
//  Created by Artem on 19.08.2023.
//

import SwiftUI

class Order: ObservableObject {
    
    static let types = ["Vanila", "Strawberry", "Chocolate", "Rainbow"]
    
    @Published var name = ""
    @Published var streetAddress = ""
    @Published var city = ""
    @Published var zip = ""
    @Published var type = 0
    @Published var quantity = 3
    @Published var extraFrosting = false
    @Published var addSprinkless = false
    @Published var specialRequestEnabled = false {
        didSet {
            if specialRequestEnabled == false {
                extraFrosting = false
                addSprinkless = false
            }
        }
    }
    var hasValidAddress: Bool {
        if name.isEmpty || streetAddress.isEmpty || city.isEmpty || zip.isEmpty {
            return false
        }
        return true
    }
    var cost: Double {
        var cost = Double(quantity) * 2
        
        cost += (Double(type) / 2)
        
        if extraFrosting {
            cost += Double(quantity)
        }
        
        if addSprinkless {
            cost += Double(quantity) / 2
        }
        
        return cost
    }
}
