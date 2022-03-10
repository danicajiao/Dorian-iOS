//
//  CoffeeItemView.swift
//  CoffeeCommerce
//
//  Created by Daniel Cajiao on 3/6/22.
//

import SwiftUI

struct CoffeeItemView: View {
    @StateObject var coffeeItem: CoffeeItem
    
    var body: some View {
        ZStack(alignment: .bottom) {
            
            Rectangle()
                .frame(height: 180)
                .cornerRadius(8)
                .foregroundColor(.white)
                .shadow(color: .dropShadowColor, radius: 20)
            
            VStack {
                ZStack {
                    Image(coffeeItem.imgName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    LikeButton(enabled: $coffeeItem.favorited)
                        .offset(x: 60, y: -60)
                        .shadow(color: .dropShadowColor, radius: 20)
                }
                
                VStack {
                    Text(coffeeItem.name)
                        .font(Font.custom("Poppins-Regular", size: 14))
                        .foregroundColor(.secondaryColor)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Text("$" + String(coffeeItem.price))
                        .font(Font.custom("Poppins-Regular", size: 16))
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(EdgeInsets(top: 0, leading: 10, bottom: 10, trailing: 5))
            }
        }
        .frame(maxWidth: 158)
    }
}

struct CoffeeItemView_Previews: PreviewProvider {
    static var previews: some View {
        CoffeeItemView(coffeeItem: CoffeeItem(brand: "Wonderstate Coffee", name: "Star Valley Decaf", price: 23.0, imgName: "WST-1011_2"))
            .previewLayout(.sizeThatFits)
    }
}
