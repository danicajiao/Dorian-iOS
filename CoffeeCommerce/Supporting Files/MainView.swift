//
//  MainView.swift
//  CoffeeCommerce
//
//  Created by Daniel Cajiao on 3/10/22.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            Text("Browse Scene")
                .tabItem {
                    Label("Browse", systemImage: "magnifyingglass")
                }
            Text("Bag Scene")
                .tabItem {
                    Label("Bag", systemImage: "bag")
                }
            Text("Favorites Scene")
                .tabItem {
                    Label("Favorites", systemImage: "heart")
                }
            Text("Profile Scene")
                .tabItem {
                    Label("Profile", systemImage: "person.crop.circle")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
