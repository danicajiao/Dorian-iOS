//
//  CoffeeItem.swift
//  Dorian
//
//  Created by Daniel Cajiao on 3/8/22.
//

import Foundation
import SwiftUI

class Item: Identifiable, ObservableObject {
    let id: String
    let brand: String
    let name: String
    let price: Float
    let imgPath: String
    var imgData: Data = Data()
    @Published var favorited = false
    
    init(id: String, brand: String, name: String, price: Float, imgPath: String) {
        self.id = id
        self.brand = brand
        self.name = name
        self.price = price
        self.imgPath = imgPath
    }
    
    func printItem() {
        print(self.brand + " " +
              self.name + " " +
              self.imgPath + " " +
              self.favorited.description)
    }
    
}
