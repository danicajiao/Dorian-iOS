//
//  CoffeeItem.swift
//  CoffeeCommerce
//
//  Created by Daniel Cajiao on 3/8/22.
//

import Foundation
import SwiftUI

class CoffeeItem: Identifiable, ObservableObject {
    let id: UUID
    let brand: String
    let name: String
    let price: Float
    let imgName: String
    @Published var favorited = false
    
    init(brand: String, name: String, price: Float, imgName: String) {
        self.id = UUID()
        self.brand = brand
        self.name = name
        self.price = price
        self.imgName = imgName
    }
    
}
