//
//  HomeView.swift
//  CoffeeCommerce
//
//  Created by Daniel Cajiao on 2/16/22.
//

import SwiftUI
import WaterfallGrid

extension Color {
    static let backgroundColor = Color("BackgroundColor")
    static let primaryColor = Color("PrimaryColor")
    static let secondaryColor = Color("SecondaryColor")
    static let tertiaryColor = Color("TertiaryColor")
    static let quaternaryColor = Color("QuaternaryColor")
    static let dropShadowColor = Color("DropShadowColor")
    static let fruityGradient = Color("FruityGradient")
    static let chocoGradient = Color("ChocoGradient")
    static let citrusGradient = Color("CitrusGradient")
    static let earthyGradient = Color("EarthyGradient")
    static let floralGradient = Color("FloralGradient")
    static let bannerGradient = Color("BannerGradient")
}

struct HomeView: View {
    
    let coffeeItems = [
        CoffeeItem(brand: "Wonderstate Coffee", name: "Star Valley Decaf", price: 23.0, imgName: "WST-1011_2"),
        CoffeeItem(brand: "Brandywine Coffee", name: "Ethiopia Chelbasa Natural", price: 23.0, imgName: "BDWN-1108"),
        CoffeeItem(brand: "Ritual Coffee", name: "Producer's Pride", price: 23.0, imgName: "RTL-1015_2"),
        CoffeeItem(brand: "Methodical Coffee", name: "Ethiopia Dur Feres", price: 23.0, imgName: "dur-feres-golden-mug_copy")
    ]
    
    let categories = ["Fruity", "Choco", "Citrus", "Earthy", "Floral"]
    let origins = ["Colombia", "Guatemala", "Ethiopia", "Costa Rica", "Kenya"]
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 26) {
                HStack {
                    // TODO: Implement time-based greeting message
                    Text("Good morning, Faith")
                        .frame(maxWidth: 215, alignment: .leading)
                        .font(Font.custom("Poppins-SemiBold", size: 26))
                        .padding(EdgeInsets(top: 28, leading: 0, bottom: 0, trailing: 0))
                    Spacer()
                    // TODO: Add notifications button to the right of greeting Text
                    Image(systemName: "bell.fill")
                        .resizable()
                        .frame(width: 25, height: 25)
                        .padding(EdgeInsets(top: 28, leading: 0, bottom: 0, trailing: 0))
                        .foregroundColor(.primaryColor)
                }
                .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                
                TextField("\(Image(systemName: "magnifyingglass")) Espresso, light roast, floral", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                    .font(Font.custom("Poppins-Regular", size: 14))
                    .padding(EdgeInsets(top: 8, leading: 10, bottom: 8, trailing: 10))
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.secondaryColor, lineWidth: 1)
                    )
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                
                VStack {
                    HStack {
                        Text("Categories")
                            .font(Font.custom("Poppins-SemiBold", size: 20))
                        Spacer()
                        // TODO: Navigate to Categories scene
                        Button("See all \(Image(systemName: "arrow.forward"))") {
                        }
                        .foregroundColor(.primaryColor)
                    }
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10) {
                            ForEach(categories, id: \.self) { category in
                                CategoryButton(category: category)
                            }
                        }
                        .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                    }
                }
                
                BannerButton(bannerType: 1)
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                
                VStack {
                    HStack {
                        Text("Popular")
                            .font(Font.custom("Poppins-SemiBold", size: 20))
                        Spacer()
                        // TODO: Navigate to Browse scene
                        Button("See all \(Image(systemName: "arrow.forward"))") {
                        }
                        .foregroundColor(.primaryColor)
                    }
                    
                    
                    WaterfallGrid(coffeeItems) { coffeeItem in
                        CoffeeItemView(coffeeItem: coffeeItem)
                    }
                    .gridStyle(
                        columnsInPortrait: 2,
                        columnsInLandscape: 3,
                        spacing: 8,
                        animation: nil
                    )
                }
                .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                
                BannerButton(bannerType: 2)
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                
                VStack {
                    HStack {
                        Text("Origins")
                            .font(Font.custom("Poppins-SemiBold", size: 20))
                        Spacer()
                        // TODO: Navigate to Browse scene
                        Button("See all \(Image(systemName: "arrow.forward"))") {
                        }
                        .foregroundColor(.primaryColor)
                    }
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10) {
                            ForEach(origins, id: \.self) { origin in
                                OriginButton(origin: origin)
                            }
                        }
                        .padding(EdgeInsets(top: 0, leading: 20, bottom: 20, trailing: 20))
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
