//
//  BannerButton.swift
//  CoffeeCommerce
//
//  Created by Daniel Cajiao on 3/9/22.
//

import SwiftUI

struct BannerButton: View {
    var body: some View {
        
        ZStack {
            Image("coffee-subscription-2048px-3198-3x2-1")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .scaleEffect(1.4)
            ZStack {
                
                Rectangle()
                    .foregroundColor(.clear)
                    .background(.ultraThinMaterial)
                    .cornerRadius(8)

                VStack {
                    Text("Select craft roasters")
                        .font(Font.custom("Poppins-Regular", size: 14))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    HStack(alignment: .firstTextBaseline) {
                        Text("70%")
                            .font(Font.custom("Poppins-Semibold", size: 36))
                        Text("off")
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Text("See all items \(Image(systemName: "arrow.right"))")
                        .font(Font.custom("Poppins-Regular", size: 12))
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .foregroundColor(.quaternaryColor)
                .padding(14)
            }
            .frame(width: 140, height: 140)
            .offset(x: -92, y: 0)
        }
        .frame(maxWidth: .infinity, maxHeight: 160)
        .cornerRadius(8)

        
//        Button("BANNER") {
//        }
//        .foregroundColor(.white)
//        .frame(maxWidth: .infinity, minHeight: 142)
//        .background(Color.red)
//        .cornerRadius(8)
//        .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
    }
}

struct BannerButton_Previews: PreviewProvider {
    static var previews: some View {
        BannerButton()
            .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
            .previewLayout(.sizeThatFits)
    }
}
